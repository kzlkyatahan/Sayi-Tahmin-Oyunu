import 'package:flutter/material.dart';

class KaybettiSayfasi extends StatefulWidget {

  int sonuc;


  KaybettiSayfasi({required this.sonuc});

  @override
  State<KaybettiSayfasi> createState() => _KaybettiSayfasiState();
}

class _KaybettiSayfasiState extends State<KaybettiSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Sayfası"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Maalesef Kaybettiniz",
              style: TextStyle(fontSize: 27),
            ),
            Text(
              "Rastgele tutulan sayı: ${widget.sonuc}",
              style: TextStyle(fontSize: 24),
            ),
            Image.asset("resimler/uzgun_resim.png"),
            SizedBox(
              width: 180,
              height: 45,
              child: ElevatedButton(
                child: Text("Ana Menüye Dön"),
                onPressed: (){
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
