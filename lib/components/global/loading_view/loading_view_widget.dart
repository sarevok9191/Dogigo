import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'loading_view_model.dart';
export 'loading_view_model.dart';

class LoadingViewWidget extends StatefulWidget {
  const LoadingViewWidget({
    super.key,
    double? indicatorSize,
  }) : this.indicatorSize = indicatorSize ?? 80.0;

  final double indicatorSize;

  @override
  State<LoadingViewWidget> createState() => _LoadingViewWidgetState();
}

class _LoadingViewWidgetState extends State<LoadingViewWidget> {
  late LoadingViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingViewModel());
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
        color: Color(0x50FFBE98),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/jsons/lottieflow-cta-04-f25822-easey.json',
            width: widget.indicatorSize,
            height: widget.indicatorSize,
            fit: BoxFit.contain,
            animate: true,
          ),
        ],
      ),
    );
  }
}
