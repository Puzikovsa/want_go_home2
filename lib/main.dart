import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:want_go_home/pages/change_phone.dart';
import 'package:want_go_home/pages/start_page.dart';
import 'models/phone.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Phone()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
       initialRoute: StartPage.rout,
        routes: {
          StartPage.rout: (context) => const StartPage(),
          ChangePhone.route: (context) => const ChangePhone(),
        },
      ),
    ),
  );
}