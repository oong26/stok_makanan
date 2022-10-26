import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stok_makanan/cubit/fetch_makanan_cubit.dart';
import 'package:stok_makanan/models/list_makanan_model.dart';
import 'package:stok_makanan/models/makanan_model.dart';
import 'package:stok_makanan/repositories/makanan_repo.dart';
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
  void initState() {
    super.initState();
    BlocProvider.of<FetchMakananCubit>(context).fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSearchBar(),
              const SizedBox(height: 56),
              MyButton(
                onPressed: () => Navigator.pushNamed(context, inputMakananRoute)
                    .then((value) =>
                        BlocProvider.of<FetchMakananCubit>(context).fetch()),
                icon: Icons.add,
                text: 'Tambah',
              ),
              const SizedBox(height: 11),
              BlocConsumer<FetchMakananCubit, FetchMakananState>(
                listener: (context, state) {
                  if (state is FetchMakananError) {
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
                builder: (context, state) {
                  List<MakananModel> data = [];

                  if (state is FetchMakananLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is FetchMakananSuccess) {
                    data = state.data;
                  }

                  return _buildTable(data);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() => Row(
        children: <Widget>[
          Image.asset(
            'assets/images/logo.png',
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

  Widget _buildTable(List<MakananModel> data) => DataTable(
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
          for (var i = 0; i < data.length; i++)
            DataRow(cells: [
              DataCell(Text(
                (i + 1).toString(),
                style: body2TextStyle,
              )),
              DataCell(Text(
                dayDateFormat.format(data[i].tanggal.date),
                style: body2TextStyle,
              )),
              DataCell(Text(
                data[i].shift.toString(),
                style: body2TextStyle,
              )),
              DataCell(Text(
                data[i].kategoriMenu,
                style: body2TextStyle,
              )),
              DataCell(Text(
                data[i].stok.toString(),
                style: body2TextStyle,
              )),
              DataCell(Text(
                data[i].nama,
                style: body2TextStyle,
              )),
              DataCell(Text(
                data[i].detail,
                style: body2TextStyle,
              )),
              DataCell(Image.network(
                ASSET_URL + data[i].gambar,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
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
      );
}
