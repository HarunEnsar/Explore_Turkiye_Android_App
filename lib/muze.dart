import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:proje2/anaSayfa.dart';
import 'package:url_launcher/url_launcher.dart';


class muze extends StatefulWidget {
  const muze({super.key});

  @override
  State<muze> createState() => _muzeState();
}

class _muzeState extends State<muze> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/imgs/muze/muze.jpg"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.70),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.5,
            title: Text("Müzeleri Keşfet",
            style: TextStyle(
              color: Colors.white,
            ),),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text("İSTANBUL ARKEOLOJİ MÜZELERİ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30
                  ),),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("lib/imgs/muze/istanbulArkeolojiMüzesi.jpg",
                        fit: BoxFit.cover,
                        scale: 2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text("İstanbul Arkeoloji Müzeleri, Arkeoloji Müzesi, Eski Şark Eserleri Müzesi ve Çinili Köşk Müzesi olmak üzere üç ana birimden oluşan bir müzeler kompleksidir. Türkiye'nin ilk müzesi olarak bilinen bu kompleks, Osmanlı döneminde tarihi eser toplama merakının izlerini taşır ve İstanbul Arkeoloji Müzeleri 1869 yılında İmparatorluk Müzesi olarak kurularak müzeciliğin kurumsal bir temelini atmıştır. Osman Hamdi Bey'in müze müdürlüğü döneminde, çeşitli kazılardan getirilen önemli eserlerle zenginleşmiş ve Türk müzeciliğinde önemli bir çığır açılmıştır. Müze kompleksi içerisinde yer alan Çinili Köşk, Türk çini ve seramik örneklerinin sergilendiği en eski yapıdır. Eski Şark Eserleri Müzesi ise Osman Hamdi Bey tarafından Güzel Sanatlar Akademisi olarak inşa edilmiş ve daha sonra müzeciliğe tahsis edilmiştir. Arkeoloji Müzesi ise Neo-Klasik mimarinin güzel bir örneği olarak dikkat çeker ve Osman Hamdi Bey'in kazılarının ürünlerini sergilemek için inşa edilmiştir. İstanbul Arkeoloji Müzeleri, Türkiye'nin kültürel mirasını zenginleştiren bir milyonun üzerinde eseri bünyesinde barındırmaktadır.",
                    textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20,
                      color: Colors.white,
                    ),),
                  ),
                  CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Image.asset("lib/imgs/muze/istanbulArkeolojiMüzesi1.jpg",
                            fit: BoxFit.contain,
                            scale: 2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("lib/imgs/muze/istanbulArkeolojiMüzesi2.jpg",
                            scale: 2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("lib/imgs/muze/istanbulArkeolojiMüzesi3.jpg",
                            scale: 2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("lib/imgs/muze/istanbulArkeolojiMüzesi4.jpg",
                            scale: 2,
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 400.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                  ),
                  Text("Konum İçin Haritaya Tıkla",
                  style: TextStyle(
                    color: Colors.white
                  ),),
                  SizedBox(height: 20,),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        launch('https://shorturl.at/hopw2'); // Tıklandığında açılacak URL
                      },
                      child: Image.asset("lib/imgs/muze/istanbulArkeMap.png",
                        fit: BoxFit.cover,
                        scale: 2,
                      ),
                    ),
                  ),
                  //---------------------------------------------------
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Divider(
                      color: Colors.white24,
                      thickness: 10,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("AYASOFYA TARİHİ MÜZESİ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30
                    ),),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("lib/imgs/muze/ayasofyaTarihMüze.jpg",
                        fit: BoxFit.cover,
                        scale: 2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text("Dünya mimarlık tarihinin günümüze kadar ayakta kalmış en önemli anıtları arasında yer alan Ayasofya; mimarisi, ihtişamı, büyüklüğü ve işlevselliği yönünden sanat dünyası açısından önemli bir yer teşkil etmektedir.Defter-i Hakani Nezareti binasında ziyarete açılan Ayasofya Tarihi Müzesi, Ayasofya’nın yaklaşık 1700 yıllık tarihini anlatmaktadır.Müzenin üçüncü katında Roma İmparatorluğu Dönemi, ikinci katında Osmanlı Dönemi, yeni nesil teknolojinin sunduğu imkanlar ile sürükleyici görsel ve işitsel bir gösterim ile anlatılmaktadır. Birinci katında ise, önemli bir bölümü ilk kez sergilenen eserlerin yer aldığı dört bölüm bulunmaktdır: Kilise, Camii, Müze ve yeniden Camii.Ayrıca binanın zemin katındaki pencerelerden Doğu Roma dönemine ait sarnıç izlenebilmektedir. Ayasofya Tarihi Müzesi, Ayasofya’nın zengin tarihini bütünsel bir perspektif ile yaşamak isteyenler için benzersiz bir deneyim sunuyor.",textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),),
                  ),
                  CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.all(1),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Image.asset("lib/imgs/muze/ayasofyaTarihMüze1.jpg",
                            fit: BoxFit.contain,
                            scale: 2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("lib/imgs/muze/ayasofyaTarihMüze2.jpg",
                            scale: 2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("lib/imgs/muze/ayasofyaTarihMüze3.jpg",
                            scale: 2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("lib/imgs/muze/ayasofyaTarihMüze4.jpg",
                            scale: 2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("lib/imgs/muze/ayasofyaTarihMüze5.jpg",
                            scale: 2,
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 400.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                  ),
                  Text("Konum İçin Haritaya Tıkla",
                    style: TextStyle(
                        color: Colors.white
                    ),),
                  SizedBox(height: 20,),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        launch('https://shorturl.at/bnxK0'); // Tıklandığında açılacak URL
                      },
                      child: Image.asset("lib/imgs/muze/ayasofyaMuzeMap.png",
                        fit: BoxFit.cover,
                        scale: 2,
                      ),
                    ),
                  ),
//-----------------------------------------------------------------------------------------
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Divider(
                      color: Colors.white24,
                      thickness: 10,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("EFES ÖRENYERİ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30
                    ),),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("lib/imgs/muze/efesOrenMuze.jpg",
                        fit: BoxFit.cover,
                        scale: 2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text("Dünyanın Yedi Harikasından Bir İzmir Efes Örenyeri'nde\n\nAntikçağ’ın Anadolu başkenti Efes son derece görkemli bir metropolis. Eşsiz mimari eserleri binlerce yıldır ayakta olan bu mega antik şehir, Dünya Miras Listesi'ne de girdi. Anadolu'nun ana tanrıça (Kybele) geleneğine dayalı, antik dünyanın yedi harikasından Artemis Tapınağı'nın da Efes'te olması önemini artırıyor. Efes Örenyeri'nde başta Hellenistik ve Roma olmak üzere; farklı uygarlıklara ait üst düzey kentleşme, mimarlık ve din tarihinin simgeleri bulunuyor.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20,
                      color: Colors.white
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text("Hem Politik Hem Ticari Bir Merkez\n\nEfes, tarih öncesinden başlayarak Hellenistik, Roma, Bizans (Doğu Roma), Beylikler ve Osmanlı Dönemleri boyunca kesintisiz yerleşim gördü ve her zaman politik ve ticari bir merkez oldu. M.Ö. 7000 yıla kadar uzanan tarihi boyunca bilim, kültür ve sanatta önemli rol oynayan Efes, antik dünyanın en önemli metropollerinden. Doğu ile Batı (Asya ve Avrupa) arasında başlıca kapı ve önemli bir liman kentiydi. Bu konumunu hiç kaybetmeden gelişmeyi sürdürdü.Yılda ortalama 1,5 milyon ziyaretçi ağırlayan antik kentteki kazıların geçmişi 125 yıla yaklaşıyor. Henüz tamamı ortaya çıkarılamayan Efes, Anadolu arkeolojisine yeni boyutlar kazandırmaya devam ediyor.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text("Celçus Kütüphanesi, Antik Tiyatro ve Daha Nicesi\n\nAralarında üç kilometre olan; 'aşağı' ve 'yukarı' diye adlandırılan iki kapısı bulunuyor. Efes Örenyeri ile özdeşleşen en ünlü kalıntı, muazzam sütunlarıyla hayranlık uyandıran 'Celcus Kütüphanesi'. M.S. 2. Yüzyıla tarihlenen bu kütüphane, İskenderiye ve Pergamon'dan sonra, antik çağın en önemli kütüphanelerinden biridir. İmparator Hadrian adına yapılmış olan Kuretler Caddesi üzerinde bulunan Hadrian Kapısı ve Hadrian Tapınağı da dikkat çeken yapılar arasındadır. Antik Dünyadın 7 harikasından biri olan Artemision, yaklaşık 25 bin kişilik oturma kapasitesiyle büyük tiyatro, stadyum, ticaret ve devlet agoraları, Hestia Tapınağını (şehrin kutsal ateşi) içinde bulunduran Prytaneum, yaklaşık 1800 kişilik odeon (meclis ve konser salonu) ve antik liman da görülmesi gereken diğer kalıntılar.Örenyeri sınırları içindeki Yamaçevler kendi içinde ayrı girişe sahiptir. Hz. Meryem'in İsa'nın annesi olarak kabul ve ilan edildiği 431 tarihli Ekümenik Konsülün gerçekleştiği Meryem Kilisesi de mutlaka görülmeli.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),),
                  ),
                  CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.all(1),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Image.asset("lib/imgs/muze/efesOrenMuze1.jpg",
                            fit: BoxFit.contain,
                            scale: 2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("lib/imgs/muze/efesOrenMuze2.jpg",
                            scale: 2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("lib/imgs/muze/efesOrenMuze3.jpg",
                            scale: 2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("lib/imgs/muze/efesOrenMuze4.jpg",
                            scale: 2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("lib/imgs/muze/efesOrenMuze5.jpg",
                            scale: 2,
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 400.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                  ),
                  Text("Konum İçin Haritaya Tıkla",
                    style: TextStyle(
                        color: Colors.white
                    ),),
                  SizedBox(height: 20,),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        launch('https://shorturl.at/cfRY2'); // Tıklandığında açılacak URL
                      },
                      child: Image.asset("lib/imgs/muze/efesOrenMap.png",
                        fit: BoxFit.cover,
                        scale: 2,
                      ),
                    ),
                  ),
                  //-----------------------------------------
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Divider(
                      color: Colors.white24,
                      thickness: 10,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("TROYA ÖRENYERİ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30
                    ),),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("lib/imgs/muze/troyaOren.jpg",
                        fit: BoxFit.cover,
                        scale: 2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Troya, dünyadaki en ünlü antik kentlerden birisidir. Troya’da görülen 9 katman, kesintisiz olarak 3000 yıldan fazla bir zamanı göstermekte ve Anadolu, Ege ve Balkanların buluştuğu bu benzersiz coğrafyada yerleşmiş olan uygarlıkları izlememizi sağlamaktadır. Troya’daki en erken yerleşim katı M.Ö. 3000-2500 ile erken Tunç Çağı’na tarihlenmektedir, daha sonra sürekli yerleşim gören Troya katmanları M.Ö. 85 – M.S. 8. yüzyıla tarihlenen Roma Dönemi ile sona ermektedir.\n\nTroya, bulunduğu coğrafi konum nedeniyle burada hüküm süren uygarlıkların diğer bölgelerle ticari ve kültürel bağlantıları açısından daima çok önemli bir rol üstlenmiştir. Troya ayrıca gösterdiği kesintisiz katmanlaşma ile Avrupa ve Ege’deki diğer arkeolojik alanlar için referans görevi görmektedir. İlk olarak 1871’de Heinrich Schliemann, daha sonra W. Dörpfeld, C.W Blegen tarafından kazılmış olan bu görkemli arkeolojik şehirde kazılar halen sürdürülmektedir.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),),
                  ),
                  CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.all(1),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Image.asset("lib/imgs/muze/troyaOren1.jpg",
                            fit: BoxFit.contain,
                            scale: 2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("lib/imgs/muze/troyaOren2.jpg",
                            scale: 2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("lib/imgs/muze/troyaOren3.jpg",
                            scale: 2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("lib/imgs/muze/troyaOren4.jpg",
                            scale: 2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("lib/imgs/muze/troyaOren5.jpg",
                            scale: 2,
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 400.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                  ),
                  Text("Konum İçin Haritaya Tıkla",
                    style: TextStyle(
                        color: Colors.white
                    ),),
                  SizedBox(height: 20,),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        launch('https://shorturl.at/aACHX'); // Tıklandığında açılacak URL
                      },
                      child: Image.asset("lib/imgs/muze/troyaOrenMap.png",
                        fit: BoxFit.cover,
                        scale: 2,
                      ),
                    ),
                  ),
                  //------------------------------------------------------
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Divider(
                      color: Colors.white24,
                      thickness: 10,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("CUMHURİYET MÜZESİ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30
                    ),),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("lib/imgs/muze/cumhuriyetMuze.jpg",
                        fit: BoxFit.cover,
                        scale: 2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("CUMHURİYET’İN TANIĞI:\n\nATATÜRK DEVRİMLERİNE TANIKLIK ETTİ\n\nTürkiye Cumhuriyeti’nin kuruluşunda 2. Türkiye Büyük Millet Meclisi binası olarak hizmet veren müze; Atatürk ilke ve devrimlerinin doğuşuna ve çok partili sisteme tanıklık edişiyle cumhuriyet gençliğine adandı.\n\nCUMHURİYET DÖNEMİ MİMARİSİNİ YANSITIYOR\n\nBina, “Birinci Ulusal Mimarlık Akımı” öncülerinden mimar Vedat Tek tarafından, 1923’te Cumhuriyet Halk Partisi binası olarak inşa edildi. İlk Türkiye Büyük Millet Meclisi binasının meclise yetersiz gelmesi nedeniyle Atatürk’ün talimatıyla meclis binası olarak düzenlendi. 18 Ekim 1924’ten itibaren de meclis binası olarak hizmet vermeye başladı. Selçuklu ve Osmanlı bezeme motiflerinin yer aldığı tavan süslemeleri; kemer, saçak ve çinileriyle cumhuriyet dönemi mimarisini yansıtan bu yapı, işlevini 1960 yılında kadar sürdürdü.\n\nTÜRKİYE’NİN İLK ÇOCUK DOSTU MÜZESİ\n\nBu dönemde cumhuriyetin gelişimine, çağdaş yasaların çıkarılmasına, uluslararası antlaşma ve çok partili sisteme geçiş sürecine tanıklık etti. 1981 yılından itibaren Cumhuriyet Müzesi olarak hizmet veren binada; ilk üç cumhurbaşkanı dönemini yansıtan olaylar, fotoğraflar, cumhurbaşkanlarının özel eşyalarıyla ve dönemin meclisinde alınan karar ve kanunlar sergileniyor.\n\nBu eserler arasında Atatürk’ün 10. Yıl Nutku’nu okuduğu mikrofon da yer alıyor. Türkiye’nin ilk Çocuk Dostu Müzesi olan Cumhuriyet Müzesi’nde çocuklar için özel bir anlatım üslubu tercih edildi.\n\nHAZIR GELMİŞKEN…\n\nHemen yanında, artık Kurtuluş Savaşı Müzesi olan ilk meclis binası var. Mustafa Kemal’in meşhur Cumhuriyet Balosu fotoğrafının mekanı Ankara Palas da karşısında yer alıyor. Yakınlarında yer alan bir başka anıtsa, Roma İmparatoru Julianus’un Ankara ziyareti anısına M.S. 326’da yapılan Julianus Sütunu. Bölge başkentin belli başlı müzelerine ev sahipliği yapıyor. Etnografya Müzesi, Resim Heykel Müzesi ve Vakıf Eserleri Müzesi bunlardan bazıları.",textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),),
                  ),
                  CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.all(1),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Image.asset("lib/imgs/muze/cumhuriyetMuze1.jpg",
                            fit: BoxFit.contain,
                            scale: 2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("lib/imgs/muze/cumhuriyetMuze2.jpg",
                            scale: 2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("lib/imgs/muze/cumhuriyetMuze3.jpg",
                            scale: 2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("lib/imgs/muze/cumhuriyetMuze4.jpg",
                            scale: 2,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("lib/imgs/muze/cumhuriyetMuze5.jpg",
                            scale: 2,
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 400.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                  ),
                  Text("Konum İçin Haritaya Tıkla",
                    style: TextStyle(
                        color: Colors.white
                    ),),
                  SizedBox(height: 20,),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        launch('https://shorturl.at/kwEI5'); // Tıklandığında açılacak URL
                      },
                      child: Image.asset("lib/imgs/muze/cumhuriyetMuzeMap.png",
                        fit: BoxFit.cover,
                        scale: 2,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Divider(
                      color: Colors.transparent,
                      thickness: 50,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor:Colors.white,
                          elevation: 15,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> muze()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Sayfa Başı",style:
                            TextStyle(
                              fontSize: 25,
                              fontFamily: "RobotoMono",
                            ),)],
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Divider(
                      color: Colors.transparent,
                      thickness: 50,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor:Colors.white,
                          elevation: 15,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> anaSayfa()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Ana Sayfaya Dön",style:
                            TextStyle(
                              fontSize: 25,
                              fontFamily: "RobotoMono",
                            ),)],
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Divider(
                      color: Colors.transparent,
                      thickness: 50,
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
