import 'package:flutter/material.dart';
import 'package:dunya_saatleri_app/services/world_time.dart';


class Konum extends StatefulWidget {
  @override
  _KonumState createState() => _KonumState();
}

class _KonumState extends State<Konum> {

List<WorldTime> konumlar = [
  WorldTime(url: "Europe/Istanbul",konum: "Istanbul",bayrak: "turkiye.jpg"),
  WorldTime(url: "America/Chicago",konum: "Chicago",bayrak: "amerika.jpg"),
  WorldTime(url: "America/New_York",konum: "New York",bayrak: "amerika.jpg"),
  WorldTime(url: "Europe/London",konum: "London",bayrak: "ingiltere.jpg"),
  WorldTime(url: "Europe/Berlin",konum: "Berlin",bayrak: "almanya.jpg"),
  WorldTime(url: "Asia/Seoul",konum: "Seoul",bayrak: "guney-kore.jpg"),
  WorldTime(url: "Asia/Tokyo",konum: "Tokyo",bayrak: "japonya.jpg"),

];

void zamanGuncelle(index) async{

  WorldTime nesne = konumlar[index];
  await nesne.getZaman();

  print(nesne.konum);

  Navigator.pop(context,{
    'konum': nesne.konum,
    'zaman': nesne.zaman,
    'bayrak': nesne.bayrak,
    'gunZaman': nesne.gunZaman
  });
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text("Konum Seç"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: konumlar.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    zamanGuncelle(index);
                  },
                  title: Text(konumlar[index].konum),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/${konumlar[index].bayrak}"),
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
}

