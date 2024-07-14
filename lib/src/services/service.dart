import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_calo_app/src/models/model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_calo_app/src/presentations/screens/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_calo_app/src/utils/util.dart';
import 'package:m_widget/m_widget.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'api_client.dart';