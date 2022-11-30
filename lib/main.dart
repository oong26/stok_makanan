import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stok_makanan/cubit/delete_makanan_cubit.dart';
import 'package:stok_makanan/cubit/fetch_makanan_cubit.dart';
import 'package:stok_makanan/cubit/kurangi_stok_cubit.dart';
import 'package:stok_makanan/cubit/load_detail_cubit.dart';
import 'package:stok_makanan/cubit/store_makanan_cubit.dart';
import 'package:stok_makanan/cubit/update_makanan_cubit.dart';
import 'package:stok_makanan/pages/input_makanan_page.dart';
import 'package:stok_makanan/pages/list_makanan_page.dart';
import 'package:stok_makanan/pages/splash_page.dart';
import 'package:stok_makanan/pages/stok_makanan_page.dart';
import 'package:stok_makanan/repositories/makanan_repo.dart';
import 'package:stok_makanan/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FetchMakananCubit(MakananRepository())),
        BlocProvider(
            create: (context) => StoreMakananCubit(MakananRepository())),
        BlocProvider(create: (context) => LoadDetailCubit(MakananRepository())),
        BlocProvider(
            create: (context) => DeleteMakananCubit(MakananRepository())),
        BlocProvider(
            create: (context) => UpdateMakananCubit(MakananRepository())),
        BlocProvider(
            create: (context) => KurangiStokCubit(MakananRepository())),
      ],
      child: MaterialApp(
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
        initialRoute: listMakananRoute,
        routes: {
          splashRoute: (context) => const SplashPage(),
          listMakananRoute: (context) => const ListMakananPage(),
          inputMakananRoute: (context) => const InputMakananPage(),
          stokMakananRoute: (context) => const StokMakananPage(),
        },
      ),
    );
  }
}
