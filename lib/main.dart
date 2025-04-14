import 'package:flutter/material.dart';
import 'package:proje2/giris.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}
int r=255;
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        //useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Explore Türkiye'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Stack(

      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/imgs/tr1.jpg"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.45),
          appBar: AppBar(
            backgroundColor:  Colors.transparent, // <-- APPBAR WITH TRANSPARENT BG
            elevation: 0.2 ,
            title: Text(
              widget.title,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 35,
              ),
            ),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical, //bu ile sayfa kayar

            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[


                Image.asset(
                  "lib/imgs/tr.png",
                  scale: 2,
                ),
                    SizedBox(height: 45,),
                    Text("Unutulmaz bir deneyime\nHazır mısın?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white

                      ),),
                    SizedBox(height: 45,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor:Colors.white,
                          elevation: 15,
                        ),
                          onPressed: () {
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> giris()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text("Şimdi Keşfet",style:
                                TextStyle(
                                  fontSize: 50,
                                  fontFamily: "RobotoMono",
                                ),)],
                            ),
                          )),
                    ),


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
