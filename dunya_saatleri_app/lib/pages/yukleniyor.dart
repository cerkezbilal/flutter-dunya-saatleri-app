import 'package:dunya_saatleri_app/services/world_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Yukleniyor extends StatefulWidget {

  @override
  _YukleniyorState createState() => _YukleniyorState();
}

class _YukleniyorState extends State<Yukleniyor> {
  String zaman = "Yükleniyor";
  void setupWorldTime() async{

    WorldTime nesne = WorldTime(konum: 'Berlin', bayrak: 'germany.png',url: 'Europe/Berlin');

    await nesne.getZaman();
    setState(() {

        zaman = nesne.zaman;


    });

    Navigator.pushReplacementNamed(context, '/home',arguments: {

      'konum':nesne.konum,
      'bayrak':nesne.bayrak,
      'zaman':nesne.zaman,
      'gunZaman': nesne.gunZaman
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    setupWorldTime();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.orangeAccent,
          size: 90.0,

        ),
      ),
    );
  }
}

