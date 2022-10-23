import 'package:flutter/material.dart';
import 'package:stok_makanan/pages/list_makanan_page.dart';
import 'package:stok_makanan/utils/colors.dart';
import 'package:stok_makanan/utils/styles.dart';
import 'package:stok_makanan/widgets/my_button.dart';
import 'package:stok_makanan/widgets/my_table.dart';

class AllWidgetsPage extends StatefulWidget {
  const AllWidgetsPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<AllWidgetsPage> createState() => _AllWidgetsPageState();
}

class _AllWidgetsPageState extends State<AllWidgetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyButton(
              onPressed: () {},
              icon: Icons.add,
              text: 'Tambah',
            ),
            const MyTable(),
            SizedBox(
              width: 500,
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Tanggal',
                    style: inputTextStyle.copyWith(
                        color: Colors.black.withOpacity(0.5)),
                  ),
                  hintText: 'dd/mm/yy',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Simpan',
                  style: bigButtonTextStyle.copyWith(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: mPrimaryColor,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Batal',
                  style: bigButtonTextStyle,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: mPrimaryColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ListMakananPage())),
                child: Text(
                  'Database',
                  style: bigButtonTextStyle.copyWith(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: mPrimaryColor,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
