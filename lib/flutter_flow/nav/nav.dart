import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? SplashScreenWidget()
          : SplashScreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? SplashScreenWidget()
              : SplashScreenWidget(),
          routes: [
            FFRoute(
              name: HomePageWidget.routeName,
              path: HomePageWidget.routePath,
              builder: (context, params) => HomePageWidget(),
            ),
            FFRoute(
              name: LoginScreenWidget.routeName,
              path: LoginScreenWidget.routePath,
              builder: (context, params) => LoginScreenWidget(),
            ),
            FFRoute(
              name: ForgotPasswordScreenWidget.routeName,
              path: ForgotPasswordScreenWidget.routePath,
              builder: (context, params) => ForgotPasswordScreenWidget(),
            ),
            FFRoute(
              name: ForgotPasswordEnterCodeScreenWidget.routeName,
              path: ForgotPasswordEnterCodeScreenWidget.routePath,
              builder: (context, params) => ForgotPasswordEnterCodeScreenWidget(
                token: params.getParam(
                  'token',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ForgotPasswordRecreatePasswordScreenWidget.routeName,
              path: ForgotPasswordRecreatePasswordScreenWidget.routePath,
              builder: (context, params) =>
                  ForgotPasswordRecreatePasswordScreenWidget(
                token: params.getParam(
                  'token',
                  ParamType.String,
                ),
                code: params.getParam(
                  'code',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SplashScreenWidget.routeName,
              path: SplashScreenWidget.routePath,
              builder: (context, params) => SplashScreenWidget(
                nextPageData: params.getParam(
                  'nextPageData',
                  ParamType.JSON,
                ),
                nextPage: params.getParam(
                  'nextPage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RegisterScreenWidget.routeName,
              path: RegisterScreenWidget.routePath,
              builder: (context, params) => RegisterScreenWidget(),
            ),
            FFRoute(
              name: ProfileScreenWidget.routeName,
              path: ProfileScreenWidget.routePath,
              builder: (context, params) => ProfileScreenWidget(),
            ),
            FFRoute(
              name: ProfileGalleryScreenWidget.routeName,
              path: ProfileGalleryScreenWidget.routePath,
              builder: (context, params) => ProfileGalleryScreenWidget(),
            ),
            FFRoute(
              name: MyDogsScreenWidget.routeName,
              path: MyDogsScreenWidget.routePath,
              builder: (context, params) => MyDogsScreenWidget(),
            ),
            FFRoute(
              name: DogProfileScreenWidget.routeName,
              path: DogProfileScreenWidget.routePath,
              builder: (context, params) => DogProfileScreenWidget(
                id: params.getParam(
                  'id',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: DogGalleryScreenWidget.routeName,
              path: DogGalleryScreenWidget.routePath,
              builder: (context, params) => DogGalleryScreenWidget(
                id: params.getParam(
                  'id',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: NotificationsScreenWidget.routeName,
              path: NotificationsScreenWidget.routePath,
              builder: (context, params) => NotificationsScreenWidget(),
            ),
            FFRoute(
              name: IntroductionScreenWidget.routeName,
              path: IntroductionScreenWidget.routePath,
              builder: (context, params) => IntroductionScreenWidget(),
            ),
            FFRoute(
              name: AddNewDogScreenWidget.routeName,
              path: AddNewDogScreenWidget.routePath,
              builder: (context, params) => AddNewDogScreenWidget(),
            ),
            FFRoute(
              name: MyMessagesScreenWidget.routeName,
              path: MyMessagesScreenWidget.routePath,
              builder: (context, params) => MyMessagesScreenWidget(),
            ),
            FFRoute(
              name: MyFriendsScreenWidget.routeName,
              path: MyFriendsScreenWidget.routePath,
              builder: (context, params) => MyFriendsScreenWidget(),
            ),
            FFRoute(
              name: MessageScreenWidget.routeName,
              path: MessageScreenWidget.routePath,
              builder: (context, params) => MessageScreenWidget(
                token: params.getParam(
                  'token',
                  ParamType.String,
                ),
                receiverId: params.getParam(
                  'receiverId',
                  ParamType.int,
                ),
                receiverPhoto: params.getParam(
                  'receiverPhoto',
                  ParamType.String,
                ),
                receiverName: params.getParam(
                  'receiverName',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ProfilePreviewScreenWidget.routeName,
              path: ProfilePreviewScreenWidget.routePath,
              builder: (context, params) => ProfilePreviewScreenWidget(
                userInfos: params.getParam(
                  'userInfos',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: UserStruct.fromSerializableMap,
                ),
              ),
            ),
            FFRoute(
              name: DogProfilePreviewScreenWidget.routeName,
              path: DogProfilePreviewScreenWidget.routePath,
              builder: (context, params) => DogProfilePreviewScreenWidget(
                id: params.getParam(
                  'id',
                  ParamType.int,
                ),
                dogInfos: params.getParam(
                  'dogInfos',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: DogTypeStruct.fromSerializableMap,
                ),
              ),
            ),
            FFRoute(
              name: SettingsScreenWidget.routeName,
              path: SettingsScreenWidget.routePath,
              builder: (context, params) => SettingsScreenWidget(),
            ),
            FFRoute(
              name: SwipeScreenWidget.routeName,
              path: SwipeScreenWidget.routePath,
              builder: (context, params) => SwipeScreenWidget(),
            ),
            FFRoute(
              name: NotificationLikeScreenWidget.routeName,
              path: NotificationLikeScreenWidget.routePath,
              builder: (context, params) => NotificationLikeScreenWidget(
                dog: params.getParam(
                  'dog',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: DogTypeStruct.fromSerializableMap,
                ),
                user: params.getParam(
                  'user',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: UserStruct.fromSerializableMap,
                ),
                type: params.getParam(
                  'type',
                  ParamType.String,
                ),
                userDog: params.getParam(
                  'userDog',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: DogTypeStruct.fromSerializableMap,
                ),
              ),
            ),
            FFRoute(
              name: QweWidget.routeName,
              path: QweWidget.routePath,
              builder: (context, params) => QweWidget(),
            ),
            FFRoute(
              name: ChangePasswordScreenWidget.routeName,
              path: ChangePasswordScreenWidget.routePath,
              builder: (context, params) => ChangePasswordScreenWidget(),
            ),
            FFRoute(
              name: ForgotPasswordSettingsScreenWidget.routeName,
              path: ForgotPasswordSettingsScreenWidget.routePath,
              builder: (context, params) =>
                  ForgotPasswordSettingsScreenWidget(),
            ),
            FFRoute(
              name: NewPasswordSettingsScreenWidget.routeName,
              path: NewPasswordSettingsScreenWidget.routePath,
              builder: (context, params) => NewPasswordSettingsScreenWidget(
                token: params.getParam(
                  'token',
                  ParamType.String,
                ),
                code: params.getParam(
                  'code',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CheckCodeScreenWidget.routeName,
              path: CheckCodeScreenWidget.routePath,
              builder: (context, params) => CheckCodeScreenWidget(
                token: params.getParam(
                  'token',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: FriendProfileScreenWidget.routeName,
              path: FriendProfileScreenWidget.routePath,
              builder: (context, params) => FriendProfileScreenWidget(
                id: params.getParam(
                  'id',
                  ParamType.int,
                ),
                chatToken: params.getParam(
                  'chatToken',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: PreferedDogScreenWidget.routeName,
              path: PreferedDogScreenWidget.routePath,
              builder: (context, params) => PreferedDogScreenWidget(),
            ),
            FFRoute(
              name: NotificationFriendScreenWidget.routeName,
              path: NotificationFriendScreenWidget.routePath,
              builder: (context, params) => NotificationFriendScreenWidget(
                dog: params.getParam(
                  'dog',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: DogTypeStruct.fromSerializableMap,
                ),
                user: params.getParam(
                  'user',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: UserStruct.fromSerializableMap,
                ),
                type: params.getParam(
                  'type',
                  ParamType.String,
                ),
                userDog: params.getParam(
                  'userDog',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: DogTypeStruct.fromSerializableMap,
                ),
                requestId: params.getParam(
                  'requestId',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: SearchScreenWidget.routeName,
              path: SearchScreenWidget.routePath,
              builder: (context, params) => SearchScreenWidget(),
            ),
            FFRoute(
              name: ShowUserImageWidget.routeName,
              path: ShowUserImageWidget.routePath,
              builder: (context, params) => ShowUserImageWidget(
                image: params.getParam(
                  'image',
                  ParamType.String,
                ),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/splashScreen';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
