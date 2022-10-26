// Routes
import 'dart:convert';
import 'dart:typed_data';

import 'package:intl/intl.dart';

const String splashRoute = '/';
const String listMakananRoute = '/makanan';
const String inputMakananRoute = '/makanan/create';
const String detailMakananRoute = '/makanan/detail';
const String stokMakananRoute = '/makanan/stok';

// Utilities
const String listDot = '\u2022';
final dateFormat = DateFormat('yyyy-MM-d');
final dayDateFormat = DateFormat('EEE d MMMM yyyy');
final dateTimeFormat = DateFormat('yyyy-MM-d H:mm');
String uint8ListTob64(Uint8List uint8list) {
  String base64String = base64Encode(uint8list);
  String header = "data:image/png;base64,";
  return header + base64String;
}

// Host
const String DOMAIN = 'localhost';
const String ASSET_URL = 'http://$DOMAIN/stok_makanan_api/upload/';
Map<String, String> defaultHeader = {
  'Accept': '*/*',
  'Content-Type': 'application/json',
  'Connection': 'keep-alive',
  'Accept-Encoding': 'gzip',
};
