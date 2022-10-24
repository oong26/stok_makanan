import 'package:flutter/material.dart';
import 'package:stok_makanan/pages/detail_makanan_page.dart';
import 'package:stok_makanan/pages/input_makanan_page.dart';
import 'package:stok_makanan/pages/list_makanan_page.dart';
import 'package:stok_makanan/pages/splash_page.dart';
import 'package:stok_makanan/pages/stok_makanan_page.dart';
import 'package:stok_makanan/utils/colors.dart';
import 'package:stok_makanan/utils/constants.dart';
import 'package:stok_makanan/utils/styles.dart';
import 'package:stok_makanan/widgets/my_button.dart';

import 'widgets/my_table.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: splashRoute,
      routes: {
        splashRoute: (context) => const SplashPage(),
        listMakananRoute: (context) => const ListMakananPage(),
        inputMakananRoute: (context) => const InputMakananPage(),
        detailMakananRoute: (context) => const DetailMakananPage(),
        stokMakananRoute: (context) => const StokMakananPage(),
      },
    );
  }
}
