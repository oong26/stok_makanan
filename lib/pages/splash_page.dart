import 'dart:async';

import 'package:flutter/material.dart';
import 'package:progress_indicator/progress_indicator.dart';
import 'package:stok_makanan/utils/constants.dart';
import 'package:stok_makanan/utils/styles.dart';

import '../utils/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double progres = 0;

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var loadingDuration = const Duration(seconds: 1);
    Timer.periodic(loadingDuration, (Timer t) {
      // setState(() => progres += 20);
      progres += 20;
      if (progres == 100) {
        Navigator.pushNamedAndRemoveUntil(
            context, listMakananRoute, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 448,
              height: 448,
              fit: BoxFit.cover,
            ),
            Container(
              alignment: Alignment.topCenter,
              width: 300,
              height: 46,
              child: Stack(
                children: [
                  BarProgress(
                    percentage: progres,
                    backColor: Colors.grey,
                    color: mOrange2Color,
                    showPercentage: false,
                    textStyle: inputTextStyle,
                    stroke: 46,
                    round: true,
                    margin: const EdgeInsets.only(top: 25),
                  ),
                  Center(child: Text('Loading...', style: inputTextStyle)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
