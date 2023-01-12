import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:boykiloindeks/Model/Urunler.dart';
import 'package:boykiloindeks/DetailPage.dart';

class RemoteJson extends StatefulWidget {
  @override
  _RemoteJsonState createState() => _RemoteJsonState();
}

class _RemoteJsonState extends State<RemoteJson> {




  Future<List<Urunler>> _getUrunler() async{
    var empData=await http.get(Uri.parse("https://api.jsonbin.io/v3/qs/63acbb2e15ab31599e26f2a3"));

    var jsonData=json.decode(empData.body);
    List<Urunler> urunlerrr=[];
    for(var emp in jsonData)
        {
      Urunler urunler=Urunler(emp["urunID"], emp["urunAd"], emp["urunKategori"], emp["urunFoto"],emp["urunKalori"], emp["urunHakkinda"]);
      urunlerrr.add(urunler);

    }
    return urunlerrr;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar( // AppBar
        title:Text("Besin Bilgileri",style: TextStyle(
            fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        backgroundColor: Color(0xFF0A0D22)
      ),
      body: Container(
        child: FutureBuilder(
            future: _getUrunler(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.data==null){
                return Container(
                  child: Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("E-fit Sağlık"),
                      Padding(padding: EdgeInsets.only(top: 20),),
                      Text("Loading..."),
                    ],
                  ),),

                );
              }
              else{
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      leading: CircleAvatar(
                        maxRadius: 35,

                        backgroundImage: NetworkImage(snapshot.data[index].urunFoto),
                      ),
                      title:Text(snapshot.data[index].urunAd,style: TextStyle(fontSize: 20),),
                      subtitle:Text(snapshot.data[index].urunKategori),
                      onTap: (){
                        Navigator.push(context,
                            new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index].urunAd,snapshot.data[index].urunKategori,snapshot.data[index].urunFoto,snapshot.data[index].urunKalori,snapshot.data[index].urunHakkinda))
                        );
                      },
                    );
                  },
                );
              }
            }
        ),

      ),

    );
  }
}


