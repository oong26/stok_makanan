import 'package:flutter/material.dart';
import 'package:stok_makanan/utils/colors.dart';
import 'package:stok_makanan/utils/constants.dart';
import 'package:stok_makanan/utils/styles.dart';
import 'package:stok_makanan/widgets/my_button.dart';

class ListMakananPage extends StatefulWidget {
  const ListMakananPage({Key? key}) : super(key: key);

  @override
  State<ListMakananPage> createState() => _ListMakananPageState();
}

class _ListMakananPageState extends State<ListMakananPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildSearchBar(),
            const SizedBox(height: 56),
            MyButton(
              onPressed: () => Navigator.pushNamed(context, inputMakananRoute),
              icon: Icons.add,
              text: 'Tambah',
            ),
            const SizedBox(height: 11),
            DataTable(
              border: TableBorder.all(color: Colors.black, width: 1),
              columnSpacing: 20,
              dataRowHeight: 150,
              columns: [
                DataColumn(
                  label: Text(
                    'No',
                    style: body1TextStyle,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Tanggal',
                    style: body1TextStyle,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Shift',
                    style: body1TextStyle,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Kategori Menu',
                    style: body1TextStyle,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Jumlah Stok',
                    style: body1TextStyle,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Nama Menu',
                    style: body1TextStyle,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Detail Menu',
                    style: body1TextStyle,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Gambar',
                    style: body1TextStyle,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Action',
                    style: body1TextStyle,
                  ),
                ),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text(
                    '1',
                    style: body2TextStyle,
                  )),
                  DataCell(Text(
                    '23/09/2022',
                    style: body2TextStyle,
                  )),
                  DataCell(Text(
                    '1',
                    style: body2TextStyle,
                  )),
                  DataCell(Text(
                    'A',
                    style: body2TextStyle,
                  )),
                  DataCell(Text(
                    '150',
                    style: body2TextStyle,
                  )),
                  DataCell(Text(
                    'Sop Buntut',
                    style: body2TextStyle,
                  )),
                  DataCell(Text(
                    '\u2022Nasi\n\u2022Sop Buntut\n\u2022Tahu Tempe\n\u2022Sambel\n\u2022 Pisang\n\u2022Kerupuk',
                    style: body2TextStyle,
                  )),
                  DataCell(Text(
                    '',
                    style: body2TextStyle,
                  )),
                  DataCell(
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 110,
                          child: MyButton(
                            onPressed: () {},
                            text: 'Edit',
                            icon: Icons.edit,
                            color: mWarningColor,
                          ),
                        ),
                        const SizedBox(width: 24),
                        SizedBox(
                          width: 110,
                          child: MyButton(
                            onPressed: () {},
                            text: 'Hapus',
                            icon: Icons.delete,
                            color: mDangerColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() => Row(
        children: <Widget>[
          Image.asset(
            'images/logo.png',
            width: 100,
            height: 100,
          ),
          const SizedBox(width: 28),
          Expanded(
            child: SizedBox(
              width: 500,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Cari',
                    style: inputTextStyle.copyWith(
                        color: Colors.black.withOpacity(0.5)),
                  ),
                  hintText: 'Cari makanan disini',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
