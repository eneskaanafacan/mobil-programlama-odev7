const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const app = express();
require('dotenv').config();

app.use(cors());
app.use(express.json());

// MySQL bağlantısını yapalım
const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME
});

// Veritabanı ve tabloyu oluşturma (Uygulama başlatıldığında)
db.connect((err) => {
  if (err) {
    console.error('Veritabanına bağlanılamadı: ' + err.stack);
    return;
  }
  console.log('Veritabanına başarıyla bağlanıldı.');

  // Veritabanı oluşturma
  db.query('CREATE DATABASE IF NOT EXISTS ogrenciDB', (err, result) => {
    if (err) {
      console.error('Veritabanı oluşturulamadı: ' + err.stack);
      return;
    }
    console.log('Veritabanı oluşturuldu ya da zaten var.');

    // Veritabanını seçelim
    db.query('USE ogrenciDB', (err) => {
      if (err) {
        console.error('Veritabanı seçilemedi: ' + err.stack);
        return;
      }

      // Tabloyu oluşturma
      const createTableQuery = `
        CREATE TABLE IF NOT EXISTS ogrenciler (
          ogrenciID INT AUTO_INCREMENT PRIMARY KEY,
          ad VARCHAR(100),
          soyad VARCHAR(100),
          bolumId INT
        )
      `;
      db.query(createTableQuery, (err, result) => {
        if (err) {
          console.error('Tablo oluşturulamadı: ' + err.stack);
          return;
        }
        console.log('Tablo oluşturuldu ya da zaten var.');

        // Örnek veri ekleme
        const insertQuery = `
          INSERT INTO ogrenciler (ad, soyad, bolumId)
          VALUES
            ('Ahmet', 'Yılmaz', 101),
            ('Ayse', 'Demir', 102);
        `;
        db.query(insertQuery, (err, result) => {
          if (err) {
            console.error('Veri eklenemedi: ' + err.stack);
            return;
          }
          console.log('Veriler eklendi.');
        });
      });
    });
  });
});

// Öğrenci verilerini listelemek için API endpointi
app.get('/ogrenciler', (req, res) => { // Bu satırı güncelledik
  db.query('SELECT * FROM ogrenciler', (err, result) => {
    if (err) return res.status(500).send(err);
    res.json(result);
  });
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server ${PORT} portunda çalışıyor.`);
});
