// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<SelectableOptionTypeStruct>> searchSelectableOptions(
  String search,
  List<SelectableOptionTypeStruct> list,
) async {
  if (search.trim().isEmpty) {
    return [];
  }

  // Arama ifadesini küçük harfe çevirerek karşılaştırmayı duyarlı olmaktan çıkarıyoruz
  final lowerCaseSearch = search.toLowerCase();

  // Listedeki her bir elemanı kontrol ederek arama ifadesine uyanları filtrele
  final filteredList = list.where((option) {
    return option.title.toLowerCase().contains(lowerCaseSearch);
  }).toList();

  return filteredList;
}
