const qrcode = require('qrcode-terminal');
const fs = require('fs');

const { Client, LocalAuth } = require('whatsapp-web.js');

const SESSION_FILE_PATH = './session.json';

// Load the session data if it has been previously saved
let sessionData;
if(fs.existsSync(SESSION_FILE_PATH)) {
    sessionData = require(SESSION_FILE_PATH);
}

//const client = new Client();
// Use the saved values
const client = new Client({
    puppeteer: {
		executablePath: '/usr/bin/brave-browser-stable',
	},
	authStrategy: new LocalAuth({
		clientId: "client-one"
	}),
	puppeteer: {
		headless: true,
	}
});

client.on('authenticated', (session) => {
  console.log('WHATSAPP WEB => Authenticated');
});

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

db.on('error', function(err) {
  console.log("[mysql error]",err);
});

client.on('qr', (qr) => {
    // Generate and scan this code with your phone
    console.log('QR RECEIVED', qr);
	qrcode.generate(qr, {small: true});
});

client.on('ready', () => {
    console.log('Client is ready!');
});

client.on('message', msg => {
	var text = msg.body.toLowerCase();
    if (msg.body == '!ping') {
        msg.reply('pong');
    }else if(text === 'permisi'){
		var pesan = "Selamat datang🙂‚, saya merupakan Bot Whatsapp Informasi Permohonan mohon maaf apabila pelayanan kami belum maksimal. 🙏 untuk memilih layanan silahkan ketik *menu*";
		client.sendMessage(msg.from, pesan);
	}else if(text === 'menu'){
		// const chat = await msg.getChat();
		// const user = await msg.getContact();
		console.log(msg.getQuotedMessage());
		var pesan = 'Selamat datang, Silahkan pilih menu di bawah ini:\n\n';
    // var pesan = 'Selamat datang\n\n';
		db.connect(function(err) {    
			let sql = "SELECT nama_menu_utama, keterangan_menu_utama  FROM tb_menu_utama";
			db.query(sql, function (err, rows) {
				// if (err) throw err;
				//console.log(result);
				var no = "✅";				
				rows.forEach( (row) => {
				  //console.log(`${no}. ${row.nama_menu_utama} silahkan tekan ${row.unique_link_menu_utama}`);
				  pesan += no+ row.nama_menu_utama+" silahkan ketik *"+ row.keterangan_menu_utama+"*\n\n";
				//   no++;
				});
				console.log(pesan);
				client.sendMessage(msg.from, pesan);				
			});
			
		});		
	}else{
		var pesan = 'Silahkan pilih menu di bawah ini:\n\n';
		let sql = "SELECT * FROM v_bantuan where keterangan_menu_utama ='"+text+"'";
		db.connect(function(err){
			db.query(sql, function(err, rows){						
				if(rows.length > 0){
					console.log(rows.length);
					let sql1 = "SELECT * FROM v_bantuan where id_menu_utama ='"+rows[0]['id_menu_utama']+"'";
					// let sql = "SELECT * FROM tb_bantuan where id_menu_utama ='"+message.body+"'";
					db.connect(function(err){
						db.query(sql1, function (err, rows) {
							if(rows.length > 0){
								var no = "✅";				
								rows.forEach( (row) => {						
									pesan += no + row.nama_bantuan+" silahkan ketik *"+ row.id_panggilan+"*\n\n";
									//no++;
								});
								pesan += 'Untuk kembali ke menu utama silahkan ketik *menu*';
								console.log(pesan);
								client.sendMessage(msg.from, pesan);
							}else{
								let sql2 = "SELECT * FROM tb_menu_utama where keterangan_menu_utama ='"+text+"'";
								db.connect(function(err){
									db.query(sql2, function (err, rows) {
										if(rows.length == 1){
											console.log(rows.length);
											client.sendMessage(msg.from, rows[0]['jawaban_menu_utama'].toString() + "\n\nUntuk kembali ke menu utama silahkan ketik *Menu*");
										}else{
											console.log(rows.length);
											client.sendMessage(msg.from, "Mohon maaf 🙏, kata kunci yang anda masukkan tidak tersedia\n\nUntuk kembali ke menu utama silahkan ketik *Menu*");
										}	
									});
								});
														
							}	
						});
					});
				}else{
					console.log(rows.length);
					let sql2 = "SELECT * FROM v_menu_utama where keterangan_menu_utama ='"+text+"'";
					db.connect(function(err){
					  db.query(sql2, function (err, rows) {
						  if(rows.length > 0){
							  console.log(rows.length);
							  client.sendMessage(msg.from, rows[0]['jawaban_menu_utama'].toString() + "\n\nUntuk kembali ke menu utama silahkan ketik *Menu*");
						  }else{
							  let sql2 = "SELECT * FROM v_bantuan where id_panggilan ='"+text+"'";
							  db.connect(function(err){
								  db.query(sql2, function (err, rows) {
									  if(rows.length > 0){
										  console.log(rows.length);
										  client.sendMessage(msg.from, rows[0]['nama_bantuan'].toString() +"\n\n"+ rows[0]['jawaban'].toString() + "\n\nUntuk kembali ke menu utama silahkan ketik *Menu*");
									  }else{
										  console.log(rows.length);
										  client.sendMessage(msg.from, "Mohon maaf 🙏, kata kunci yang anda masukkan tidak tersedia\n\nUntuk kembali ke menu utama silahkan ketik *Menu*");
									  }	
								  });
							  });
						  }	
					  });
					});					
				}
			});
		});
	}
});

client.initialize();
