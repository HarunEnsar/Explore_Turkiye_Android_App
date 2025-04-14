import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

// containerleri single childa al
class gastro extends StatefulWidget {
  const gastro({super.key});

  @override
  State<gastro> createState() => _gastroState();
}

class _gastroState extends State<gastro> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      'lib/imgs/gastro/gastro.mp4', // Video URL'si
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
              image: AssetImage("lib/imgs/gastro.png"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.50),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.5,
            title: Text("Türk Gastronomisini Keşfet",
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
                    Text("Gastronomia",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.greenAccent,
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
                    Text("Türk mutfağı",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 30
                      ),),
                    SizedBox(height: 20,),
                    Container(
                      width: 400,
                      margin: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'lib/imgs/gastro/mutfak.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    //---corba
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
                        "Çorbalar",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 500,
                      margin: EdgeInsets.all(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'lib/imgs/gastro/corba.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Çorba özellikle kış aylarında Türk mutfağının vazgeçilmez bir parçasıdır. Mercimek çorbası, ezogelin çorbası, yoğurt çorbası ve tarhana çorbası en çok tercih edilen çorbalardır. Ancak Türk mutfağı bunların yanı sıra sayısız miktarda çorbalar içerir. Etler, sebzeler ve baklagiller genellikle çorbaların ana malzemeleridir. Et suyu, un, yoğurt ve şehriye bu malzemeleri çorba haline getirmek için kullanılır.İşkembe çorbasının alkollü içkilerin neden olduğu baş ağrısına iyi geldiği inancı yaygındır. Özellikle şehirlerde yer alan işkembeci lokantaları geç saatlere kadar açık kalarak müşterilere işkembe çorbası servisi yaparlar.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
                    //---Et yemekleri
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
                        "Et yemekleri",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 400,
                      margin: EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'lib/imgs/gastro/Et yemekleri.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Türk mutfağındaki et yemeklerinin çoğu kebaplar, köfteler ve tencere yemekleri sınıfındaki yemeklerdir.\n\nTürk mutfağında kebap, et, lahmacun kebap yemeği anlamı içerir. Genelde kebaplar lokantalarda yenen ve ızgara yöntemiyle hazırlanan yemeklerdir. Kebaplar arasında döner kebap en sevilen kebaplar arasındadır. Ayrıca Cağ kebabı, Bursa kebabı, Adana kebabı, Urfa kebabı, Tokat kebabı ve pirzola da çok yaygındır.\n\nKöfteler kıymanın ekmek içi, soğan ve çeşitli baharatlarla yoğrularak, şekillendirilip pişirilmesi yoluyla yapılan yemeklerdir. Izgara, fırınlama, kızartma veya sulu yemek olarak yapılabilir. Akçaabat Köftesi, İnegöl Köftesi, Tekirdağ köftesi yurt çapında en çok sevilen köfteler arasındadır.\n\nSulu et yemekleri arasında Güveç, Kağıt Kebabı ve çeşitli Türlü ve Yahniler sayılabilir. Ayrıca Türk mutfağında çok sayıda balık, tavuk ve sakatat yemekleri mevcuttur.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),

                    //---Sebze yemekleri
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
                        "Sebze yemekleri",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 400,
                      margin: EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'lib/imgs/gastro/sebze.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Türk mutfağı, zengin sebze yemekleri çeşitliliğiyle öne çıkar. Dolma ve sarma, etli ve etli olmayan (yalancı) seçeneklerle sunulur. Lahana ve asma yaprağı sarmaları popülerdir. Etli sebze yemekleri arasında karnıyarık, patlıcan musakka, etli kabak, etli bezelye ve daha fazlası bulunur. Kızartma yöntemiyle hazırlanan patlıcan, kabak, biber, domates ve mücver favori kızartma çeşitlerindendir. Zeytinyağlılar arasında fasulye, dolma, enginar ve bakla yer alır. Patlıcanın özel bir yeri vardır; Türk mutfağında dolma, kızartma, musakka, pilav, salata ve ızgara gibi birçok patlıcan yemeği vardır.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
                    //---Hamur işleri
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
                        "Hamur işleri",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 400,
                      margin: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'lib/imgs/gastro/hamur.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Türk mutfağının sevilen hamur işleri arasında lahmacun, etli ekmek, pide, mantı ve börekler bulunmaktadır. Göçebe geçmişe sahip Türkler, et ve süt ürünlerinde uzmanlaşarak hamur işi tariflerinde de deneyim kazanmışlardır. Türk mutfağı sadece Türkiye ile sınırlı kalmamakta, Türk cumhuriyetleri arasında benzerlikler taşımaktadır. Lahmacun ve pideler genellikle fırınlama yöntemiyle hazırlanırken, börekler fırınlama veya kızartma yöntemleriyle çeşitli iç malzemelerle yapılır. Börek konusunda uzmanlaşmış börek salonları zaman içinde ortaya çıkmıştır. Kıyma, peynir, patates ve ıspanak en yaygın börek içleri arasında yer almaktadır. Evlerde hazırlanan börekler genellikle hazır yufka veya açılan yufka kullanılarak yapılırken, Su böreği gibi özel bir tür açılan yufkanın suda kaynatılmasını gerektiren bir işleme sahiptir.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 20,),
                    //---İçecekler
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
                        "İçecekler",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 200,
                      margin: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'lib/imgs/gastro/Fresh_ayran.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Türk mutfağı, dünyanın her yerinde tüketilen gazlı içecekler ve meyve sularının yanı sıra kendine özgü içecekleri bünyesinde barındırır. Ayran, yoğurdun sulandırılmasıyla yapılan ve tamamen Türkiye'ye özgü bir içecektir. Boza, kefir, şalgam suyu ve şerbet gibi soğuk içecekler de Türkiye'nin karakteristik içecekleri arasında yer alır. Sıcak içecekler arasında ise Türk kahvesi ve Türk çayı özel bir konumda bulunur. Türk kahvesi, çekilmiş kahvenin cezve içinde pişirilmesiyle hazırlanır ve fincanlarda servis edilir. Türk çayı ise iki parça çaydanlık veya semaver kullanılarak demlenir ve ince belli çay bardaklarında servis edilir. Alkollü içkiler arasında en çok tercih edileni rakıdır. Üzümden elde edilen alkolün anason tohumu ile damıtılmasıyla elde edilen rakı, Türk mutfağının tarihsel alkollü içkisi olarak öne çıkar. Buna ek olarak, yerli üzümlerden hazırlanan Türk şarapları da dünya çapında lezzet ve çeşitlilik açısından tanınmıştır.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
//---Tatlılar
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
                        "Tatlılar",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 400,
                      margin: EdgeInsets.all(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'lib/imgs/gastro/tatli.jpg',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Türk mutfağı, tatlılar açısından Selçuklu ve Osmanlı imparatorluğu dönemlerinde kültürler arası etkileşimle zenginleşmiş, özellikle Balkanlar ve Anadolu'nun füzyon mutfağından çıkan çeşitlilikle büyük bir tatlı repertuarına sahip olmuştur. Bu dönemde Ortadoğu'nun etkisiyle baklava, kadayıf, künefe gibi hamur işi tatlılar, muhallebi, keşkül, kazandibi, sütlaç gibi sütlü tatlılar, hoşaf, kompostolar, revani, helva, aşure, ve kabak tatlısı gibi geniş bir yelpazede tatlılar geliştirilmiştir. Osmanlı döneminde sefere çıkan yeniçerilere enerji sağlamak amacıyla keşfedilen baklava, ince yufkalar arasına fındık, ceviz veya antep fıstığı ile pişirilip şeker, bal ve pekmez şerbeti ile tatlandırılarak hazırlanır. Tel kadayıf ise ince teller halindeki hamurun içine fındık, fıstık, ceviz gibi malzemeler eklenerek fırında pişirildikten sonra şerbetle tatlandırılır. Sütlü tatlılar arasında kazandibi, tavuk göğsü ve revani önemli bir yer tutar. İrmik helvası gibi tatlılarda irmik kullanılırken, aşure ise birçok bitkisel malzemenin bir araya gelmesiyle hazırlanan özel bir tatlının adıdır. Ayrıca, sonbahar ve kış aylarında tercih edilen kabak tatlısı, Türk mutfağının benzersiz tatlarından biridir. Maraş dövme dondurması, Ahır Dağı'nın eteklerinden beslenen keçilerin sütünden yapılarak özel bir süreçten geçirilen, benzersiz bir Türk dondurma çeşididir.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
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
