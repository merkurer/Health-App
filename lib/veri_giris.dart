import 'package:boykiloindeks/hesap.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ikon_icerik.dart';
import 'reuseble_card.dart';
import 'sabitler.dart';
import 'sonuc.dart';
import 'hesap.dart';
import 'package:boykiloindeks/Kalori_Sonuc.dart';
import 'dart:math';


enum Cinsiyet{
  erkek,
  kadin
}

class VeriGiris extends StatefulWidget {
  @override
  _VeriGirisState createState() => _VeriGirisState();
}

class _VeriGirisState extends State<VeriGiris> {
  Color erkekKartRenk = kInactiveKartRenk;
  Color kadinKartRenk = kInactiveKartRenk;

  Cinsiyet seciliCinsiyet = Cinsiyet.erkek;
  int boy = 180;
  int kilo = 60;
  int yas = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BKI HESAPLAMA'),
          backgroundColor: Color(0xFF0A0D22),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                        onTap: () {setState(() {seciliCinsiyet= Cinsiyet.erkek;},);},
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.mars,
                                size: 80.0,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text('ERKEK', style: kEtiketStili
                              )
                            ],
                          ),
                          margin: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: seciliCinsiyet == Cinsiyet.kadin ? kAktifKartRengi : kInactiveKartRenk,
                          ),
                        ),
                      )
                  ),
                  Expanded(
                      child: GestureDetector(
                        onTap: () {setState(() {seciliCinsiyet= Cinsiyet.kadin;},);},
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.venus,
                                size: 80.0,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text('KADIN', style: kEtiketStili
                              )
                            ],
                          ),
                          margin: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: seciliCinsiyet == Cinsiyet.erkek ? kAktifKartRengi : kInactiveKartRenk,
                          ),
                        ),
                      )
                  )
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('BOY',style: kEtiketStili),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(boy.toString(), style: kSayiStili),
                        Text('CM',style: kEtiketStili,),
                      ],
                    ),
                    Slider(
                      value: boy.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double yeniBoyDeger){
                        setState(() {boy = yeniBoyDeger.round();});
                        },
                    ),
                  ]
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('KİLO', style: kEtiketStili,),
                              Text(kilo.toString(), style: kSayiStili,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RawMaterialButton(
                                    child: Icon(FontAwesomeIcons.minus),
                                    onPressed: () {setState(() {kilo--;});},
                                    elevation: 6.0,
                                    constraints:  BoxConstraints.tightFor(
                                      width: 56.0,
                                      height: 56.0,
                                    ),
                                    shape: CircleBorder(),
                                    fillColor: Color(0xFF4C4F5E),
                                  ),
                                  SizedBox(width: 10.0),
                                  RawMaterialButton(
                                    child: Icon(FontAwesomeIcons.plus),
                                    onPressed: () {setState(() {kilo++;});},
                                    elevation: 6.0,
                                    constraints:  BoxConstraints.tightFor(
                                      width: 56.0,
                                      height: 56.0,
                                    ),
                                    shape: CircleBorder(),
                                    fillColor: Color(0xFF4C4F5E),
                                  ),
                                ],
                              )
                            ],
                          ),
                          margin: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: kAktifKartRengi,
                          ),
                        ),
                      )
                  ),
                  Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('YAŞ', style: kEtiketStili,),
                              Text(yas.toString(), style: kSayiStili,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RawMaterialButton(
                                    child: Icon(FontAwesomeIcons.minus),
                                    onPressed: () {setState(() {yas--;});},
                                    elevation: 6.0,
                                    constraints:  BoxConstraints.tightFor(
                                      width: 56.0,
                                      height: 56.0,
                                    ),
                                    shape: CircleBorder(),
                                    fillColor: Color(0xFF4C4F5E),
                                  ),
                                  SizedBox(width: 10.0),
                                  RawMaterialButton(
                                    child: Icon(FontAwesomeIcons.plus),
                                    onPressed: () {setState(() {yas++;});},
                                    elevation: 6.0,
                                    constraints:  BoxConstraints.tightFor(
                                      width: 56.0,
                                      height: 56.0,
                                    ),
                                    shape: CircleBorder(),
                                    fillColor: Color(0xFF4C4F5E),
                                  ),
                                ],
                              )
                            ],
                          ),
                          margin: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: kAktifKartRengi,
                          ),
                        ),
                      )
                  ),

                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                BKIHesap calc = BKIHesap(bireyBoy: boy,bireyKilo: kilo);
                Navigator.push(
                  context,MaterialPageRoute(
                  builder: (context) =>  SonucSayfasi(
                    bkiSinif: calc.bkihesapla(),
                    bkiDeger: calc.sonucSiniflama(),
                    bkiAciklama: calc.sonucAciklamasi(),
                  ),
                ),
                );
                },
              child: Container(
                child: Center(child: Text('HESAPLA',style: kBuyukButon,)),
                color: kAltContainerRenk,
                height: kAltButonYukseklik,
                width: double.infinity,
                margin: EdgeInsets.only(top: 10.0),
              ),
            )
          ],
        ));
  }
}