import 'package:flutter/material.dart';
import 'package:proje2/muze.dart';
import 'package:proje2/mimar.dart';
import 'package:proje2/saglik.dart';
import 'package:proje2/su.dart';
import 'package:proje2/gastro.dart';
import 'package:proje2/kultur.dart';
import 'main.dart';

class anaSayfa extends StatefulWidget {
  const anaSayfa({super.key});

  @override
  State<anaSayfa> createState() => _anaSayfaState();
}

class _anaSayfaState extends State<anaSayfa> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero ListView',
      debugShowCheckedModeBanner: false,
      theme:
      ThemeData(primarySwatch: Colors.red, platform: TargetPlatform.iOS),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/imgs/kesfet.jpg"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.5),
          appBar: AppBar(title: Text("Keşfet"),
            backgroundColor: Colors.transparent,
            elevation:2,
            leading: new IconButton(
              icon: new Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> MyApp()));

        })),
          body: Column(
            children: [
              Container(
                width: 400,
                margin: EdgeInsets.all(25),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset("lib/imgs/tr2.jpg",
                    scale: 2,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(_Tile[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),),
                      leading: Hero(
                        tag: index,
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Container(
                            //width: 100,
                            margin: EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                _images[index],
                                fit: BoxFit.fitHeight,
                                scale: 2,

                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SecondPage(heroTag: index,)));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SecondPage extends StatelessWidget {
  final int heroTag;
   SecondPage({required this.heroTag,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(_images[heroTag]), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.50),

          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.5,
              title: Text(_Tile[heroTag])),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Hero(
                          tag: heroTag,
                          child: Container(
                              width: 400,
                              margin: EdgeInsets.all(25),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.asset(
                                  _images[heroTag],
                                  scale: 2,
                                ),
                              ),
                              ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                _Text[heroTag],
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:  ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shadowColor:Colors.black87,
                                    elevation: 20,
                                  ),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=> page[heroTag]));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [Text("Daha Fazla Keşfet",style:
                                      TextStyle(
                                        fontSize: 20,
                                        fontFamily: "RobotoMono",
                                      ),)],
                                    ),
                                  )),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}

final List<String> _images = [
  "lib/imgs/muze/muze.jpg",
  "lib/imgs/su.png",
  "lib/imgs/mimar.jpg",
  "lib/imgs/gastro.png",
  "lib/imgs/cultur.jpg",
  "lib/imgs/saglik.jpg",
  ];
final List<String> _Tile = [
  'Müze',
  'Su Ülkesi',
  'Mimari Harikalar',
  'Gastronomia',
  'Kültür Rotaları',
  'Sağlılkı Yaşam'
];
final List<String> _Text = [
  'Anadolu yüzyıllar boyunca pek çok önemli tarihi ana tanık oldu. Türkiye’nin müze ve ören yerlerinde bu çarpıcı tarihe siz de tanık olun.',
  "Türkiye, üç tarafı denizlerle çevrili bir yarımada ülkesidir. Çevredeki denizler, ülkedeki iklim koşulları, bitki örtüsü, hayvan türleri, ulaşım ve turizm gibi birçok alanda büyük bir etkiye sahiptir. Ülke; güneyde Akdeniz, kuzeyde Karadeniz ve batıda Ege Denizi ile çevrilidir. Ülkenin iklimi bölgeye göre değişmekle birlikte Türkiye genelinde çoğunlukla ılıman bir iklim hakimdir.",
  "Avrupa ile Asya arasında köprü görevi gören eşsiz coğrafi konumu ile Türkiye, tarih boyunca farklı kültürlere ev sahipliği yapmıştır. Türkiye'nin her bölgesi, ülkenin genel karakterine zenginlik katan kültürel, coğrafi ve iklimsel koşullar açısından farklı profiller çizmektedir. Çok farklı medeniyetlerin bir araya geldiği bir beşik oluşturan böyle bir manzarada, farklı yaşam biçimlerinin, sanatın ve mimarinin zenginliği göz ardı edilemez. Özellikle Türkiye'nin mimari karakteri ve tarihi söz konusu olduğunda, farklı niteliklere sahip mimariler ön planda karşımıza çıkmaktadır.",
  'Türkiye, kendine özgü iklimiyle dikkat çeken yedi ana bölgeye ayrılmıştır. Bu bölgeler, ürünlerini, mutfak tercihlerini ve geleneklerini etkileyen benzersiz iklim özellikleri sergilemektedir.',
  '19.475 tescilli arkeolojik alanı ile Türkiye tarih ve arkeoloji açısından oldukça zengin bir mirasa ev sahipliği yapar. Türkiye’nin somut ve soyut kültürel mirasının dünyada eşi benzeri yoktur.',
  "Hayatınızı fiziksel, zihinsel ve sosyal olarak dolu dolu yaşayın - Türkiye, sağlıklı yaşam deneyiminizi ve yolculuğunuzu en faydalı şekilde desteklemenize ve tamamlamanıza yardımcı olabilir.",
];
var page = [
  muze(),
  su(),
  mimar(),
  gastro(),
  kultur(),
  saglik(),
 ];

