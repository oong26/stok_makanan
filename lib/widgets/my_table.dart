import 'package:flutter/material.dart';
import 'package:stok_makanan/utils/colors.dart';
import 'package:stok_makanan/utils/styles.dart';
import 'package:stok_makanan/widgets/my_button.dart';

class MyTable extends StatelessWidget {
  const MyTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      border: TableBorder.all(
        color: Colors.black,
        width: 1,
      ),
      columns: [
        DataColumn(
          onSort: (i, asc) {
            print('onsort : $asc');
          },
          numeric: true,
          label: Text(
            'No',
            style: body1TextStyle,
          ),
        ),
        DataColumn(
          label: Text(
            'Nama',
            style: body1TextStyle,
          ),
        ),
        DataColumn(
          label: Text(
            'Kategori',
            style: body1TextStyle,
          ),
        ),
        DataColumn(
          label: Text(
            'Stok',
            style: body1TextStyle,
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Center(
              child: Text(
                'Action',
                style: body1TextStyle,
              ),
            ),
          ),
        ),
      ],
      rows: [
        DataRow(cells: [
          DataCell(
            Text(
              '1',
              style: body2TextStyle,
            ),
          ),
          DataCell(
            Text(
              'Nasi Goreng',
              style: body2TextStyle,
            ),
          ),
          DataCell(
            Text(
              'A',
              style: body2TextStyle,
            ),
          ),
          DataCell(
            Text(
              '10',
              style: body2TextStyle,
            ),
          ),
          DataCell(
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyButton(
                  onPressed: () {},
                  icon: Icons.mode_edit_outline_outlined,
                  text: 'Edit',
                  color: mWarningColor,
                ),
                const SizedBox(width: 8),
                MyButton(
                  onPressed: () {},
                  icon: Icons.delete_outline_rounded,
                  text: 'Hapus',
                  color: mDangerColor,
                ),
              ],
            ),
          ),
        ]),
      ],
    );
  }
}
