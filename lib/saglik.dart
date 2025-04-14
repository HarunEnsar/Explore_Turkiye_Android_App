import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

// containerleri single childa al
class saglik extends StatefulWidget {
  const saglik({super.key});

  @override
  State<saglik> createState() => _saglikState();
}

class _saglikState extends State<saglik> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      'lib/imgs/saglik/saglik.mp4', // Video URL'si
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
              image: AssetImage("lib/imgs/saglik.jpg"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.50),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.5,
            title: Text("Türkyedeki Sağlılkı Yaşamı Keşfet",
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
                    Text("Sağlılkı Yaşam",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.lightGreenAccent,
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
                        "Kaplıcalar ve Spa Tesisleri",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreenAccent,
                        ),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 500,
                      margin: EdgeInsets.all(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'lib/imgs/saglik/kaplica.png',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Türkiye’nin kaplıcaları ve spa tesisleri en yüksek standartlara sahiptir ve mükemmel bir üne sahiptir. Kaplıcalar ve termal hamam tesisleri ziyaretçilerin rahatlamasına, çok çeşitli özel uygulamaların keyfini çıkarmasına ve tedavi edici sulardan ve diğer şifalı terapilerden yararlanırken hem fiziksel hem de zihinsel olarak dinlenmesine olanak sağlar.",
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
                        "Türk Hamamları",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreenAccent,
                        ),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 500,
                      margin: EdgeInsets.all(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'lib/imgs/saglik/hamam.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Türk hamamları, şifalı suları ve Anadolu coğrafyasındaki köklü geçmişiyle ülkemizin sağlık ve sağlıklı yaşam turizminde çok önemli bir yere sahiptir.",
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
                        "Akdeniz Diyeti",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreenAccent,
                        ),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 500,
                      margin: EdgeInsets.all(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'lib/imgs/saglik/akdeniz.png',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Akdeniz diyeti, dünyanın en sağlıklı diyetlerinden biri olarak kabul edilir. Gıda çeşitliliğinin sağlık üzerindeki faydaları açısından önemi tespit edilmiş olan Akdeniz diyetinin en önemli özelliği, çeşitliliği ve yüksek beslenme kalitesidir. Günlük beslenmedeki bu çeşitlilik Türkiye genelinde her zaman mevcuttur.",
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
