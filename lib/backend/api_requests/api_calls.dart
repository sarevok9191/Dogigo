import 'dart:convert';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';
import 'interceptors.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Authentication Group Code

class AuthenticationGroup {
  static String getBaseUrl() => 'https://patidoapp.com/api/';
  static Map<String, String> headers = {};
  static LoginCall loginCall = LoginCall();
  static RegisterCall registerCall = RegisterCall();
  static LogoutCall logoutCall = LogoutCall();
  static ForgotPasswordCall forgotPasswordCall = ForgotPasswordCall();
  static CheckResetCodeCall checkResetCodeCall = CheckResetCodeCall();
  static ResetPasswordCall resetPasswordCall = ResetPasswordCall();
  static DeviceTokenCall deviceTokenCall = DeviceTokenCall();
  static RefreshAccessTokenCall refreshAccessTokenCall =
      RefreshAccessTokenCall();
  static RegisterJSONCall registerJSONCall = RegisterJSONCall();
  static CheckRegisterUniqueCall checkRegisterUniqueCall =
      CheckRegisterUniqueCall();

  static final interceptors = [
    LocalizationInterceptor(),
    DateTimeInterceptor(),
  ];
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = AuthenticationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Login',
        apiUrl: '${baseUrl}login',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      AuthenticationGroup.interceptors,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic errors(dynamic response) => getJsonField(
        response,
        r'''$.errors''',
      );
}

class RegisterCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? surname = '',
    String? phoneNumber = '',
    String? email = '',
    String? username = '',
    String? password = '',
    String? repeatPassword = '',
    String? birthdate = '',
    int? gender,
    int? country,
    int? city,
    String? address = '',
    FFUploadedFile? photo,
    String? dogName = '',
    int? kindOfDog,
    String? dogBirthdate = '',
    int? dogGender,
    String? dogPhoto = '',
    dynamic relationsJson,
  }) async {
    final baseUrl = AuthenticationGroup.getBaseUrl();

    final relations = _serializeJson(relationsJson);

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Register',
        apiUrl: '${baseUrl}register',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'first_name': name,
          'last_name': surname,
          'email': email,
          'password': password,
          'password_confirmation': repeatPassword,
          'phone_number': phoneNumber,
          'address': address,
          'country_id': country,
          'user_gender': gender,
          'city_id': city,
          'date_birth': birthdate,
          'avatar': photo,
        },

        bodyType: BodyType.MULTIPART,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      AuthenticationGroup.interceptors,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
}

class LogoutCall {
  Future<ApiCallResponse> call({
    String? refreshToken = '',
  }) async {
    final baseUrl = AuthenticationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "refresh_token": "${escapeStringForJson(refreshToken)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Logout',
        apiUrl: '${baseUrl}logout',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    AuthenticationInterceptor(),
    LocalizationInterceptor(),
    DateTimeInterceptor(),
  ];
}

class ForgotPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = AuthenticationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Forgot Password',
        apiUrl: '${baseUrl}forgot-password',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      AuthenticationGroup.interceptors,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class CheckResetCodeCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? code = '',
  }) async {
    final baseUrl = AuthenticationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "code": "${escapeStringForJson(code)}",
  "token": "${escapeStringForJson(token)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Check Reset Code',
        apiUrl: '${baseUrl}check-reset-code',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      AuthenticationGroup.interceptors,
    );
  }

  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class ResetPasswordCall {
  Future<ApiCallResponse> call({
    String? code = '',
    String? password = '',
    String? passwordConfirmation = '',
    String? token = '',
  }) async {
    final baseUrl = AuthenticationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "code": "${escapeStringForJson(code)}",
  "password": "${escapeStringForJson(password)}",
  "password_confirmation": "${escapeStringForJson(passwordConfirmation)}",
  "token": "${escapeStringForJson(token)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Reset Password',
        apiUrl: '${baseUrl}reset-password',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      AuthenticationGroup.interceptors,
    );
  }
}

class DeviceTokenCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = AuthenticationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "token": "${escapeStringForJson(token)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Device Token',
        apiUrl: '${baseUrl}user/devicetoken',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    AuthenticationInterceptor(),
    LocalizationInterceptor(),
  ];
}

class RefreshAccessTokenCall {
  Future<ApiCallResponse> call({
    String? refreshToken = '',
  }) async {
    final baseUrl = AuthenticationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "refresh_token": "${escapeStringForJson(refreshToken)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Refresh Access Token',
        apiUrl: '${baseUrl}refresh-access-token',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      AuthenticationGroup.interceptors,
    );
  }
}

class RegisterJSONCall {
  Future<ApiCallResponse> call({
    dynamic bodyJson,
  }) async {
    final baseUrl = AuthenticationGroup.getBaseUrl();

    final body = _serializeJson(bodyJson);

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Register JSON',
        apiUrl: '${baseUrl}register',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        bodyType: BodyType.MULTIPART,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      AuthenticationGroup.interceptors,
    );
  }
}

class CheckRegisterUniqueCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? username = '',
    String? dateBirth = '',
    String? password = '',
    String? passwordConfirmation = '',
  }) async {
    final baseUrl = AuthenticationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "username": "${escapeStringForJson(username)}",
  "date_birth": "${escapeStringForJson(dateBirth)}",
  "password": "${escapeStringForJson(password)}",
  "password_confirmation": "${escapeStringForJson(passwordConfirmation)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Check Register Unique',
        apiUrl: '${baseUrl}checkRegisterUniques',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      AuthenticationGroup.interceptors,
    );
  }
}

/// End Authentication Group Code

/// Start Static Values Group Code

class StaticValuesGroup {
  static String getBaseUrl() => 'https://patidoapp.com/api/';
  static Map<String, String> headers = {};
  static GetCountriesCall getCountriesCall = GetCountriesCall();
  static GetCitiesCall getCitiesCall = GetCitiesCall();
  static GetDogTypesCall getDogTypesCall = GetDogTypesCall();
  static PackageDetailsCall packageDetailsCall = PackageDetailsCall();
  static GetGendersCall getGendersCall = GetGendersCall();
  static GetLanguagesCall getLanguagesCall = GetLanguagesCall();
  static SidebarCall sidebarCall = SidebarCall();
  static InAppPurchaseConfigurationCall inAppPurchaseConfigurationCall =
      InAppPurchaseConfigurationCall();
  static DogGendersCall dogGendersCall = DogGendersCall();

  static final interceptors = [
    DateTimeInterceptor(),
    LocalizationInterceptor(),
  ];
}

class GetCountriesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = StaticValuesGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Get Countries',
        apiUrl: '${baseUrl}countries',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      StaticValuesGroup.interceptors,
    );
  }
}

class GetCitiesCall {
  Future<ApiCallResponse> call({
    int? countryId,
  }) async {
    final baseUrl = StaticValuesGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Get Cities',
        apiUrl: '${baseUrl}cities',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'city_country': countryId,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      StaticValuesGroup.interceptors,
    );
  }
}

class GetDogTypesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = StaticValuesGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Get Dog Types',
        apiUrl: '${baseUrl}dog-types',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      StaticValuesGroup.interceptors,
    );
  }
}

class PackageDetailsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = StaticValuesGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Package Details',
        apiUrl: '${baseUrl}package-details',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      StaticValuesGroup.interceptors,
    );
  }
}

class GetGendersCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = StaticValuesGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Get Genders',
        apiUrl: '${baseUrl}genders',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      StaticValuesGroup.interceptors,
    );
  }
}

class GetLanguagesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = StaticValuesGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Get Languages',
        apiUrl: '${baseUrl}languages',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      StaticValuesGroup.interceptors,
    );
  }
}

class SidebarCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = StaticValuesGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Sidebar',
        apiUrl: '${baseUrl}sidebar',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    AuthenticationInterceptor(),
    LocalizationInterceptor(),
    DateTimeInterceptor(),
  ];
}

class InAppPurchaseConfigurationCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = StaticValuesGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'In App Purchase Configuration',
        apiUrl: '${baseUrl}in-app-purchase-configuration',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      StaticValuesGroup.interceptors,
    );
  }
}

class DogGendersCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = StaticValuesGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Dog Genders',
        apiUrl: '${baseUrl}dog-genders',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      StaticValuesGroup.interceptors,
    );
  }
}

/// End Static Values Group Code

/// Start Profile Group Code

class ProfileGroup {
  static String getBaseUrl() => 'https://patidoapp.com/api/';
  static Map<String, String> headers = {};
  static GetProfileInfosCall getProfileInfosCall = GetProfileInfosCall();
  static UpdateProfileInfosCall updateProfileInfosCall =
      UpdateProfileInfosCall();
  static GetUserSettingsCall getUserSettingsCall = GetUserSettingsCall();
  static UpdateUserSettingsCall updateUserSettingsCall =
      UpdateUserSettingsCall();
  static DeleteAccountCall deleteAccountCall = DeleteAccountCall();
  static ChangePasswordCall changePasswordCall = ChangePasswordCall();
  static UpdateProfileVisibilityCall updateProfileVisibilityCall =
      UpdateProfileVisibilityCall();
  static GetProfileVisibilityCall getProfileVisibilityCall =
      GetProfileVisibilityCall();
  static UpdateMapVisibilityCall updateMapVisibilityCall =
      UpdateMapVisibilityCall();
  static UpdateLocaleCall updateLocaleCall = UpdateLocaleCall();
  static UpdateUserAvatarCall updateUserAvatarCall = UpdateUserAvatarCall();

  static final interceptors = [
    AuthenticationInterceptor(),
    DateTimeInterceptor(),
  ];
}

class GetProfileInfosCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = ProfileGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Get Profile Infos',
        apiUrl: '${baseUrl}selfUser',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ProfileGroup.interceptors,
    );
  }
}

class UpdateProfileInfosCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? phoneNumber = '',
    String? username = '',
    int? countryId,
    int? userGender,
    int? cityId,
    String? dateBirth = '',
    String? address = '',
    bool? visibleMap,
    String? avatar = '',
    String? preferredLocale = '',
    String? about = '',
  }) async {
    final baseUrl = ProfileGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Update Profile Infos',
        apiUrl: '${baseUrl}selfUser',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'first_name': firstName,
          'last_name': lastName,
          'phone_number': phoneNumber,
          'username': username,
          'email': email,
          'date_birth': dateBirth,
          'user_gender': userGender,
          'country_id': countryId,
          'city_id': cityId,
          'address': address,
          '_method': "PUT",
          'about': about,
        },

        bodyType: BodyType.MULTIPART,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ProfileGroup.interceptors,
    );
  }
}

class GetUserSettingsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = ProfileGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Get User Settings',
        apiUrl: '${baseUrl}settings',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ProfileGroup.interceptors,
    );
  }

  dynamic record(dynamic response) => getJsonField(
        response,
        r'''$.record''',
      );
  bool? ageFriends(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.record.age_friends''',
      ));
  bool? locationFriends(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.record.location_friends''',
      ));
  bool? distanceFriends(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.record.distance_friends''',
      ));
  bool? sexFriends(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.record.sex_friends''',
      ));
  bool? ageArent(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.record.age_arent''',
      ));
  bool? locationArent(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.record.location_arent''',
      ));
  bool? distanceArent(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.record.distance_arent''',
      ));
  bool? sexArent(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.record.sex_arent''',
      ));
  bool? beingLiked(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.record.being_liked''',
      ));
  bool? friendRequest(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.record.friend_request''',
      ));
  bool? beingTouched(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.record.being_touched''',
      ));
  bool? forMessages(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.record.for_messages''',
      ));
  bool? patidoNews(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.record.patido_news''',
      ));
}

class UpdateUserSettingsCall {
  Future<ApiCallResponse> call({
    String? key = '',
    bool? value,
    int? visibleMap,
  }) async {
    final baseUrl = ProfileGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "${escapeStringForJson(key)}": ${value}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Update User Settings',
        apiUrl: '${baseUrl}settings',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ProfileGroup.interceptors,
    );
  }
}

class DeleteAccountCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = ProfileGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Delete Account',
        apiUrl: '${baseUrl}destroyUser',
        callType: ApiCallType.DELETE,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ProfileGroup.interceptors,
    );
  }
}

class ChangePasswordCall {
  Future<ApiCallResponse> call({
    String? oldPassword = '',
    String? password = '',
    String? passwordConfirmation = '',
  }) async {
    final baseUrl = ProfileGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "old_password": "${escapeStringForJson(oldPassword)}",
  "password": "${escapeStringForJson(password)}",
  "password_confirmation": "${escapeStringForJson(passwordConfirmation)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Change Password',
        apiUrl: '${baseUrl}change-password',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ProfileGroup.interceptors,
    );
  }
}

class UpdateProfileVisibilityCall {
  Future<ApiCallResponse> call({
    List<int>? idsList,
  }) async {
    final baseUrl = ProfileGroup.getBaseUrl();
    final ids = _serializeList(idsList);

    final ffApiRequestBody = '''
{
  "ids": ${ids}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Update Profile Visibility',
        apiUrl: '${baseUrl}sync-selected-users',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ProfileGroup.interceptors,
    );
  }
}

class GetProfileVisibilityCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = ProfileGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Get Profile Visibility',
        apiUrl: '${baseUrl}selected-users',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ProfileGroup.interceptors,
    );
  }
}

class UpdateMapVisibilityCall {
  Future<ApiCallResponse> call({
    String? visibleMap = '',
  }) async {
    final baseUrl = ProfileGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "visible_map": "${escapeStringForJson(visibleMap)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Update Map Visibility',
        apiUrl: '${baseUrl}settings',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ProfileGroup.interceptors,
    );
  }
}

class UpdateLocaleCall {
  Future<ApiCallResponse> call({
    String? preferredLocale = '',
  }) async {
    final baseUrl = ProfileGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "preferred_locale": "${escapeStringForJson(preferredLocale)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Update Locale',
        apiUrl: '${baseUrl}update-locale',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ProfileGroup.interceptors,
    );
  }
}

class UpdateUserAvatarCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? avatar,
  }) async {
    final baseUrl = ProfileGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Update User Avatar',
        apiUrl: '${baseUrl}user/update-avatar',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'avatar': avatar,
        },

        bodyType: BodyType.MULTIPART,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ProfileGroup.interceptors,
    );
  }
}

/// End Profile Group Code

/// Start Dogs Group Code

class DogsGroup {
  static String getBaseUrl() => 'https://patidoapp.com/api/';
  static Map<String, String> headers = {};
  static DogsIndexCall dogsIndexCall = DogsIndexCall();
  static ShowDogCall showDogCall = ShowDogCall();
  static DeleteDogCall deleteDogCall = DeleteDogCall();
  static CreateDogCall createDogCall = CreateDogCall();
  static UpdateDogCall updateDogCall = UpdateDogCall();
  static UploadImageForDogCall uploadImageForDogCall = UploadImageForDogCall();
  static UpdateAvatarCall updateAvatarCall = UpdateAvatarCall();
  static SelectActiveDogCall selectActiveDogCall = SelectActiveDogCall();

  static final interceptors = [
    AuthenticationInterceptor(),
    DateTimeInterceptor(),
  ];
}

class DogsIndexCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = DogsGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Dogs Index',
        apiUrl: '${baseUrl}dogs',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      DogsGroup.interceptors,
    );
  }

  dynamic records(dynamic response) => getJsonField(
        response,
        r'''$.records''',
      );
}

class ShowDogCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = DogsGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Show Dog',
        apiUrl: '${baseUrl}dogs/${id}',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      DogsGroup.interceptors,
    );
  }

  dynamic record(dynamic response) => getJsonField(
        response,
        r'''$.record''',
      );
}

class DeleteDogCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = DogsGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Delete Dog',
        apiUrl: '${baseUrl}dogs/${id}',
        callType: ApiCallType.DELETE,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      DogsGroup.interceptors,
    );
  }
}

class CreateDogCall {
  Future<ApiCallResponse> call({
    String? title = '',
    String? age = '',
    int? gender,
    int? dogType,
    FFUploadedFile? image,
  }) async {
    final baseUrl = DogsGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Create Dog',
        apiUrl: '${baseUrl}dogs',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'title': title,
          'birth_date': age,
          'gender': gender,
          'dog_type_id': dogType,
          'avatar': image,
        },

        bodyType: BodyType.MULTIPART,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      DogsGroup.interceptors,
    );
  }
}

class UpdateDogCall {
  Future<ApiCallResponse> call({
    int? id,
    String? title = '',
    String? description = '',
    String? age = '',
    String? gender = '',
    int? dogType,
    FFUploadedFile? image,
  }) async {
    final baseUrl = DogsGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Update Dog',
        apiUrl: '${baseUrl}dogs/${id}',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'title': title,
          'description': description,
          'birth_date': age,
          'gender': gender,
          'dog_type_id': dogType,
          'image': image,
          '_method': "PUT",
        },

        bodyType: BodyType.MULTIPART,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      DogsGroup.interceptors,
    );
  }
}

class UploadImageForDogCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? image,
    int? id,
  }) async {
    final baseUrl = DogsGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Upload Image For Dog',
        apiUrl: '${baseUrl}dogs/${id}/upload-image',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'image': image,
        },

        bodyType: BodyType.MULTIPART,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      DogsGroup.interceptors,
    );
  }
}

class UpdateAvatarCall {
  Future<ApiCallResponse> call({
    int? id,
    FFUploadedFile? avatar,
  }) async {
    final baseUrl = DogsGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Update Avatar',
        apiUrl: '${baseUrl}dogs/ ${id}',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'avatar': avatar,
          '_method': "PUT",
        },

        bodyType: BodyType.MULTIPART,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      DogsGroup.interceptors,
    );
  }
}

class SelectActiveDogCall {
  Future<ApiCallResponse> call({
    int? dogId,
  }) async {
    final baseUrl = DogsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "dog_id": ${dogId}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Select Active Dog',
        apiUrl: '${baseUrl}user/active-dog',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      DogsGroup.interceptors,
    );
  }
}

/// End Dogs Group Code

/// Start Friends Group Code

class FriendsGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://patidoapp.com/api/';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static GetBlockedFriendsCall getBlockedFriendsCall = GetBlockedFriendsCall();
  static BlockUsersCall blockUsersCall = BlockUsersCall();
  static BlockUserCall blockUserCall = BlockUserCall();
  static UnblockUserCall unblockUserCall = UnblockUserCall();
  static GetFriendsCall getFriendsCall = GetFriendsCall();
  static AddFriendCall addFriendCall = AddFriendCall();
  static DeleteFriendCall deleteFriendCall = DeleteFriendCall();
  static GetFriendCall getFriendCall = GetFriendCall();
  static AcceptFriendCall acceptFriendCall = AcceptFriendCall();

  static final interceptors = [
    AuthenticationInterceptor(),
    DateTimeInterceptor(),
  ];
}

class GetBlockedFriendsCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = FriendsGroup.getBaseUrl(
      token: token,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Get Blocked Friends',
        apiUrl: '${baseUrl}blocked-users',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      FriendsGroup.interceptors,
    );
  }

  List<BlockedUserStruct>? blocks(dynamic response) => (getJsonField(
        response,
        r'''$.blocks''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => BlockedUserStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class BlockUsersCall {
  Future<ApiCallResponse> call({
    List<int>? idsList,
    String? token = '',
  }) async {
    final baseUrl = FriendsGroup.getBaseUrl(
      token: token,
    );
    final ids = _serializeList(idsList);

    final ffApiRequestBody = '''
{
  "ids": ${ids}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Block Users',
        apiUrl: '${baseUrl}sync-block-users',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      FriendsGroup.interceptors,
    );
  }
}

class BlockUserCall {
  Future<ApiCallResponse> call({
    int? id,
    String? token = '',
  }) async {
    final baseUrl = FriendsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "id": ${id}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Block User',
        apiUrl: '${baseUrl}block-user',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      FriendsGroup.interceptors,
    );
  }
}

class UnblockUserCall {
  Future<ApiCallResponse> call({
    int? id,
    String? token = '',
  }) async {
    final baseUrl = FriendsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "id": ${id}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Unblock User',
        apiUrl: '${baseUrl}unblock-user',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      FriendsGroup.interceptors,
    );
  }
}

class GetFriendsCall {
  Future<ApiCallResponse> call({
    String? search = '',
    String? token = '',
  }) async {
    final baseUrl = FriendsGroup.getBaseUrl(
      token: token,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Get Friends',
        apiUrl: '${baseUrl}user/friends',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'search': search,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      FriendsGroup.interceptors,
    );
  }
}

class AddFriendCall {
  Future<ApiCallResponse> call({
    int? id,
    String? token = '',
  }) async {
    final baseUrl = FriendsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "friend_id": ${id}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Add Friend',
        apiUrl: '${baseUrl}user/add-friend',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      FriendsGroup.interceptors,
    );
  }
}

class DeleteFriendCall {
  Future<ApiCallResponse> call({
    int? id,
    String? token = '',
  }) async {
    final baseUrl = FriendsGroup.getBaseUrl(
      token: token,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Delete Friend',
        apiUrl: '${baseUrl}user/remove-friend/${id}',
        callType: ApiCallType.DELETE,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      FriendsGroup.interceptors,
    );
  }
}

class GetFriendCall {
  Future<ApiCallResponse> call({
    int? id,
    String? token = '',
  }) async {
    final baseUrl = FriendsGroup.getBaseUrl(
      token: token,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Get Friend',
        apiUrl: '${baseUrl}user/friend/${id}',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      FriendsGroup.interceptors,
    );
  }
}

class AcceptFriendCall {
  Future<ApiCallResponse> call({
    int? friendRequestId,
    String? token = '',
  }) async {
    final baseUrl = FriendsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "friend_request_id": ${friendRequestId}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Accept Friend',
        apiUrl: '${baseUrl}friend-requests/approve',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      FriendsGroup.interceptors,
    );
  }
}

/// End Friends Group Code

/// Start User Actions Group Code

class UserActionsGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://patidoapp.com/api/';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static TouchCall touchCall = TouchCall();
  static ReportCall reportCall = ReportCall();
  static SearchCall searchCall = SearchCall();
  static SendFriendRequestCall sendFriendRequestCall = SendFriendRequestCall();
  static ReportContentCall reportContentCall = ReportContentCall();

  static final interceptors = [
    AuthenticationInterceptor(),
    DateTimeInterceptor(),
    LocalizationInterceptor()
  ];
}

class TouchCall {
  Future<ApiCallResponse> call({
    int? touchedUser,
    String? token = '',
  }) async {
    final baseUrl = UserActionsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "touched_user": ${touchedUser}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Touch',
        apiUrl: '${baseUrl}touch',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      UserActionsGroup.interceptors,
    );
  }
}

class ReportCall {
  Future<ApiCallResponse> call({
    int? reportedUser,
    String? token = '',
  }) async {
    final baseUrl = UserActionsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "reported_user": ${reportedUser}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Report',
        apiUrl: '${baseUrl}reports/create',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      UserActionsGroup.interceptors,
    );
  }
}

class SearchCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? token = '',
  }) async {
    final baseUrl = UserActionsGroup.getBaseUrl(
      token: token,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Search',
        apiUrl: '${baseUrl}search',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'username': username,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      UserActionsGroup.interceptors,
    );
  }
}

class SendFriendRequestCall {
  Future<ApiCallResponse> call({
    int? userId,
    int? dogId,
    String? token = '',
  }) async {
    final baseUrl = UserActionsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "user_id": ${userId}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Send Friend Request',
        apiUrl: '${baseUrl}user/sendFriendRequest',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      UserActionsGroup.interceptors,
    );
  }
}

class ReportContentCall {
  Future<ApiCallResponse> call({
    int? userId,
    int? dogId,
    String? description = '',
    String? contentType = '',
    List<String>? reasonsList,
    String? messageDocumentId = '',
    String? token = '',
  }) async {
    final baseUrl = UserActionsGroup.getBaseUrl(
      token: token,
    );
    final reasons = _serializeList(reasonsList);

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Report Content',
        apiUrl: '${baseUrl}report-content',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'user_id': userId,
          'dog_id': dogId,
          'description': description,
          'content_type': contentType,
          'reasons': reasons,
          'message_document_id': messageDocumentId,
        },

        bodyType: BodyType.MULTIPART,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      UserActionsGroup.interceptors,
    );
  }
}

/// End User Actions Group Code

/// Start Messages Group Code

class MessagesGroup {
  static String getBaseUrl() => 'https://patidoapp.com/api/';
  static Map<String, String> headers = {};
  static GetMessagesCall getMessagesCall = GetMessagesCall();
  static OnMessageCall onMessageCall = OnMessageCall();
  static AllTokensCall allTokensCall = AllTokensCall();
  static CheckChatCall checkChatCall = CheckChatCall();

  static final interceptors = [
    AuthenticationInterceptor(),
    DateTimeInterceptor(),
  ];
}

class GetMessagesCall {
  Future<ApiCallResponse> call({
    String? search = '',
  }) async {
    final baseUrl = MessagesGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Get Messages',
        apiUrl: '${baseUrl}chatList',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'search': search,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      MessagesGroup.interceptors,
    );
  }
}

class OnMessageCall {
  Future<ApiCallResponse> call({
    String? chatToken = '',
    String? message = ' ',
    String? image = '',
  }) async {
    final baseUrl = MessagesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "chat_token": "${escapeStringForJson(chatToken)}",
  "message": "${escapeStringForJson(message)}",
  "image": "${escapeStringForJson(image)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'onMessage',
        apiUrl: '${baseUrl}chatOnMessage',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      MessagesGroup.interceptors,
    );
  }
}

class AllTokensCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = MessagesGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'All Tokens',
        apiUrl: '${baseUrl}chatAllTokens',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      MessagesGroup.interceptors,
    );
  }
}

class CheckChatCall {
  Future<ApiCallResponse> call({
    String? chatToken = '',
  }) async {
    final baseUrl = MessagesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "chat_token": "${escapeStringForJson(chatToken)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Check Chat',
        apiUrl: '${baseUrl}check-chat-message',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      MessagesGroup.interceptors,
    );
  }

  bool? status(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
}

/// End Messages Group Code

/// Start Location Group Code

class LocationGroup {
  static String getBaseUrl() => 'https://patidoapp.com/api/';
  static Map<String, String> headers = {};
  static MapUsersCall mapUsersCall = MapUsersCall();
  static UpdateLocationCall updateLocationCall = UpdateLocationCall();
  static GetShowAbleTypesCall getShowAbleTypesCall = GetShowAbleTypesCall();
  static UpdateMapShowCall updateMapShowCall = UpdateMapShowCall();

  static final interceptors = [
    AuthenticationInterceptor(),
    LocalizationInterceptor(),
    DateTimeInterceptor(),
  ];
}

class MapUsersCall {
  Future<ApiCallResponse> call({
    double? latitude,
    double? longitude,
  }) async {
    final baseUrl = LocationGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'MapUsers',
        apiUrl: '${baseUrl}map/users',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'lat': latitude,
          'lng': longitude,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      LocationGroup.interceptors,
    );
  }

  String? fullname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].full_name''',
      ));
  String? firstname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].first_name''',
      ));
  String? lastname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].last_name''',
      ));
  dynamic location(dynamic response) => getJsonField(
        response,
        r'''$.records[:].location''',
      );
  double? lat(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.records[:].location.latitude''',
      ));
  double? lng(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.records[:].location.longitude''',
      ));
  List? records(dynamic response) => getJsonField(
        response,
        r'''$.recorda''',
        true,
      ) as List?;
}

class UpdateLocationCall {
  Future<ApiCallResponse> call({
    double? latitude,
    double? longitude,
  }) async {
    final baseUrl = LocationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "lat": ${latitude},
  "lng": ${longitude}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Update Location',
        apiUrl: '${baseUrl}update-location',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      LocationGroup.interceptors,
    );
  }
}

class GetShowAbleTypesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = LocationGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Get Show Able Types',
        apiUrl: '${baseUrl}map/show-types',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      LocationGroup.interceptors,
    );
  }
}

class UpdateMapShowCall {
  Future<ApiCallResponse> call({
    String? type = '',
    int? id,
  }) async {
    final baseUrl = LocationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "type": "${escapeStringForJson(type)}",
  "dog_id": "${id}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Update Map Show',
        apiUrl: '${baseUrl}update-map-show',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      LocationGroup.interceptors,
    );
  }
}

/// End Location Group Code

/// Start Files Group Code

class FilesGroup {
  static String getBaseUrl() => 'https://patidoapp.com/api/';
  static Map<String, String> headers = {};
  static UploadImageForUserCall uploadImageForUserCall =
      UploadImageForUserCall();
  static ReOrderFilesCall reOrderFilesCall = ReOrderFilesCall();
  static DeleteFileCall deleteFileCall = DeleteFileCall();

  static final interceptors = [
    LocalizationInterceptor(),
    AuthenticationInterceptor(),
    DateTimeInterceptor(),
  ];
}

class UploadImageForUserCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? image,
  }) async {
    final baseUrl = FilesGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Upload Image For User',
        apiUrl: '${baseUrl}user/upload-image',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'image': image,
        },

        bodyType: BodyType.MULTIPART,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      FilesGroup.interceptors,
    );
  }
}

class ReOrderFilesCall {
  Future<ApiCallResponse> call({
    dynamic filesJson,
  }) async {
    final baseUrl = FilesGroup.getBaseUrl();

    final files = _serializeJson(filesJson, true);
    final ffApiRequestBody = '''
{
  "files": ${files}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'ReOrder Files',
        apiUrl: '${baseUrl}reOrderFiles',
        callType: ApiCallType.PUT,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      FilesGroup.interceptors,
    );
  }
}

class DeleteFileCall {
  Future<ApiCallResponse> call({
    int? fileId,
  }) async {
    final baseUrl = FilesGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Delete File',
        apiUrl: '${baseUrl}deleteFile',
        callType: ApiCallType.DELETE,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'file_id': fileId,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      FilesGroup.interceptors,
    );
  }
}

/// End Files Group Code

/// Start Swipe Group Code

class SwipeGroup {
  static String getBaseUrl() => 'https://patidoapp.com/api/';
  static Map<String, String> headers = {};
  static GetSwipeListCall getSwipeListCall = GetSwipeListCall();
  static OnSwipeCall onSwipeCall = OnSwipeCall();

  static final interceptors = [
    LocalizationInterceptor(),
    AuthenticationInterceptor(),
    DateTimeInterceptor(),
  ];
}

class GetSwipeListCall {
  Future<ApiCallResponse> call({
    double? lat,
    double? lng,
  }) async {
    final baseUrl = SwipeGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Get Swipe List',
        apiUrl: '${baseUrl}swipe/list',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      SwipeGroup.interceptors,
    );
  }

  int? remainingswipe(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.remaining_swipe''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class OnSwipeCall {
  Future<ApiCallResponse> call({
    String? swipeType = '',
    int? swipedId,
  }) async {
    final baseUrl = SwipeGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "swipe_type": "${escapeStringForJson(swipeType)}",
  "swiped_id": ${swipedId}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'On Swipe',
        apiUrl: '${baseUrl}swipe',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      SwipeGroup.interceptors,
    );
  }

  int? remainingswipe(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.remaining_swipe''',
      ));
}

/// End Swipe Group Code

/// Start Notifications Group Code

class NotificationsGroup {
  static String getBaseUrl() => 'https://patidoapp.com/api/';
  static Map<String, String> headers = {};
  static NotificationsIndexCall notificationsIndexCall =
      NotificationsIndexCall();
  static CheckFriendRequestCall checkFriendRequestCall =
      CheckFriendRequestCall();
  static LikeCall likeCall = LikeCall();
  static GetCountCall getCountCall = GetCountCall();
  static ReadNotificationsCall readNotificationsCall = ReadNotificationsCall();

  static final interceptors = [
    AuthenticationInterceptor(),
    LocalizationInterceptor(),
    DateTimeInterceptor(),
  ];
}

class NotificationsIndexCall {
  Future<ApiCallResponse> call({
    int? page = 1,
  }) async {
    final baseUrl = NotificationsGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'NotificationsIndex',
        apiUrl: '${baseUrl}notifications',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'page': page,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      NotificationsGroup.interceptors,
    );
  }
}

class CheckFriendRequestCall {
  Future<ApiCallResponse> call({
    int? friendRequestId,
  }) async {
    final baseUrl = NotificationsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "friend_request_id": ${friendRequestId}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Check Friend Request',
        apiUrl: '${baseUrl}notification/check-friend-request',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      NotificationsGroup.interceptors,
    );
  }
}

class LikeCall {
  Future<ApiCallResponse> call({
    int? dogId,
  }) async {
    final baseUrl = NotificationsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "dog_id": ${dogId}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Like',
        apiUrl: '${baseUrl}notification/like',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      NotificationsGroup.interceptors,
    );
  }
}

class GetCountCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = NotificationsGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetCount',
        apiUrl: '${baseUrl}notification-unread-count',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      NotificationsGroup.interceptors,
    );
  }
}

class ReadNotificationsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = NotificationsGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'ReadNotifications',
        apiUrl: '${baseUrl}notifications-read',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      NotificationsGroup.interceptors,
    );
  }
}

/// End Notifications Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
