import 'package:flutter/material.dart';
import 'package:stok_makanan/utils/colors.dart';
import 'package:stok_makanan/utils/constants.dart';
import 'package:stok_makanan/utils/styles.dart';

class StokMakananPage extends StatefulWidget {
  const StokMakananPage({Key? key}) : super(key: key);

  @override
  State<StokMakananPage> createState() => _StokMakananPageState();
}

class _StokMakananPageState extends State<StokMakananPage> {
  final currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mPrimaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: <Widget>[
              _buildHeaderSection(),
              const SizedBox(height: 40),
              Text(
                'Stock',
                style: titleTextStyle.copyWith(fontSize: 96),
              ),
              const SizedBox(height: 40),
              Row(
                children: <Widget>[
                  Expanded(
                      child: _buildStockInfo(
                    kategori: 'A',
                    stok: 100,
                    sisaStok: 89,
                  )),
                  const SizedBox(width: 20),
                  Expanded(
                      child: _buildStockInfo(
                    kategori: 'B',
                    stok: 100,
                    sisaStok: 90,
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Image.asset(
              'images/logo.png',
              width: 100,
              height: 100,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              dayDateFormat.format(currentDate),
              style: sectionTitleTextStyle.copyWith(fontSize: 36),
            ),
          ),
        ],
      );

  Widget _buildStockInfo(
          {required String kategori,
          required int stok,
          required int sisaStok}) =>
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: mGreyColor,
        ),
        child: Column(
          children: <Widget>[
            Text(
              kategori,
              style: cardTextStyle,
            ),
            Container(
              decoration: const BoxDecoration(
                color: mSmokeWhiteColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '$stok',
                      style: cardTextStyle.copyWith(fontSize: 150),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 200,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: Text(
                      '$sisaStok',
                      style: cardTextStyle.copyWith(fontSize: 150),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
