import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stok_makanan/utils/colors.dart';
import 'package:stok_makanan/utils/constants.dart';
import 'package:stok_makanan/utils/styles.dart';

class InputMakananPage extends StatefulWidget {
  const InputMakananPage({Key? key}) : super(key: key);

  @override
  State<InputMakananPage> createState() => _InputMakananPageState();
}

class _InputMakananPageState extends State<InputMakananPage> {
  final _form = GlobalKey<FormState>();
  final _tfTglController =
      TextEditingController(text: dateFormat.format(DateTime.now()));
  final _tfShiftController = TextEditingController();
  final _tfKategoriController = TextEditingController();
  final _tfStokController = TextEditingController();
  final _tfNamaController = TextEditingController();
  final _tfDetailController = TextEditingController();
  final _tfUploadController = TextEditingController();

  List<String> _dropdownItems = [
    'Pilih Kategori',
    'A',
    'B',
  ];

  String _selectedKategori = 'Pilih Kategori';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _form,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Input Data',
                        style: formTitleTextStyle,
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 418,
                    child: TextFormField(
                      controller: _tfTglController,
                      readOnly: true,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.date_range,
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
                  const SizedBox(height: 26),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 292,
                        child: TextFormField(
                          controller: _tfShiftController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.black,
                            ),
                            label: Text(
                              'Shift',
                              style: inputTextStyle.copyWith(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            hintText: '1',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 70),
                      Container(
                        width: 292,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton(
                          underline: Container(),
                          isExpanded: true,
                          items: _dropdownItems
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      e,
                                      style: inputTextStyle.copyWith(
                                          color: Colors.black.withOpacity(0.5)),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          value: _selectedKategori,
                          onChanged: (String? value) {
                            setState(() => _selectedKategori = value!);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 26),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 292,
                        child: TextFormField(
                          controller: _tfStokController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.black,
                            ),
                            label: Text(
                              'Jumlah Stock',
                              style: inputTextStyle.copyWith(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            hintText: '1',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 70),
                      SizedBox(
                        width: 292,
                        child: TextFormField(
                          controller: _tfNamaController,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.black,
                            ),
                            label: Text(
                              'Nama Menu',
                              style: inputTextStyle.copyWith(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            hintText: 'ex: Sop Buntut',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 26),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      controller: _tfDetailController,
                      focusNode: FocusNode(
                        onKey: (node, event) {
                          if (event.isKeyPressed(LogicalKeyboardKey.enter) ||
                              event.isKeyPressed(
                                  LogicalKeyboardKey.numpadEnter)) {
                            _tfDetailController.text += '\n$listDot';
                            _tfDetailController.selection =
                                TextSelection.collapsed(
                                    offset: _tfDetailController.text.length);
                          } else {
                            return KeyEventResult.ignored;
                          }
                          return KeyEventResult.handled;
                        },
                      ),
                      maxLines: 5,
                      onChanged: (val) {
                        print('onchaged');
                        if (val.length == 1) {
                          // print('le');
                          _tfDetailController.text.padLeft(1, listDot);
                          setState(() {});
                        }
                      },
                      decoration: InputDecoration(
                        label: Text(
                          'Detail Menu',
                          style: inputTextStyle.copyWith(
                              color: Colors.black.withOpacity(0.5)),
                        ),
                        hintText: 'ex: $listDot Sop Buntut',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 26),
                  SizedBox(
                    width: 292,
                    child: TextFormField(
                      controller: _tfUploadController,
                      readOnly: true,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.file_upload_outlined,
                          color: Colors.black,
                        ),
                        label: Text(
                          'Upload Gambar',
                          style: inputTextStyle.copyWith(
                              color: Colors.black.withOpacity(0.5)),
                        ),
                        hintText: 'Pilih gambar',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        child: OutlinedButton(
                          onPressed: null,
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.all(16)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          child: Text(
                            'Batal',
                            style: bigButtonTextStyle,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Simpan',
                            style: bigButtonTextStyle.copyWith(
                                color: Colors.white),
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
