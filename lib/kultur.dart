import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

// containerleri single childa al
class kultur extends StatefulWidget {
  const kultur({super.key});

  @override
  State<kultur> createState() => _kulturState();
}

class _kulturState extends State<kultur> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      'lib/imgs/cultur/kultur.mp4', // Video URL'si
    );

    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      // Video otomatik başlasın
      _controller.play();
      // Video döngüye girsin
      _controller.setLooping(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    try {
      // Video oynatıcıyı başlat
      _initializeVideoPlayerFuture = _controller.initialize().then((_) {
        // Video otomatik başlasın
        _controller.play();
        // Video döngüye girsin
        _controller.setLooping(true);
      });
    } catch (e) {
      print("Video yüklenirken bir hata oluştu: $e");
    }
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/imgs/cultur.jpg"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.50),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.5,
            title: Text("Türkyedeki Kültür Rotalarını Keşfet",
              style: TextStyle(
                color: Colors.white,
              ),),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Text("Kültür Rotaları",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Divider(
                        color: Colors.white24,
                        thickness: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 400, height: 300,
                        child: FutureBuilder(
                          future: _initializeVideoPlayerFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState
                                .done) {
                              // Video oynatıcı hazır olduğunda, VideoPlayer widget'ını döndürün
                              return AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              );
                            } else {
                              // Video oynatıcı hazır olana kadar, bir yüklenme göstergesi gösterin
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                    ),
                    //------------------------------------------------
                    //---Avrupa Tarihi Termal Kentleri Rotası
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: const Divider(
                        color: Colors.white24,
                        thickness: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Avrupa Tarihi Termal Kentleri Rotası ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amberAccent,
                        ),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 500,
                      margin: EdgeInsets.all(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'lib/imgs/cultur/avrupa.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Kaplıca ve ılıca gibi su kaynaklarının tedavi aracı olarak kullanılması Termalizm olarak adlandırılır.  ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
//---Zeytin Ağacı Rotası
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: const Divider(
                        color: Colors.white24,
                        thickness: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Zeytin Ağacı Rotası ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amberAccent,
                        ),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 500,
                      margin: EdgeInsets.all(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'lib/imgs/cultur/zeytin.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Zeytin ağacının tarihi milyonlarca yıl öncesine kadar dayanır. Bu ağaç efsanevi ve kutsal kabul edilir. ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
//--Avrupa Yahudi Mirası Güzergahı
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: const Divider(
                        color: Colors.white24,
                        thickness: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Avrupa Yahudi Mirası Güzergahı  ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amberAccent,
                        ),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 500,
                      margin: EdgeInsets.all(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'lib/imgs/cultur/jewish.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Avrupa Yahudi Mirası Güzergahı (ERJH) gelişen turizm, kültürel girişimler ve alanlarla ilgili eğitim programlarını destekleyen bir platformdur. ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
//--Avrupa Endüstriyel Miras Rotası
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: const Divider(
                        color: Colors.white24,
                        thickness: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Avrupa Endüstriyel Miras Rotası ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amberAccent,
                        ),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 500,
                      margin: EdgeInsets.all(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'lib/imgs/cultur/sanayi.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Avrupa Endüstriyel Miras Rotası (ERIH) çok önemli ve ilgi çekici endüstriyel miras alanlarından oluşan bir ağdır.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
//--Demir Perde İzi
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: const Divider(
                        color: Colors.white24,
                        thickness: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Demir Perde İzi",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amberAccent,
                        ),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 500,
                      margin: EdgeInsets.all(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'lib/imgs/cultur/demir.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("1. Dünya Savaşı’nın sona ermesinin ardından neredeyse yarım yüzyıl boyunca Doğu ve Batı Avrupa’yı ikiye bölen fiziksel bir sınır vardı.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
//--Avrupa Seramik Rotası
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: const Divider(
                        color: Colors.white24,
                        thickness: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Avrupa Seramik Rotası",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amberAccent,
                        ),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 500,
                      margin: EdgeInsets.all(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'lib/imgs/cultur/seramik.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Avrupa Seramik Rotası, seramik sanatının gelişimini ve Avrupa ülkelerinin miraslarının ortak bir kültürel mirasa nasıl katkı sağlayabileceğini göstermek amacıyla başlatılan kültür rotalarının içinde yer alır. ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
//--Avrupa Megalitik Kültür Rotası
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: const Divider(
                        color: Colors.white24,
                        thickness: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Avrupa Megalitik Kültür Rotası",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amberAccent,
                        ),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 500,
                      margin: EdgeInsets.all(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'lib/imgs/cultur/megalithicculturedesktop.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Avrupa Megalitik Kültür Rotası, tarih öncesi taş işçiliği komplekslerinin yer aldığı Avrupa Konseyi kültür yollarından biridir.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
                    //--Aeneas Kültür Rotası
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: const Divider(
                        color: Colors.white24,
                        thickness: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Aeneas Kültür Rotası",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amberAccent,
                        ),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 500,
                      margin: EdgeInsets.all(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'lib/imgs/cultur/aeneas.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Aeneas Kültür Rotası Türkiye’den başlayan Avrupa Konseyi tescilli ilk ve tek kültür rotasıdır. Temellerini Aeneas destanından alan Aeneas Kültür Rotası 5 Avrupa ve Akdeniz ülkesini birbirine bağlayan, Türkiye Kuzey-Batı Ege Denizi’nin kıyılarından başlayıp İtalya’nın Latium sahiline kadar uzanan bir arkeolojik güzergâhtır.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),


                    SizedBox(height: 50,),
                  ],
                ),
              ),
            ),


          ),
        ),
      ],
    );
  }
}
