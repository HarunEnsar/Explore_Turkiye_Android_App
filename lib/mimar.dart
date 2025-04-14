import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

// containerleri single childa al
class mimar extends StatefulWidget {
  const mimar({super.key});

  @override
  State<mimar> createState() => _mimarState();
}

class _mimarState extends State<mimar> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      'lib/imgs/mimar/mimari.mp4', // Video URL'si
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
              image: AssetImage("lib/imgs/mimar.jpg"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.50),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.5,
            title: Text("Mimari Harikaları Keşfet",
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
                    Text("Mimari Harikalar",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.orangeAccent,
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
                    //------------------------------------------------
                    SizedBox(height: 20,),
                    Text("Mimari Miras",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 30
                      ),),
                    SizedBox(height: 20,),
                    Container(
                      width: 400,
                      margin: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'lib/imgs/mimar/mimari miras.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    //çatalhöyük
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Çatalhöyük, Dünyanın En Eski Şehirlerinden Biri:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 400,
                      margin: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'lib/imgs/mimar/catalhoyuk-konya.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text("Türkiye'nin mimari mirası Çatalhöyük, M.Ö. 7400'e kadar uzanan dünyanın en eski kentsel yerleşim yerlerinden biridir.\n\nEvlerin sıra dışı düzeni ve çatı yoluyla erişim gibi özellikleriyle tanınır.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
                    //---pirene
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Priene, Antik Çağların en iyi korunmuş Klasik Kenti:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 400,
                      margin: EdgeInsets.all(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'lib/imgs/mimar/priene-aydin.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text("M.Ö. 4. yüzyılda inşa edilen Priene, antik dünyanın altın çağında benzersiz bir antik kent silueti sunar.\n\nŞehir planının Hippodamya tarzında geliştirilmesi, mimari açıdan ileri bir adım olarak kabul edilir.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
                    //---Mimaride Roma Dönemi:
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Mimaride Roma Dönemi:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 400,
                      margin: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'lib/imgs/mimar/ancient-roman-bath-yozgat.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text("Türkiye'nin antik mimari kalıntıları genellikle Pax Romana dönemine, M.S. 1. ve 2. yüzyıllara aittir.\n\nHamam, jimnastik, çeşme ve tapınak gibi anıtsal yapılar, lüks ve refah döneminde ortaya çıkmıştır.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    //---Selçuklu Mimarisi:
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Selçuklu Mimarisi:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 400,
                      margin: EdgeInsets.all(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'lib/imgs/mimar/1-karatay-madrasa-konya.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text("Selçuklu Devleti, ticaret güzergahlarını güvence altına almak amacıyla kervansaraylar inşa ederek büyük bir mimari proje başlatmıştır.\n\nSelçuklu mimarisinde, İslami tasavvuf, mistisizm ve Şamanizm etkisiyle özgün bir tarz gelişmiştir.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    //---Osmanlı Mimarisi:
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Osmanlı Mimarisi:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 400,
                      margin: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'lib/imgs/mimar/selimiye-mosque-edirne.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 400,
                      margin: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'lib/imgs/mimar/1-suleymaniye-mosque-istanbul.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text("Osmanlı mimarisi, Bizans ve Selçuklu mimarisinden etkilenmiş ve Mimar Sinan liderliğinde zirveye ulaşmıştır.\n\nİstanbul'daki Süleymaniye ve Edirne'deki Selimiye gibi camiler, Osmanlı mimarisinin başyapıtlarından bazılarıdır.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Divider(
                        color: Colors.white24,
                        thickness: 10,
                      ),
                    ),
                    SizedBox(height: 20,),
                    //-------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Osmanlı İmparatorluk Mimarisi",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 30
                        ),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 400,
                      margin: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'lib/imgs/mimar/osmanlı-miras.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    //çatalhöyük
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "İstanbul'un tarihi yarımadasında, günümüzün Sultanahmet Meydanı’nda yer alan Topkapı Sarayı, 400 yılı aşkın bir süre boyunca Osmanlı İmparatorluğu'nun ana ikametgahı ve idari karargahı olarak hizmet vermiştir. ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Divider(
                        color: Colors.white24,
                        thickness: 10,
                      ),
                    ),
                    SizedBox(height: 20,),
//-------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Modern Mimari",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 30
                        ),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 400,
                      margin: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'lib/imgs/mimar/modern-mimari.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    //çatalhöyük
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Mimar Kemalleddin Bey ve Vedat Tek'in öncülüğünü yaptığı, 20. yüzyılın başlarından başlayıp 1930'lara kadar devam eden yeni bir ulusal mimarlık akımı gözlenmektedir. ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Divider(
                        color: Colors.white24,
                        thickness: 10,
                      ),
                    ),
                    SizedBox(height: 20,),
//----------------------------------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Yerel Mimari Tarzlar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 30
                        ),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 400,
                      margin: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'lib/imgs/mimar/yerel-mimari.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    //çatalhöyük
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Yalı, günümüzde İstanbul boğazındaki güzel köşkleri ve evleri anlatmak için kullanılmaktadır.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Divider(
                        color: Colors.white24,
                        thickness: 10,
                      ),
                    ),
                    SizedBox(height: 20,),
                    //----------------------------------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Mimari Tasarımlar ve Teknikler",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 30
                        ),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 400,
                      margin: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'lib/imgs/mimar/mimari-teknik.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    //çatalhöyük
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Bu üslup ilk olarak 12. yüzyılda Selçuklu Türkleri ile birlikte ortaya çıkmış ve daha sonra Osmanlılar tarafından yoğun olarak kullanılmıştır. ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Divider(
                        color: Colors.white24,
                        thickness: 10,
                      ),
                    ),
                    SizedBox(height: 20,),
//----------------------------------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Tarihin Ünlü Mimarları",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 30
                        ),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 400,
                      margin: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'lib/imgs/mimar/ünlü-mimarlar.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    //çatalhöyük
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "1490 doğumlu, Mimar Sinan veya Koca Mimar Sinan (Büyük Mimar Sinan), zamanında Osmanlı İmparatorluğu'nun baş imparatorluk mimarıdır. ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    Container(
                      width: 400,
                      margin: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'lib/imgs/mimar/mimarlar.png',
                          scale: 2,
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
