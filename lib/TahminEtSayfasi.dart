import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmin_oyunu/KaybettiSayfasi.dart';
import 'package:sayi_tahmin_oyunu/KazandiSayfasi.dart';

class TahminEtSayfasi extends StatefulWidget {
  const TahminEtSayfasi({Key? key}) : super(key: key);

  @override
  State<TahminEtSayfasi> createState() => _TahminEtSayfasiState();
}

class _TahminEtSayfasiState extends State<TahminEtSayfasi> {

  var tahminController=TextEditingController();
  String yardim="";
  String ipucu="";
  int sayi=0;

  int Rastgelesayi=Random().nextInt(101);
  int kalanHak=5;

  @override
  void initState() {
    super.initState();
    print("Oluşturulan rastgele sayı: $Rastgelesayi");
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tahmin Et Sayfası"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Oyun Başladı",style: TextStyle(fontSize: 27,color: Colors.red),),
            Text(
              "Yardım: $yardim",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w500
              ),
            ),
            Text(
              "Kalan Hak: $kalanHak",
              style: TextStyle(
                fontSize: 25,
                color: Colors.teal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: tahminController,
                decoration: InputDecoration(
                  hintText: "Sayı formatında bir tahmin giriniz",
                  label: Text("Tahmin"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              width: 180,
              height: 45,
              child: ElevatedButton(
                child: Text("Tahmini Başlat"),
                onPressed: (){
                  setState(() {
                    sayi=int.parse(tahminController.text);

                    if (sayi==Rastgelesayi){
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => KazandiSayfasi(sonuc: Rastgelesayi))
                      );
                    }
                    if (sayi>Rastgelesayi){
                      yardim="Tahmini Azalt";
                      kalanHak-=1;
                    }
                    if (sayi<Rastgelesayi){
                      yardim="Tahmini Arttır";
                      kalanHak-=1;
                    }
                    if (kalanHak==0){
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => KaybettiSayfasi(sonuc: Rastgelesayi))
                      );
                    }
                  });
                },
              ),
            ),
            SizedBox(
              width: 150,
              height: 35,
              child: ElevatedButton(
                child: Text("İpucu Göster"),
                onPressed: (){
                  setState(() {
                    int geciciSayi=(sayi-Rastgelesayi).abs();
                    ipucu="${geciciSayi} rastgele sayıya olan uzaklık";
                  });
                },
              ),
            ),
            SizedBox(
              width: 150,
              height: 35,
              child: ElevatedButton(
                child: Text("İpucuyu Kapat"),
                onPressed: (){
                  setState(() {
                    ipucu="";
                  });
                },
              ),
            ),
            Text("İpucu: $ipucu"),
          ],
        ),
      ),
    );
  }
}