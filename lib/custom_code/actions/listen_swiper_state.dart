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

import 'package:flutter_card_swiper/flutter_card_swiper.dart';

Future listenSwiperState() async {
  appNavigatorKey.currentContext?.visitChildElements((element) {
    //Mevcut sayfanın elemanlarını gez.
    if (element.widget is CardSwiper) {
      //Eğer eleman CardSwiper ise.
      final cardSwiperKey = (element.widget as CardSwiper).key;
      if (cardSwiperKey != null && cardSwiperKey is GlobalKey) {
        final cardSwiperState = cardSwiperKey!.currentState;
        if (cardSwiperState != null) {
          // CardSwiperState'in içindeki istediğiniz değeri alın
          print("card swiper");
          print(cardSwiperState);
        }
      }
    }
  });
}
