import 'package:flutter/material.dart';
import 'package:proje2/anaSayfa.dart';
import 'package:proje2/uyePage.dart';
import 'package:sqflite/sqflite.dart';

class giris extends StatefulWidget {
  @override
  State<giris> createState() => _girisState();
}

class _girisState extends State<giris> {
  TextEditingController kullaniciAdController = TextEditingController();
  TextEditingController sifreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/imgs/giris.jpg"), // <-- BACKGROUND IMAGE
            fit: BoxFit.cover,
          ),
        ),
      ),
        Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.35),
          appBar: AppBar(
            backgroundColor:  Colors.transparent, // <-- APPBAR WITH TRANSPARENT BG
            elevation: 0.2 ,
            title: Text("Giriş Sayfası"),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Text("Hoş Geldiniz",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        offset: Offset(0,3),
                        blurRadius: 13
                      )
                    ]
                  ),),
                  SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.red,
                      ),
                      controller: kullaniciAdController,

                      decoration: InputDecoration(
                          hintText: "example@example.com",
                        prefixIcon: Icon(Icons.email_outlined,color: Colors.white,),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.white), //<-- SEE HERE
                          ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.red), //<-- SEE HERE
                        ),
                        labelText: "Mail",labelStyle: TextStyle(
                        color: Colors.white,
                      )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: sifreController,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password,color: Colors.white,),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.white), //<-- SEE HERE
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.red), //<-- SEE HERE
                          ),
                          labelText: "Parola",labelStyle: TextStyle(
                        color: Colors.white,
                      )
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            // Kullanıcı adı ve şifre veritabanında var mı kontrol et.
                            var db = await openDatabase("kullanicilar.db", version: 1, onCreate: (db, version) {
                              db.execute("CREATE TABLE kullanicilar (kullanici_adi TEXT, sifre TEXT)");
                            });

                            var sonuc = await db.query("kullanicilar", where: "kullanici_adi = ? AND sifre = ?", whereArgs: [
                              kullaniciAdController.text,
                              sifreController.text,
                            ]);

                            // Kullanıcı adı ve şifre eşleşiyorsa ana sayfaya yönlendir.
                            if (sonuc.isNotEmpty && (kullaniciAdController.text.isNotEmpty && sifreController.text.isNotEmpty)) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> anaSayfa()));
                            } else {
                              // Kullanıcı adı ve şifre eşleşmiyorsa hata mesajı göster.
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Mail veya Parola yanlış."),
                                ),
                              );
                            }
                          },
                          child: Text("Giriş Yap"),
                        ),
                        SizedBox(width: 15,),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> uyePage()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text("Üye ol")],
                            )),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
