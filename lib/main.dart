import 'package:custom_button_khadafi/custom_button_khadafi.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:proyek_sub_mission_id_camp_2023/ui/halaman_produk.dart';

void main() {
  /*WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      home: const MyHomePage(title: 'Warkop IDCamp 2023'),
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
    
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(image: AssetImage('assets/back_coffee_shop.png')),
              const Text(
                'ID Camp 2023\nCoffee Shop',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 36.0),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const Text(
                      'Aplikasi ini merupakan aplikasi untuk submission\npeserta atas nama : Khadafi Zubaidi, pada kegiatan\nID Camp tahun 2023. Data yang ditampilkan dalam aplikasi ini adalah contoh data produk pada sebuah Coffee Shop.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontSize: 12.0),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      iconData: Icons.navigate_next,
                      buttonText: 'Selanjutnya',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HalamanProduk()),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
