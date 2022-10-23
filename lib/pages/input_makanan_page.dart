import 'package:flutter/material.dart';
import 'package:stok_makanan/utils/colors.dart';
import 'package:stok_makanan/utils/constants.dart';
import 'package:stok_makanan/utils/styles.dart';

class InputMakananPage extends StatefulWidget {
  const InputMakananPage({Key? key}) : super(key: key);

  @override
  State<InputMakananPage> createState() => _InputMakananPageState();
}

class _InputMakananPageState extends State<InputMakananPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
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
                      SizedBox(
                        width: 292,
                        child: TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.black,
                            ),
                            label: Text(
                              'Kategori Menu',
                              style: inputTextStyle.copyWith(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            hintText: 'A',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
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
                      maxLines: 5,
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
