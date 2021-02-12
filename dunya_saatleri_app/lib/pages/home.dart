import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map routeVeriler = {};
  String bgResim;

  @override
  Widget build(BuildContext context) {
    routeVeriler = routeVeriler.isNotEmpty ? routeVeriler : ModalRoute.of(context).settings.arguments;
    bgResim = routeVeriler['gunZaman'] ? 'day.jpg' : 'night.jpg';
    print(bgResim);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$bgResim"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    print("basıldı");
                   dynamic sonuc = await Navigator.pushNamed(context, '/konum');
                    print(sonuc);
                   if(sonuc != null){
                     setState(() {
                       routeVeriler = {

                         'zaman':sonuc['zaman'],
                         'bayrak':sonuc['bayrak'],
                         'konum':sonuc['konum'],
                         'gunZaman':sonuc['gunZaman']
                       };

                     });
                   }

                  },
                  icon: Icon(Icons.edit_location),
                  label: Text("Konum Düzenle"),
                ),

                SizedBox(height: 50.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      routeVeriler['konum'],
                      style: TextStyle(
                        color: bgResim !="day.jp"?Colors.black:Colors.white,
                        fontSize: 28,
                        letterSpacing: 2.0,
                      ),
                    ),
                    SizedBox(width: 30.0,),
                    Text(
                      routeVeriler['zaman'],
                      style: TextStyle(
                        fontSize: 45.0,
                        color: bgResim !="day.jp"?Colors.black:Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

