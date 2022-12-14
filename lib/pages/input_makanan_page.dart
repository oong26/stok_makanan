import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stok_makanan/cubit/store_makanan_cubit.dart';
import 'package:stok_makanan/utils/colors.dart';
import 'package:stok_makanan/utils/constants.dart';
import 'package:stok_makanan/utils/styles.dart';
import 'dart:html';

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
  Uint8List? uploadedImage;

  List<String> _dropdownItems = [
    'Pilih Kategori',
    'A',
    'B',
  ];

  String _selectedKategori = 'Pilih Kategori';
  String fileBase64 = '';

  _startFilePicker() async {
    FileUploadInputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      // read file content as dataURL
      final files = uploadInput.files;
      if (files!.length == 1) {
        final file = files[0];
        FileReader reader = FileReader();

        reader.onLoadEnd.listen((e) {
          setState(() {
            _tfUploadController.text = file.name;
            uploadedImage = reader.result as Uint8List?;
            fileBase64 = uint8ListTob64(uploadedImage!);
          });
        });

        reader.onError.listen((fileEvent) {
          print("Some Error occured while reading the file");
        });

        reader.readAsArrayBuffer(file);
      }
    });
  }

  void _submit() {
    // set up the button
    Widget cancelButton = TextButton(
      child: Text("Batal"),
      onPressed: () => Navigator.pop(context),
    );
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        BlocProvider.of<StoreMakananCubit>(context).store(
          shift: _tfShiftController.text,
          kategori: _selectedKategori,
          stok: _tfStokController.text,
          nama: _tfNamaController.text,
          detail: _tfDetailController.text,
          filename: _tfNamaController.text.replaceAll(' ', '_').toLowerCase(),
          fileBase64: fileBase64,
          fileExt: _tfUploadController.text.split('.').last,
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Konfirmasi"),
      content: Text("Anda yakin akan menyimpan data ini?"),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: BlocConsumer<StoreMakananCubit, StoreMakananState>(
            listener: (context, state) {
              if (state is StoreMakananSuccess) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Berhasil',
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Colors.white)),
                  backgroundColor: Colors.green,
                ));
              }

              if (state is StoreMakananError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message,
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Colors.white)),
                  backgroundColor: Colors.red,
                ));
              }
            },
            builder: (context, state) {
              if (state is StoreMakananLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Form(
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
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          e,
                                          style: inputTextStyle.copyWith(
                                              color: Colors.black
                                                  .withOpacity(0.5)),
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
                              if (event
                                      .isKeyPressed(LogicalKeyboardKey.enter) ||
                                  event.isKeyPressed(
                                      LogicalKeyboardKey.numpadEnter)) {
                                _tfDetailController.text += '\n$listDot';
                                _tfDetailController.selection =
                                    TextSelection.collapsed(
                                        offset:
                                            _tfDetailController.text.length);
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
                            hintText: 'ex:  Sop Buntut',
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
                            suffixIcon: GestureDetector(
                              // onTap: () => pickImage(),
                              onTap: () => _startFilePicker(),
                              // onTap: () async {
                              //   var picked = await FilePicker.platform.pickFiles();

                              //   if (picked != null) {
                              //     print(picked.files.first.name);
                              //   }
                              // },
                              child: const Icon(
                                Icons.file_upload_outlined,
                                color: Colors.black,
                              ),
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
                                        borderRadius:
                                            BorderRadius.circular(10))),
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
                              onPressed: () => _submit(),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
