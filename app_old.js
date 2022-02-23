const { Client, MessageMedia } = require('whatsapp-web.js');
const express = require('express');
const { body, validationResult } = require('express-validator');
const socketIO = require('socket.io');
const qrcode = require('qrcode');
const http = require('http');
const fs = require('fs');
const { phoneNumberFormatter } = require('./helpers/formatter');
const fileUpload = require('express-fileupload');
const axios = require('axios');
const mime = require('mime-types');

//mysql
var mysql = require('mysql');

var db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
	database: "db_avira"
});

db.connect(function(err) {
    //if (err) throw err;
    console.log("Connected!");
});

const port = process.env.PORT || 8000;

const app = express();
const server = http.createServer(app);
const io = socketIO(server);

app.use(express.json());
app.use(express.urlencoded({
  extended: true
}));
app.use(fileUpload({
  debug: true
}));

const SESSION_FILE_PATH = './whatsapp-session.json';
let sessionCfg;
if (fs.existsSync(SESSION_FILE_PATH)) {
  sessionCfg = require(SESSION_FILE_PATH);
}

app.get('/', (req, res) => {
  res.sendFile('index.html', {
    root: __dirname
  });
});

const client = new Client({
  restartOnAuthFail: true,
  puppeteer: {
    headless: true,
    args: [
      '--no-sandbox',
      '--disable-setuid-sandbox',
      '--disable-dev-shm-usage',
      '--disable-accelerated-2d-canvas',
      '--no-first-run',
      '--no-zygote',
      '--single-process', // <- this one doesn't works in Windows
      '--disable-gpu'
    ],
  },
  session: sessionCfg
});

client.on('message', async(msg) => {
  if(msg.body == '!ping'){
    msg.reply('pong');
  }else if (msg.body == '!groups') {
    client.getChats().then(chats => {
      const groups = chats.filter(chat => chat.isGroup);

      if (groups.length == 0) {
        msg.reply('You have no group yet.');
      } else {
        let replyMsg = '*YOUR GROUPS*\n\n';
        groups.forEach((group, i) => {
          replyMsg += `ID: ${group.id._serialized}\nName: ${group.name}\n\n`;
        });
        replyMsg += '_You can use the group id to send a message to the group._'
        msg.reply(replyMsg);
      }
    });
  }else if(msg.body === 'Jadwal Sidang'){
    msg.reply("Jadwal sidang dapat di lihat di link berikut ini \n\n http://sipp.pn-rantau.go.id/list_jadwal_sidang");
  }else if(msg.body === 'Menu'){
		// const chat = await msg.getChat();
		const user = await msg.getContact();
		console.log(msg.getQuotedMessage());
		var pesan = 'Selamat datang @'+user.pushname+' Silahkan pilih menu di bawah ini:\n\n';
    // var pesan = 'Selamat datang\n\n';
		db.connect(function(err) {    
			let sql = "SELECT nama_menu_utama, keterangan_menu_utama  FROM tb_menu_utama";
			db.query(sql, function (err, rows) {
				// if (err) throw err;
				//console.log(result);
				var no = 1;				
				rows.forEach( (row) => {
				  //console.log(`${no}. ${row.nama_menu_utama} silahkan tekan ${row.unique_link_menu_utama}`);
				  pesan += no+". "+ row.nama_menu_utama+" silahkan ketik *"+ row.keterangan_menu_utama+"*\n\n";
				  no++;
				});
				console.log(pesan);
				client.sendMessage(msg.from, pesan);				
			});
			
		});		
	}else{
		var pesan = 'Silahkan pilih menu di bawah ini:\n\n';
		let sql = "SELECT * FROM v_bantuan where keterangan_menu_utama ='"+msg.body+"'";
		db.connect(function(err){
			db.query(sql, function(err, rows){
				if(rows.length > 0){				
					let sql1 = "SELECT * FROM v_bantuan where id_menu_utama ='"+rows[0]['id_menu_utama']+"'";
					// let sql = "SELECT * FROM tb_bantuan where id_menu_utama ='"+message.body+"'";
					db.connect(function(err){
						db.query(sql1, function (err, rows) {
							if(rows.length > 0){
								var no = 1;				
								rows.forEach( (row) => {						
									pesan += no+". "+ row.nama_bantuan+" silahkan ketik *"+ row.id_panggilan+"*\n\n";
									no++;
								});
								pesan += 'Untuk kembali ke menu utama silahkan ketik *menu*';
								console.log(pesan);
								client.sendMessage(msg.from, pesan);
							}else{
								let sql2 = "SELECT * FROM v_bantuan where id_panggilan ='"+msg.body+"'";
								db.connect(function(err){
									db.query(sql2, function (err, rows) {
										if(rows.length == 1){
											console.log(rows.length);
											client.sendMessage(msg.from, rows[0]['jawaban'].toString());
										}else{
											console.log(rows.length);
											client.sendMessage(msg.from, "Mohon maaf, kata kunci yang anda masukkan tidak tersedia\n\nUntuk kembali ke menu utama silahkan ketik *Menu*");
										}	
									});
								});
														
							}	
						});
					});
				}else{
					let sql2 = "SELECT * FROM v_bantuan where id_panggilan ='"+msg.body+"'";
					db.connect(function(err){
						db.query(sql2, function (err, rows) {
							if(rows.length == 1){
								console.log(rows.length);
								client.sendMessage(msg.from, rows[0]['nama_bantuan'].toString() +"\n\n"+ rows[0]['jawaban'].toString() + "\n\nUntuk kembali ke menu utama silahkan ketik *Menu*");
							}else{
								console.log(rows.length);
								client.sendMessage(msg.from, "Mohon maaf, kata kunci yang anda masukkan tidak tersedia\n\nUntuk kembali ke menu utama silahkan ketik *Menu*");
							}	
						});
					});
				}	
			});
		});		
	}

  // Downloading media
  if (msg.hasMedia) {
    msg.downloadMedia().then(media => {
      // To better understanding
      // Please look at the console what data we get
      console.log(media);

      if (media) {
        // The folder to store: change as you want!
        // Create if not exists
        const mediaPath = './downloaded-media/';

        if (!fs.existsSync(mediaPath)) {
          fs.mkdirSync(mediaPath);
        }

        // Get the file extension by mime-type
        const extension = mime.extension(media.mimetype);
        
        // Filename: change as you want! 
        // I will use the time for this example
        // Why not use media.filename? Because the value is not certain exists
        const filename = new Date().getTime();

        const fullFilename = mediaPath + filename + '.' + extension;

        // Save to file
        try {
          fs.writeFileSync(fullFilename, media.data, { encoding: 'base64' }); 
          console.log('File downloaded successfully!', fullFilename);
        } catch (err) {
          console.log('Failed to save the file:', err);
        }
      }
    });
  }
});

client.initialize();

// Socket IO
io.on('connection', function(socket) {
  socket.emit('message', 'Connecting...');

  client.on('qr', (qr) => {
    console.log('QR RECEIVED', qr);
    qrcode.toDataURL(qr, (err, url) => {
      socket.emit('qr', url);
      socket.emit('message', 'QR Code received, scan please!');
    });
  });

  client.on('ready', () => {
    socket.emit('ready', 'Whatsapp is ready!');
    socket.emit('message', 'Whatsapp is ready!');
  });

  client.on('authenticated', (session) => {
    socket.emit('authenticated', 'Whatsapp is authenticated!');
    socket.emit('message', 'Whatsapp is authenticated!');
    console.log('AUTHENTICATED', session);
    sessionCfg = session;
    fs.writeFile(SESSION_FILE_PATH, JSON.stringify(session), function(err) {
      if (err) {
        console.error(err);
      }
    });
  });

  client.on('auth_failure', function(session) {
    socket.emit('message', 'Auth failure, restarting...');
  });

  client.on('disconnected', (reason) => {
    socket.emit('message', 'Whatsapp is disconnected!');
    fs.unlinkSync(SESSION_FILE_PATH, function(err) {
        if(err) return console.log(err);
        console.log('Session file deleted!');
    });
    client.destroy();
    client.initialize();
  });
});


const checkRegisteredNumber = async function(number) {
  const isRegistered = await client.isRegisteredUser(number);
  return isRegistered;
}

// Send message
app.post('/send-message', [
  body('number').notEmpty(),
  body('message').notEmpty(),
], async (req, res) => {
  const errors = validationResult(req).formatWith(({
    msg
  }) => {
    return msg;
  });

  if (!errors.isEmpty()) {
    return res.status(422).json({
      status: false,
      message: errors.mapped()
    });
  }

  const number = phoneNumberFormatter(req.body.number);
  const message = req.body.message;

  const isRegisteredNumber = await checkRegisteredNumber(number);

  if (!isRegisteredNumber) {
    return res.status(422).json({
      status: false,
      message: 'The number is not registered'
    });
  }

  client.sendMessage(number, message).then(response => {
    res.status(200).json({
      status: true,
      response: response
    });
  }).catch(err => {
    res.status(500).json({
      status: false,
      response: err
    });
  });
});

// Send media
app.post('/send-media', async (req, res) => {
  const number = phoneNumberFormatter(req.body.number);
  const caption = req.body.caption;
  const fileUrl = req.body.file;

  // const media = MessageMedia.fromFilePath('./image-example.png');
  // const file = req.files.file;
  // const media = new MessageMedia(file.mimetype, file.data.toString('base64'), file.name);
  let mimetype;
  const attachment = await axios.get(fileUrl, {
    responseType: 'arraybuffer'
  }).then(response => {
    mimetype = response.headers['content-type'];
    return response.data.toString('base64');
  });

  const media = new MessageMedia(mimetype, attachment, 'Media');

  client.sendMessage(number, media, {
    caption: caption
  }).then(response => {
    res.status(200).json({
      status: true,
      response: response
    });
  }).catch(err => {
    res.status(500).json({
      status: false,
      response: err
    });
  });
});

const findGroupByName = async function(name) {
  const group = await client.getChats().then(chats => {
    return chats.find(chat => 
      chat.isGroup && chat.name.toLowerCase() == name.toLowerCase()
    );
  });
  return group;
}

// Send message to group
// You can use chatID or group name, yea!
app.post('/send-group-message', [
  body('id').custom((value, { req }) => {
    if (!value && !req.body.name) {
      throw new Error('Invalid value, you can use `id` or `name`');
    }
    return true;
  }),
  body('message').notEmpty(),
], async (req, res) => {
  const errors = validationResult(req).formatWith(({
    msg
  }) => {
    return msg;
  });

  if (!errors.isEmpty()) {
    return res.status(422).json({
      status: false,
      message: errors.mapped()
    });
  }

  let chatId = req.body.id;
  const groupName = req.body.name;
  const message = req.body.message;

  // Find the group by name
  if (!chatId) {
    const group = await findGroupByName(groupName);
    if (!group) {
      return res.status(422).json({
        status: false,
        message: 'No group found with name: ' + groupName
      });
    }
    chatId = group.id._serialized;
  }

  client.sendMessage(chatId, message).then(response => {
    res.status(200).json({
      status: true,
      response: response
    });
  }).catch(err => {
    res.status(500).json({
      status: false,
      response: err
    });
  });
});

// Clearing message on spesific chat
app.post('/clear-message', [
  body('number').notEmpty(),
], async (req, res) => {
  const errors = validationResult(req).formatWith(({
    msg
  }) => {
    return msg;
  });

  if (!errors.isEmpty()) {
    return res.status(422).json({
      status: false,
      message: errors.mapped()
    });
  }

  const number = phoneNumberFormatter(req.body.number);

  const isRegisteredNumber = await checkRegisteredNumber(number);

  if (!isRegisteredNumber) {
    return res.status(422).json({
      status: false,
      message: 'The number is not registered'
    });
  }

  const chat = await client.getChatById(number);
  
  chat.clearMessages().then(status => {
    res.status(200).json({
      status: true,
      response: status
    });
  }).catch(err => {
    res.status(500).json({
      status: false,
      response: err
    });
  })
});

server.listen(port, function() {
  console.log('App running on *: ' + port);
});
