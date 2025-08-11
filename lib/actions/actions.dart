import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';

Future getCurrentUser(BuildContext context) async {
  ApiCallResponse? apiResult5wr;
  ApiCallResponse? apiResultljv;

  apiResult5wr = await ProfileGroup.getProfileInfosCall.call();

  if ((apiResult5wr.succeeded ?? true)) {
    FFAppState().CurrentUser = UserStruct.maybeFromMap(getJsonField(
      (apiResult5wr.jsonBody ?? ''),
      r'''$.user''',
    ))!;
  }
  apiResultljv = await MessagesGroup.allTokensCall.call();

  if ((apiResultljv.succeeded ?? true)) {
    await actions.writeLocalStorage(
      'all_chat_tokens',
      getJsonField(
        (apiResultljv.jsonBody ?? ''),
        r'''$.tokens''',
      ).toString().toString(),
    );
  }
}

Future getStaticValues(BuildContext context) async {
  ApiCallResponse? dogGenderResponse;
  ApiCallResponse? gendersResponse;
  ApiCallResponse? languagesResponse;
  ApiCallResponse? countryResponse;
  ApiCallResponse? packageDetailsResponse;
  ApiCallResponse? showAblesResponse;

  dogGenderResponse = await StaticValuesGroup.dogGendersCall.call();

  if ((dogGenderResponse.succeeded ?? true)) {
    FFAppState().DogGenders = (getJsonField(
      (dogGenderResponse.jsonBody ?? ''),
      r'''$.records''',
      true,
    )!
            .toList()
            .map<SelectableOptionTypeStruct?>(
                SelectableOptionTypeStruct.maybeFromMap)
            .toList() as Iterable<SelectableOptionTypeStruct?>)
        .withoutNulls
        .toList()
        .cast<SelectableOptionTypeStruct>();
  }
  gendersResponse = await StaticValuesGroup.getGendersCall.call();

  if ((gendersResponse.succeeded ?? true)) {
    FFAppState().Genders = (getJsonField(
      (gendersResponse.jsonBody ?? ''),
      r'''$.records''',
      true,
    )!
            .toList()
            .map<SelectableOptionTypeStruct?>(
                SelectableOptionTypeStruct.maybeFromMap)
            .toList() as Iterable<SelectableOptionTypeStruct?>)
        .withoutNulls
        .toList()
        .cast<SelectableOptionTypeStruct>();
  }
  languagesResponse = await StaticValuesGroup.getLanguagesCall.call();

  if ((languagesResponse.succeeded ?? true)) {
    FFAppState().Languages = (getJsonField(
      (languagesResponse.jsonBody ?? ''),
      r'''$.records''',
      true,
    )!
            .toList()
            .map<SelectableOptionTypeStruct?>(
                SelectableOptionTypeStruct.maybeFromMap)
            .toList() as Iterable<SelectableOptionTypeStruct?>)
        .withoutNulls
        .toList()
        .cast<SelectableOptionTypeStruct>();
  }
  countryResponse = await StaticValuesGroup.getCountriesCall.call();

  if ((countryResponse.succeeded ?? true)) {
    FFAppState().Countries = (getJsonField(
      (countryResponse.jsonBody ?? ''),
      r'''$.records''',
      true,
    )!
            .toList()
            .map<SelectableOptionTypeStruct?>(
                SelectableOptionTypeStruct.maybeFromMap)
            .toList() as Iterable<SelectableOptionTypeStruct?>)
        .withoutNulls
        .toList()
        .cast<SelectableOptionTypeStruct>();
  }
  packageDetailsResponse = await StaticValuesGroup.packageDetailsCall.call();

  if ((packageDetailsResponse.succeeded ?? true)) {
    FFAppState().PackageDetails =
        PackageDetailsStruct.maybeFromMap(getJsonField(
      (packageDetailsResponse.jsonBody ?? ''),
      r'''$.record''',
    ))!;
  }
  showAblesResponse = await LocationGroup.getShowAbleTypesCall.call();

  if ((showAblesResponse.succeeded ?? true)) {
    FFAppState().MapShowAbles = (getJsonField(
      (showAblesResponse.jsonBody ?? ''),
      r'''$.options''',
      true,
    )!
            .toList()
            .map<MapShowSelectionStruct?>(MapShowSelectionStruct.maybeFromMap)
            .toList() as Iterable<MapShowSelectionStruct?>)
        .withoutNulls
        .toList()
        .cast<MapShowSelectionStruct>();
  }
}

Future fetchUnReadMessagesBlock(BuildContext context) async {
  ApiCallResponse? apiResulteh5;

  apiResulteh5 = await MessagesGroup.allTokensCall.call();

  if ((apiResulteh5.succeeded ?? true)) {
    await actions.fetchUnreadMessages(
      getJsonField(
        (apiResulteh5.jsonBody ?? ''),
        r'''$.tokens''',
        true,
      )!,
    );
  }
}

Future getInAppPurchaseConfigurationBlock(BuildContext context) async {
  ApiCallResponse? apiResult3cj;

  apiResult3cj = await StaticValuesGroup.inAppPurchaseConfigurationCall.call();

  if ((apiResult3cj.succeeded ?? true)) {
    FFAppState().InAppPurchaseConfiguration =
        InAppPurchaseConfigurationStruct.maybeFromMap(
            (apiResult3cj.jsonBody ?? ''))!;
    await actions.initializeRevenuecat(
      FFAppState().InAppPurchaseConfiguration.iosPublicKey,
      FFAppState().InAppPurchaseConfiguration.androidPublicKey,
    );
  }
}
