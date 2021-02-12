
import 'package:dunya_saatleri_app/pages/konum_sec.dart';
import 'package:dunya_saatleri_app/pages/yukleniyor.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context)=>Yukleniyor(),
      '/home':(context)=> Home(),
      '/konum':(context)=> Konum()
    },
  ));
}


