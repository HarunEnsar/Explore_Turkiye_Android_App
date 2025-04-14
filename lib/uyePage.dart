import 'package:flutter/material.dart';
import 'package:proje2/giris.dart';
import 'package:sqflite/sqflite.dart';

class uyePage extends StatefulWidget {
  @override
  State<uyePage> createState() => _uyePageState();
}

class _uyePageState extends State<uyePage> {
  TextEditingController kullaniciAdController = TextEditingController();
  TextEditingController sifreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/imgs/uye.jpg"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.20),
            appBar: AppBar(
              backgroundColor:  Colors.transparent, // <-- APPBAR WITH TRANSPARENT BG
              elevation: 0.2 ,
              title: Text("Üye Ol Sayfası"),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                    children: [
                Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: kullaniciAdController,
                  decoration: InputDecoration(
                      hintText: "example@example.com",
                      prefixIcon: Icon(Icons.email_outlined,color: Colors.white,),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.white), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.lightGreenAccent), //<-- SEE HERE
                      ),
                      labelText: "Mail",labelStyle: TextStyle(
                    color: Colors.white,
                  )
                  ),
                ),
              ),
              Text("yazı"),
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
                  ),              ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                    padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () async{
                          // Kullanıcı adı ve şifreyi veritabanına ekle.
                          var db = await openDatabase("kullanicilar.db", version: 1, onCreate: (db, version) {
                            db.execute("CREATE TABLE kullanicilar (kullanici_adi TEXT, sifre TEXT)");
                          });

                          db.insert("kullanicilar", {
                            "kullanici_adi": kullaniciAdController.text,
                            "sifre": sifreController.text,
                          });

                          // Üye olduktan sonra giriş sayfasına yönlendir.
                          if (kullaniciAdController.text.isNotEmpty && sifreController.text.isNotEmpty) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> giris()));
                          } else {
                            // Kullanıcı adı ve şifre eşleşmiyorsa hata mesajı göster.
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Mail veya Parola Boş olmamalı."),
                              ),
                            );
                          }
                        },
                        child: Text("Üye Ol"),
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);

                    }, child: Text("Vazgeç"))
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
