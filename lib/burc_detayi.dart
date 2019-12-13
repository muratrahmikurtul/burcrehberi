import 'package:burc_rehber/burc_listesi.dart';
import 'package:burc_rehber/models/burc.dart';
import 'package:flutter/material.dart';

class BurcDetayi extends StatelessWidget {
  int gelenIndex;
  Burc selectedBurc;

  BurcDetayi(this.gelenIndex);
  @override
  Widget build(BuildContext context) {
    selectedBurc = BurcListesi.tumBurclar[gelenIndex];

    return Scaffold(
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            primary: true,
            backgroundColor: Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(selectedBurc.burcAdi + " Burcu ve Özellikleri"),
              background:
                  Image.asset("images/"+selectedBurc.burcBuyukResim, fit: BoxFit.cover),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Text(
                selectedBurc.burcDetayi,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
