import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:new_digit_app/data/nosql/localization.dart';
import 'package:path_provider/path_provider.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class Constants {
  late Future<Isar> _isar;
  late String _version;
  static final Constants _instance = Constants._();

  Constants._() {
    _isar = openIsar();
  }
  factory Constants() {
    return _instance;
  }

  // Future initialize(version) async {
  //   await _initializeIsar(version);
  // }

  // Future<void> _initializeIsar(version) async {
  //   _isar = Constants().isar;
  //   final isar = await _isar;
  //   _version = version;
  // }

  Future<Isar> get isar {
    return _isar;
  }

  String get version {
    return _version;
  }

  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      final directory = await getApplicationDocumentsDirectory();

      return await Isar.open(
        [
          LocalizationWrapperSchema,
        ],
        name: 'HCM',
        inspector: true,
        directory: directory.path,
      );
    } else {
      return await Future.value(Isar.getInstance());
    }
  }

  static const String localizationApiPath = 'localization/messages/v1/_search';
}
