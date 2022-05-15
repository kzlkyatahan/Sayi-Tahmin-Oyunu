import 'package:flutter/material.dart';
import 'package:sayi_tahmin_oyunu/KazandiSayfasi.dart';
import 'package:sayi_tahmin_oyunu/TahminEtSayfasi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnaSayfa(title: 'Flutter Demo Home Page'),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Oyuna Hoş Geldiniz",style: TextStyle(fontSize: 27),),
            Image.asset("resimler/zar_resim.png"),
            SizedBox(
              width: 180,
              height: 45,
              child: ElevatedButton(
                child: Text("Oyuna Başla"),
                onPressed: (){
                  print("Oyuna başlandı");
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TahminEtSayfasi())
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}