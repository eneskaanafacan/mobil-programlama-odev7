import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

var kLocalHostUrl = dotenv.env['API_URL'] ?? 'Default URL';

const kLinearGradientAppColor = LinearGradient(
  colors: [Color.fromARGB(255, 2, 46, 81), Color.fromARGB(255, 102, 48, 227)],
);

const kAppBarTitleTextStyle = TextStyle(
  fontSize: 30,
  color: Colors.white,
);
