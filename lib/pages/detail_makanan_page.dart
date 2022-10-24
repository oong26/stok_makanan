import 'package:flutter/material.dart';
import 'package:stok_makanan/utils/colors.dart';
import 'package:stok_makanan/utils/constants.dart';
import 'package:stok_makanan/utils/styles.dart';

class DetailMakananPage extends StatefulWidget {
  const DetailMakananPage({Key? key}) : super(key: key);

  @override
  State<DetailMakananPage> createState() => _DetailMakananPageState();
}

class _DetailMakananPageState extends State<DetailMakananPage> {
  final currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 30),
              _buildHeaderSection(),
              const SizedBox(height: 64),
              Text(
                'Nama Menu : Sop Buntut',
                style: sectionTitleTextStyle,
              ),
              const SizedBox(height: 17),
              _buildDetailSection(),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Stock Menu : 100/1',
                  style: titleTextStyle.copyWith(fontSize: 48),
                ),
              ),
              const SizedBox(height: 30),
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
          Expanded(
            child: Text(
              'A',
              style: titleTextStyle,
              textAlign: TextAlign.center,
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

  Widget _buildDetailSection() => Wrap(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              'images/sop_buntut.png',
              width: 412,
              height: 412,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 206),
          RichText(
            text: TextSpan(
                text: 'Detail Menu :\n',
                style: sectionTitleTextStyle,
                children: [
                  TextSpan(
                    text: '$listDot Nasi\n',
                    style: sectionBodyTextStyle,
                  ),
                  TextSpan(
                    text: '$listDot Sop Buntut\n',
                    style: sectionBodyTextStyle,
                  ),
                  TextSpan(
                    text: '$listDot Tahu Tempe\n',
                    style: sectionBodyTextStyle,
                  ),
                  TextSpan(
                    text: '$listDot Sambel\n',
                    style: sectionBodyTextStyle,
                  ),
                  TextSpan(
                    text: '$listDot Pisang\n',
                    style: sectionBodyTextStyle,
                  ),
                  TextSpan(
                    text: '$listDot Kerupuk\n',
                    style: sectionBodyTextStyle,
                  ),
                ]),
          )
        ],
      );
}
