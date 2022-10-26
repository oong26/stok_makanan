// Routes
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

// Host
const String DOMAIN = 'localhost';
const String ASSET_URL = 'http://$DOMAIN/stok_makanan_api/upload/';
