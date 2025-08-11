import 'dart:async';

import 'serialization_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primary,
          child: Center(
            child: Image.asset(
              'assets/images/First_Screen.jpg',
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              fit: BoxFit.cover,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'HomePage': ParameterData.none(),
  'LoginScreen': ParameterData.none(),
  'ForgotPasswordScreen': ParameterData.none(),
  'ForgotPasswordEnterCodeScreen': (data) async => ParameterData(
        allParams: {
          'token': getParameter<String>(data, 'token'),
        },
      ),
  'ForgotPasswordRecreatePasswordScreen': (data) async => ParameterData(
        allParams: {
          'token': getParameter<String>(data, 'token'),
          'code': getParameter<String>(data, 'code'),
        },
      ),
  'SplashScreen': (data) async => ParameterData(
        allParams: {
          'nextPage': getParameter<String>(data, 'nextPage'),
        },
      ),
  'RegisterScreen': ParameterData.none(),
  'ProfileScreen': ParameterData.none(),
  'ProfileGalleryScreen': ParameterData.none(),
  'MyDogsScreen': ParameterData.none(),
  'DogProfileScreen': (data) async => ParameterData(
        allParams: {
          'id': getParameter<int>(data, 'id'),
        },
      ),
  'DogGalleryScreen': (data) async => ParameterData(
        allParams: {
          'id': getParameter<int>(data, 'id'),
        },
      ),
  'NotificationsScreen': ParameterData.none(),
  'IntroductionScreen': ParameterData.none(),
  'AddNewDogScreen': ParameterData.none(),
  'MyMessagesScreen': ParameterData.none(),
  'MyFriendsScreen': ParameterData.none(),
  'MessageScreen': (data) async => ParameterData(
        allParams: {
          'token': getParameter<String>(data, 'token'),
          'receiverId': getParameter<int>(data, 'receiverId'),
          'receiverPhoto': getParameter<String>(data, 'receiverPhoto'),
          'receiverName': getParameter<String>(data, 'receiverName'),
        },
      ),
  'ProfilePreviewScreen': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'DogProfilePreviewScreen': (data) async => ParameterData(
        allParams: {
          'id': getParameter<int>(data, 'id'),
        },
      ),
  'SettingsScreen': ParameterData.none(),
  'SwipeScreen': ParameterData.none(),
  'NotificationLikeScreen': (data) async => ParameterData(
        allParams: {
          'type': getParameter<String>(data, 'type'),
        },
      ),
  'qwe': ParameterData.none(),
  'ChangePasswordScreen': ParameterData.none(),
  'ForgotPasswordSettingsScreen': ParameterData.none(),
  'NewPasswordSettingsScreen': (data) async => ParameterData(
        allParams: {
          'token': getParameter<String>(data, 'token'),
          'code': getParameter<String>(data, 'code'),
        },
      ),
  'CheckCodeScreen': (data) async => ParameterData(
        allParams: {
          'token': getParameter<String>(data, 'token'),
        },
      ),
  'FriendProfileScreen': (data) async => ParameterData(
        allParams: {
          'id': getParameter<int>(data, 'id'),
          'chatToken': getParameter<String>(data, 'chatToken'),
        },
      ),
  'PreferedDogScreen': ParameterData.none(),
  'NotificationFriendScreen': (data) async => ParameterData(
        allParams: {
          'type': getParameter<String>(data, 'type'),
          'requestId': getParameter<int>(data, 'requestId'),
        },
      ),
  'SearchScreen': ParameterData.none(),
  'ShowUserImage': (data) async => ParameterData(
        allParams: {
          'image': getParameter<String>(data, 'image'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
