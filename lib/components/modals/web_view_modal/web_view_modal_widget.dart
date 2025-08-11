import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'web_view_modal_model.dart';
export 'web_view_modal_model.dart';

class WebViewModalWidget extends StatefulWidget {
  const WebViewModalWidget({super.key});

  @override
  State<WebViewModalWidget> createState() => _WebViewModalWidgetState();
}

class _WebViewModalWidgetState extends State<WebViewModalWidget> {
  late WebViewModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebViewModalModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FlutterFlowWebView(
                        content: 'https://patidoapp.com/gizlilik-politikasi',
                        bypass: false,
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        verticalScroll: true,
                        horizontalScroll: false,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional(0.96, -1.0),
            child: FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.close,
                color: FlutterFlowTheme.of(context).primary,
                size: 32.0,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
