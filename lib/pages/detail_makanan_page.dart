import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stok_makanan/cubit/kurangi_stok_cubit.dart';
import 'package:stok_makanan/models/makanan_model.dart';
import 'package:stok_makanan/utils/colors.dart';
import 'package:stok_makanan/utils/constants.dart';
import 'package:stok_makanan/utils/styles.dart';

import '../widgets/my_button.dart';

class DetailMakananPage extends StatefulWidget {
  const DetailMakananPage({
    Key? key,
    required this.data,
  }) : super(key: key);
  final MakananModel data;

  @override
  State<DetailMakananPage> createState() => _DetailMakananPageState();
}

class _DetailMakananPageState extends State<DetailMakananPage> {
  final currentDate = DateTime.now();

  void _kurangiStok() {
    // set up the button
    Widget cancelButton = TextButton(
      child: Text("Batal"),
      onPressed: () => Navigator.pop(context),
    );
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        BlocProvider.of<KurangiStokCubit>(context).subtract(id: widget.data.id);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Konfirmasi"),
      content: Text("Anda yakin akan mengurangi stok data ini?"),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mPrimaryColor,
      body: BlocListener<KurangiStokCubit, KurangiStokState>(
        listener: (context, state) {
          if (state is KurangiStokSuccess) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Berhasil',
                  style:
                      GoogleFonts.poppins(fontSize: 12, color: Colors.white)),
              backgroundColor: Colors.green,
            ));
          }

          if (state is KurangiStokError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.message,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.red,
            ));
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 30),
                _buildHeaderSection(),
                const SizedBox(height: 34),
                MyButton(
                  onPressed: () => _kurangiStok(),
                  icon: Icons.remove,
                  text: 'Kurangi 5 Stok',
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Nama Menu : ${widget.data.nama}',
                  style: sectionTitleTextStyle,
                ),
                const SizedBox(height: 17),
                _buildDetailSection(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Stock Menu : ${widget.data.stok}/${widget.data.stokTemp}',
                    style: titleTextStyle.copyWith(fontSize: 48),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
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
              'assets/images/logo.png',
              width: 100,
              height: 100,
            ),
          ),
          Expanded(
            child: Text(
              widget.data.kategoriMenu,
              style: titleTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              dayDateFormat.format(widget.data.tanggal.date),
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
            child: Image.network(
              ASSET_URL + widget.data.gambar,
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
                    text: '$listDot${widget.data.detail}\n',
                    style: sectionBodyTextStyle,
                  ),
                  // TextSpan(
                  //   text: '$listDot Sop Buntut\n',
                  //   style: sectionBodyTextStyle,
                  // ),
                  // TextSpan(
                  //   text: '$listDot Tahu Tempe\n',
                  //   style: sectionBodyTextStyle,
                  // ),
                  // TextSpan(
                  //   text: '$listDot Sambel\n',
                  //   style: sectionBodyTextStyle,
                  // ),
                  // TextSpan(
                  //   text: '$listDot Pisang\n',
                  //   style: sectionBodyTextStyle,
                  // ),
                  // TextSpan(
                  //   text: '$listDot Kerupuk\n',
                  //   style: sectionBodyTextStyle,
                  // ),
                ]),
          )
        ],
      );
}
