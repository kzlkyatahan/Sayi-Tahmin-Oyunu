import 'package:flutter/material.dart';

class KazandiSayfasi extends StatefulWidget {
  int sonuc;

  KazandiSayfasi({required this.sonuc});

  @override
  State<KazandiSayfasi> createState() => _KazandiSayfasiState();
}

class _KazandiSayfasiState extends State<KazandiSayfasi> {
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
            Text("Tebrikler Kazandınız",style: TextStyle(fontSize: 27),),
            Text(
              "Rastgele tutulan sayı: ${widget.sonuc}",
              style: TextStyle(fontSize: 24),
            ),
            Image.asset("resimler/mutlu_resim.png"),
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
