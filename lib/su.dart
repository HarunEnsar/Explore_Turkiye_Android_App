import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

// containerleri single childa al
class su extends StatefulWidget {
  const su({super.key});

  @override
  State<su> createState() => _suState();
}

class _suState extends State<su> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      'lib/imgs/su/sea.mp4', // Video URL'si
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
              image: AssetImage("lib/imgs/su.png"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.50),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.5,
            title: Text("Su Ülkesini Keşfet",
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
                    Text("SU ÜLKESİ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 30
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Divider(
                        color: Colors.white24,
                        thickness: 10,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Akdeniz Türkiye’de",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 30
                      ),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        "Akdeniz, ılıman iklimi ve düşük yağışlarıyla öne çıkan, Türkiye'nin turizm açısından önemli bir bölgesidir. Antalya şeridindeki uluslararası oteller, tatil köyleri ve yat marinalarıyla gelişmiş olan Akdeniz, konaklama kapasitesinin %35'ini barındırarak deniz turizminin merkezidir. Doğal güzellikleriyle ünlü Akdeniz kıyıları, tarihi zenginlikleriyle dikkat çeken Antalya ve Mersin gibi şehirleri içerir. Akdeniz, güzel plajları, tarihi siteleri ve doğal spor olanaklarıyla tatilciler için çekici bir destinasyondur.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text("Konumu Öğrenmek için Resme Tıklayın",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: CarouselSlider(
                        items: [
                          Container(
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Adrasan-Antalya",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Adrasan,+07350+Kumluca%2FAntalya/@36.3302835,30.432528,15z/data=!3m1!4b1!4m6!3m5!1s0x14c23992d52b10e3:0x6b6db000f57ebf0!8m2!3d36.330284!4d30.432528!16s%2Fm%2F0k951vd?entry=ttu'); // Tıklandığında açılacak URL
                                    },
                                    child: Image.asset(
                                      "lib/imgs/su/1adrasan-antalya.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,

                              child: Column(
                                children: [
                                  Text("Çıralı-Kemer-Antalya",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Çıralı,+Ulupınar,+07982+Kemer%2FAntalya/@36.4175163,30.4671788,15z/data=!3m1!4b1!4m6!3m5!1s0x14c234320cae9a0f:0xfdffc114d210d8db!8m2!3d36.4175!4d30.4775!16zL20vMGYwdDN5?entry=ttu'); // Tıklandığında açılacak URL
                                    },
                                    child: Image.asset(
                                      "lib/imgs/su/2cirali-kemer-antalya-1.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Adrasan-Beach-Antalya",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Adrasan,+07350+Kumluca%2FAntalya/@36.3302835,30.432528,15z/data=!3m1!4b1!4m6!3m5!1s0x14c23992d52b10e3:0x6b6db000f57ebf0!8m2!3d36.330284!4d30.432528!16s%2Fm%2F0k951vd?entry=ttu'); // Tıklandığında açılacak URL
                                    },
                                    child: Image.asset(
                                      "lib/imgs/su/3adrasan-beach-antalya.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Beycik-Antalya",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          "https://www.google.com/maps/place/Beycik,+07982+Kemer%2FAntalya/@36.5041833,30.4138458,15z/data=!3m1!4b1!4m6!3m5!1s0x14c3ccb277cb4a7f:0x2d0ec6ff228ff079!8m2!3d36.504167!4d30.424167!16s%2Fm%2F02pqdy1?entry=ttu");
                                    },
                                    child: Image.asset(
                                      "lib/imgs/su/4beycik-antalya.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Kalkan-Antalya",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Kalkan,+07580+Kaş%2FAntalya/@36.2549071,29.3794805,13z/data=!3m1!4b1!4m6!3m5!1s0x14c02cd0df202115:0x75fbdb7bfae9cdf8!8m2!3d36.2512022!4d29.4295404!16zL20vMDQxMXNm?entry=ttu'); // Tıklandığında açılacak URL
                                    },
                                    child: Image.asset(
                                      "lib/imgs/su/5kalkan-antalya.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Kaş-Antalya",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Kaş%2FAntalya/@36.3756936,29.2631325,10z/data=!3m1!4b1!4m6!3m5!1s0x14c1c87ee2ba4ec3:0x377bcfe6243798c5!8m2!3d36.3078134!4d29.6962677!16s%2Fg%2F1tcwc9b4?entry=ttu');
                                    },
                                    child: Image.asset(
                                      "lib/imgs/su/7kas-antalya-1.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Kaputaş Plajı Kaş, Antalya",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Kaputaş+Plajı/@36.2289726,29.4386178,15z/data=!3m1!4b1!4m6!3m5!1s0x14c1d37060c20369:0xb0509cbcd714c4d5!8m2!3d36.2289562!4d29.448939!16s%2Fm%2F02rfkdt?entry=ttu'); // Tıklandığında açılacak URL
                                    },
                                    child: Image.asset(
                                      "lib/imgs/su/8kaputas-beach-kas-antalya.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Kemer-Antalya",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Kemer,+Antalya/@36.6024256,30.5240575,14z/data=!3m1!4b1!4m6!3m5!1s0x14c3b7a4820a22e7:0x973532648469d291!8m2!3d36.602792!4d30.559762!16zL20vMDZyamtt?entry=ttu');
                                    },
                                    child: Image.asset(
                                      "lib/imgs/su/9kemer-antalya.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Kızkalesi Korykos Kalesi, Mersin",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Kızkalesi,+33790+Erdemli%2FMersin/@36.4653333,34.1364728,15z/data=!3m1!4b1!4m6!3m5!1s0x14d8f2a96074f895:0x9c67dc09078a5556!8m2!3d36.465317!4d34.146794!16s%2Fm%2F0brywqn?entry=ttu');
                                    },
                                    child: Image.asset(
                                      "lib/imgs/su/11kizkalesi-corycus-castle-mersin-.jpg",
                                      height: 400,
                                      width: 400,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Konyaaltı-Antalya",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Konyaaltı%2FAntalya/@36.8195772,30.349153,11z/data=!3m1!4b1!4m6!3m5!1s0x14c3eb3ac320c357:0xedd0acf5da12a492!8m2!3d36.837532!4d30.4818446!16zL20vMDc4OTVu?entry=ttu');
                                    },
                                    child: Image.asset(
                                      "lib/imgs/su/12konyaalti-antalya.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Lara, Antalya",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Lara+Plajı/@36.8498986,30.8172343,14z/data=!3m1!4b1!4m6!3m5!1s0x14c39cc84c9f6227:0x2530b612152e2b04!8m2!3d36.8510917!4d30.8509053!16s%2Fg%2F11bc8cz1wf?entry=ttu');
                                    },
                                    child: Image.asset(
                                      "lib/imgs/su/13lara-antalya.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Olimpos Antik Kenti, Antalya",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Olympos+Antik+Kenti/@36.3955002,30.4696631,17z/data=!3m1!4b1!4m6!3m5!1s0x14c2368ef0f18791:0x870a162e401eaf00!8m2!3d36.3954959!4d30.4722434!16s%2Fg%2F1tsvw5_y?entry=ttu');
                                    },
                                    child: Image.asset(
                                      "lib/imgs/su/14olympos-ancient-city-antalya.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Suluada-Antalya",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Suluada/@36.2386275,30.4613455,15z/data=!3m1!4b1!4m6!3m5!1s0x14c23edb22c879a5:0xe9f339d0c037270b!8m2!3d36.2386111!4d30.4716667!16s%2Fg%2F11g6rklxd1?entry=ttu');},
                                    child: Image.asset(
                                      "lib/imgs/su/15suluada-antalya.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Phaselis Koyu Kemer, Antalya",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Phaselis+Koyu/@36.5243228,30.5468262,17z/data=!3m1!4b1!4m6!3m5!1s0x14c3b59535dd62cb:0x42ca36b1b41e3a52!8m2!3d36.5243185!4d30.5494065!16s%2Fg%2F11d__dqxl4?entry=ttu');},
                                    child: Image.asset(
                                      "lib/imgs/su/16phaselis-bay-kemer-antalya.jpg",
                                      // height: 200,
                                      // width: 200,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          height: 400,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 5),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                        ),
                      ),
                    ),
                   //SizedBox.expand(),
                   //-------------------------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Divider(
                        color: Colors.white24,
                        thickness: 10,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Ege Türkiye’de",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 30
                      ),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        "Ege Denizi, benzersiz adaları, koyları ve etkileyici sahil şeridiyle turistler için çekici bir tatil beldesidir. Ege Bölgesi'nde bulunan şehirler, sıcak ve kuru yazlarıyla popüler turistik destinasyonlardır. Ege Denizi, Akdeniz iklimine sahip olup, İzmir, Kütahya, Muğla, Manisa, Aydın, Uşak, Afyonkarahisar ve Denizli'yi içerir. Bölge, dünyanın en güzel bölgelerinden biridir ve Bodrum, Fethiye, Marmaris gibi destinasyonlarıyla ünlüdür. Bozcaada, adanın güzellikleri ve eşsiz deneyimleriyle öne çıkar. Ayrıca, Efes Antik Kenti, Artemis Tapınağı ve Meryem Ana Evi gibi tarihî zenginliklere ev sahipliği yapar.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text("Konumu Öğrenmek için Resme Tıklayın",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,

                      child:  CarouselSlider(
                        items: [
                          Container(
                            //1
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Fethiye-Babadag",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Babadağ/@36.5283609,29.1460741,14z/data=!3m1!4b1!4m6!3m5!1s0x14c047794acb3f2f:0xd28c34bb664f987!8m2!3d36.5283333!4d29.185!16s%2Fm%2F02z3ldn?entry=ttu');},
                                    child: Image.asset(
                                      "lib/imgs/su/1-fethiye-babadag.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            //2
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,

                              child: Column(
                                children: [
                                  Text("Bozburun-Marmaris",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Bozburun,+48700+Marmaris%2FMuğla/@36.6836903,28.0527981,15z/data=!3m1!4b1!4m6!3m5!1s0x14bfd05d9eca488b:0x67e8f21d5bcd1590!8m2!3d36.683674!4d28.0631193!16s%2Fm%2F02qdsgj?entry=ttu');},
                                    child: Image.asset(
                                      "lib/imgs/su/2bozburun-marmaris.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(//3
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Kuşadası-Aydın",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Kuşadası,+Aydın/@37.8557625,27.2195275,13z/data=!3m1!4b1!4m6!3m5!1s0x14bea92b956a5427:0xd89b725d100f2ef4!8m2!3d37.857913!4d27.261015!16zL20vMDR5Z20z?entry=ttu');},
                                    child: Image.asset(
                                      "lib/imgs/su/3-kusadasi-aydin-3.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(//4
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Cleopatra-Sedir-Adası-Muğla",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          "https://www.google.com/maps/place/Kleopatra+Plaji/@36.9930792,28.1957938,15z/data=!4m10!1m2!2m1!1scleopatra-sedir-island-mugla!3m6!1s0x14bfa47fab2b507d:0x24ad57600b370bcc!8m2!3d36.9930987!4d28.2035277!15sChxjbGVvcGF0cmEtc2VkaXItaXNsYW5kLW11Z2xhWh4iHGNsZW9wYXRyYSBzZWRpciBpc2xhbmQgbXVnbGGSARNoaXN0b3JpY2FsX2xhbmRtYXJrmgEjQ2haRFNVaE5NRzluUzBWSlEwRm5TVU5sTm5OMlQxVlJFQUXgAQA!16s%2Fg%2F11fx9tytwj?entry=ttu");},
                                    child: Image.asset(
                                      "lib/imgs/su/4-cleopatra-sedir-island-mugla.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(//5
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Göcek-Muğla",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Göcek,+Fethiye%2FMuğla/@36.7538612,28.9342398,15z/data=!3m1!4b1!4m6!3m5!1s0x14c065fa398fef15:0x8de56199ebeef49d!8m2!3d36.753433!4d28.942461!16zL20vMGRrMGQ1?entry=ttu');},
                                    child: Image.asset(
                                      "lib/imgs/su/5-gocek-3.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(//6
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Turunç-Marmaris/Muğla",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Turunç,+Marmaris%2FMuğla/@36.7728707,28.2362263,15z/data=!3m1!4b1!4m6!3m5!1s0x14bfbf7dda457617:0xfb9e9955331f89f1!8m2!3d36.7736019!4d28.247851!16s%2Fm%2F0cmckmn?entry=ttu');},
                                    child: Image.asset(
                                      "lib/imgs/su/6-turunc-bay-marmaris.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(//7
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("İztuzu Plajı, Dalyan",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/İZTUZU+PLAJI/@36.7769467,28.6289968,17z/data=!3m1!4b1!4m6!3m5!1s0x14bf88e0da08a73d:0x92291bc5c3786fc!8m2!3d36.7769424!4d28.6315771!16s%2Fm%2F02rn7j2?entry=ttu');},
                                    child: Image.asset(
                                      "lib/imgs/su/7-iztuzu-beach-dalyan.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(//8
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Bozcaada-Çanakkale",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Bozcaada,+Çanakkale/@39.8345796,26.0624309,16z/data=!3m1!4b1!4m6!3m5!1s0x14b01557449518e5:0xbc7c6034bce70bb3!8m2!3d39.834843!4d26.0702!16s%2Fg%2F1yfdrscm8?entry=ttu');},
                                    child: Image.asset(
                                      "lib/imgs/su/8-bozcaada-canakkale.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(//9
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Ölüdeniz Fethiye/Muğla",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Ölüdeniz,+48340+Fethiye%2FMuğla/@36.5691463,29.0992679,13z/data=!3m1!4b1!4m6!3m5!1s0x14c0472b7d50106f:0x700f3910912afe1d!8m2!3d36.570407!4d29.140454!16s%2Fg%2F11bc64v_nw?entry=ttu');},
                                    child: Image.asset(
                                      "lib/imgs/su/9-blue-lagoon-in-oludeniz-fethiye.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          height: 400,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 5),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                        ),
                      ),
                    ),
                    //-------------------------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Divider(
                        color: Colors.white24,
                        thickness: 10,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Marmara Denizi Türkiye’de",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 30
                      ),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        "Marmara Denizi, İstanbul Boğazı ve Çanakkale Boğazları ile bağlantılı bir su kütlesi olarak stratejik öneme sahiptir. İstanbul Boğazı, dünya deniz taşımacılığı için kritik bir geçiş noktasıdır ve en dar noktası Anadolu Hisarı ile Rumeli Hisarı arasındadır. Marmara Denizi'nin balıkçılık potansiyeli yüksektir, ancak deniz taşımacılığı için zorlayıcıdır. Denizdeki adalar, Marmara Adaları, Adalar ve İmralı Adası gibi bölgeleri içerir. İstanbul'da yoğun nüfus ve gelişmiş ulaşım ağı bulunurken, Marmara Denizi çevresindeki bölgeler turistik destinasyonlar ve tarihî zenginliklere ev sahipliği yapar. Kuş Gölü, Manyas Gölü ve Cunda Adası gibi doğal ve kültürel zenginlikler bölgeyi özel kılar. Çanakkale'deki Troya Antik Kenti de tarihi öneme sahip bir UNESCO Dünya Mirası alanıdır.",textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text("Konumu Öğrenmek için Resme Tıklayın",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child:  CarouselSlider(
                        items: [
                          Container(//1
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Boğaziçi Köprüsü",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Ortaköy,+Boğaziçi+Köprüsü,+34347+Beşiktaş%2Fİstanbul/@41.0465463,29.0229506,15z/data=!3m1!4b1!4m6!3m5!1s0x14cab7d02727b61d:0x610428581d04560e!8m2!3d41.0492444!4d29.0302485!16s%2Fg%2F11c5fz4k31?entry=ttu');},
                                    child: Image.asset(
                                      "lib/imgs/su/1-bosphorus-bridge-istanbul.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(//2
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("İzmit",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/İzmit,+Kocaeli/@40.7712146,29.8519281,12z/data=!3m1!4b1!4m6!3m5!1s0x14cb4f66644bfb9d:0x82690ee7586b7eb9!8m2!3d40.7654408!4d29.9408089!16zL20vMDF4XzM2?entry=ttu');},
                                    child: Image.asset(
                                      "lib/imgs/su/2izmit.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(//3
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Yalova",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Yalova,+Yalova+Merkez%2FYalova/@40.6436608,29.2249025,13z/data=!3m1!4b1!4m6!3m5!1s0x14cafacc286b4cb1:0xb60ab599f8c5d1d0!8m2!3d40.654895!4d29.284186!16zL20vMGIzdDc5?entry=ttu');},
                                    child: Image.asset(
                                      "lib/imgs/su/3-yalova.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(//4
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Adalar",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          "https://www.google.com/maps/place/Adalar%2Fİstanbul/@40.8655282,28.9931178,13.17z/data=!4m6!3m5!1s0x14cac1836fcd740b:0x53b57c91c4d72968!8m2!3d40.8740929!4d29.0898721!16zL20vMDFoM3Bo?entry=ttu"); },
                                    child: Image.asset(
                                      "lib/imgs/su/4princes-island-istanbul--4.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(//5
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Boğaziçi",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/İstanbul+Boğazı/@41.1127089,28.9060452,11z/data=!3m1!4b1!4m6!3m5!1s0x14caca68143c999f:0x63005b61fde9dfb5!8m2!3d41.2213125!4d29.1290157!16zL20vMDFsZ2Y0?entry=ttu');},
                                    child: Image.asset(
                                      "lib/imgs/su/5bosphorus-istanbul.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(//6
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Ortaköy-İstanbul",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Ortaköy,+34347+Beşiktaş%2Fİstanbul/@41.0540318,29.0181317,15z/data=!3m1!4b1!4m6!3m5!1s0x14cab7cb58883451:0x41cdb323256c259c!8m2!3d41.0539703!4d29.0270806!16s%2Fg%2F1vgx2zbw?entry=ttu');},
                                    child: Image.asset(
                                      "lib/imgs/su/6-ortakoy-istanbul.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          height: 400,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 5),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                        ),
                      ),
                    ),
                    //-------------------------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Divider(
                        color: Colors.white24,
                        thickness: 10,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Karadeniz Türkiye’de",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 30
                      ),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        "Karadeniz, Türkiye'nin kuzeyinde yer alır ve Gelibolu Boğazı ile İstanbul Boğazı aracılığıyla Akdeniz'e bağlanır. Bölge, balıkçılık ve doğal güzellikleriyle ünlüdür. Hamsi, lüfer gibi balıkların çeşitliliği dikkat çeker. Karadeniz'in deniz dibinde keşfedilen eski batık gemiler, tarihî bir zenginliği gösterir. Yemyeşil manzaralar, kartpostallık yaylalar ve tarihi mekanlar, bölgenin cazibesini artırır. Uzungöl, Fırtına Deresi raftingi gibi aktivitelerle de bilinir. Karadeniz, kültür ve doğanın birleştiği büyüleyici bir destinasyondur.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text("Konumu Öğrenmek için Resme Tıklayın",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: CarouselSlider(
                        items: [
                          Container(//1
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Akçakoca",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Akçakoca,+Düzce/@41.0813983,31.1034244,13z/data=!3m1!4b1!4m6!3m5!1s0x409db3d59a97f919:0x5b9f88736721eb16!8m2!3d41.088181!4d31.1239759!16zL20vMDJ0N252?entry=ttu');},
                                    child: Image.asset(
                                      "lib/imgs/su/1akcakoca-duzce.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(//2
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,

                              child: Column(
                                children: [
                                  Text("Gideros Koyu",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Gideros+Koyu/@41.8591635,32.8545377,17z/data=!3m1!4b1!4m6!3m5!1s0x409ae1bbc3fd43c5:0xa24584e4235bdcb4!8m2!3d41.8591595!4d32.857118!16s%2Fg%2F1q5blks23?entry=ttu');},
                                    child: Image.asset(
                                      "lib/imgs/su/2gideros-bay-kastamonu.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(//3
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Amasra,Bartın",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Amasra,+Bartın/@41.7439005,32.3770308,15z/data=!3m1!4b1!4m6!3m5!1s0x409b0be44ab0f0b7:0x8d97128b9a1b4cb2!8m2!3d41.7470209!4d32.3855369!16zL20vMDdxbl8x?entry=ttu'); // Tıklandığında açılacak URL
                                    },
                                    child: Image.asset(
                                      "lib/imgs/su/4amasra-bartin.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(//4
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Güzelcehisar-Bartın",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          "https://www.google.com/maps/place/Güzelcehisar,+74110+Güzelcehisar%2FBartın+Merkez%2FBartın/@41.6469352,32.2039235,16z/data=!3m1!4b1!4m6!3m5!1s0x409b76636f6be62f:0xb0a8ea307dcd95ee!8m2!3d41.647866!4d32.2092061!16s%2Fm%2F0l8q503?entry=ttu");},
                                    child: Image.asset(
                                      "lib/imgs/su/5guzelcehisar-bartin.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(//5
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Giresun Adası",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Giresun+Adası/@40.9293462,38.4341253,17z/data=!3m1!4b1!4m6!3m5!1s0x40636dec1d43c28f:0xa7a7565b522f7343!8m2!3d40.929432!4d38.4370437!16s%2Fm%2F027m02f?entry=ttu');},
                                    child: Image.asset(
                                      "lib/imgs/su/6giresun-island-giresun.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(//6
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Sinop",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Sinop,+Sinop+Merkez%2FSinop/@42.0141919,35.08862,13z/data=!3m1!4b1!4m6!3m5!1s0x408f12de6b86738d:0xcfa12eddefc640fb!8m2!3d42.027974!4d35.151725!16zL20vMDFicjYy?entry=ttu');},
                                    child: Image.asset(
                                      "lib/imgs/su/7sinop.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(//7
                            margin: EdgeInsets.all(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Trabzon",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.google.com/maps/place/Trabzon/@40.8093489,39.1540568,9z/data=!3m1!4b1!4m6!3m5!1s0x40643c38252c2f9b:0xa564e28fd61368d0!8m2!3d40.799241!4d39.5847944!16zL20vMDN5NDlx?entry=ttu');},
                                    child: Image.asset(
                                      "lib/imgs/su/8trabzon.jpg",
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          height: 400,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 5),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                        ),
                      ),
                    ),
                    //-------------------------
                    SizedBox(height: 50,)
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
