import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'introduction_screen_widget.dart' show IntroductionScreenWidget;
import 'package:flutter/material.dart';

class IntroductionScreenModel
    extends FlutterFlowModel<IntroductionScreenWidget> {
  ///  Local state fields for this page.

  bool isLanguagesOpen = false;

  String currentLanguage = 'EN';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
