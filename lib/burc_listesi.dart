import 'package:burc_rehber/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:burc_rehber/models/burc.dart';

class BurcListesi extends StatelessWidget {
  static List<Burc> tumBurclar;
  @override
  Widget build(BuildContext context) {
    tumBurclar = veriHazirla();
    return Scaffold(
      appBar: AppBar(
        title: Text("Burç Rehberi"),
      ),
      body: listeyiHazirla(),
    );
  }

  List<Burc> veriHazirla() {
    List<Burc> burclar = [];
    for (int i = 0; i < 12; i++) {
      String kucukResim = Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      String buyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}.png";

      Burc eklenecekBurc = Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          kucukResim,
          buyukResim);
      burclar.add(eklenecekBurc);
    }
    return burclar;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tekSatirBurc(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget tekSatirBurc(BuildContext context, int index) {
    Burc currentBurc = tumBurclar[index];
    return Card(
      elevation: 4,
      child: ListTile(
        onTap: ()=> Navigator.pushNamed(context, "/burcDetayi/$index"),
        leading: Image.asset(
          "images/" + currentBurc.burcKucukResim,
          width: 48,
          height: 48,
        ),
        title: Text(
          currentBurc.burcAdi,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.pink.shade500),
        ),
        subtitle: Text(
          currentBurc.burcTarihi,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black38 )
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.pink),
      ),
    );
  }
}
