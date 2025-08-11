import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _Genders = (await secureStorage.getStringList('ff_Genders'))
              ?.map((x) {
                try {
                  return SelectableOptionTypeStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Genders;
    });
    await _safeInitAsync(() async {
      _Countries = (await secureStorage.getStringList('ff_Countries'))
              ?.map((x) {
                try {
                  return SelectableOptionTypeStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Countries;
    });
    await _safeInitAsync(() async {
      _Cities = (await secureStorage.getStringList('ff_Cities'))
              ?.map((x) {
                try {
                  return SelectableOptionTypeStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Cities;
    });
    await _safeInitAsync(() async {
      _Languages = (await secureStorage.getStringList('ff_Languages'))
              ?.map((x) {
                try {
                  return SelectableOptionTypeStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Languages;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_CurrentUser') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_CurrentUser') ?? '{}';
          _CurrentUser =
              UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _LastLocation =
          latLngFromString(await secureStorage.getString('ff_LastLocation')) ??
              _LastLocation;
    });
    await _safeInitAsync(() async {
      _MapMarkers = (await secureStorage.getStringList('ff_MapMarkers'))
              ?.map((x) {
                try {
                  return MarkerStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _MapMarkers;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_PackageDetails') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_PackageDetails') ?? '{}';
          _PackageDetails = PackageDetailsStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _AllChatTokens = await secureStorage.getStringList('ff_AllChatTokens') ??
          _AllChatTokens;
    });
    await _safeInitAsync(() async {
      _UnreadedMessageCount =
          await secureStorage.getInt('ff_UnreadedMessageCount') ??
              _UnreadedMessageCount;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_InAppPurchaseConfiguration') !=
          null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_InAppPurchaseConfiguration') ??
                  '{}';
          _InAppPurchaseConfiguration =
              InAppPurchaseConfigurationStruct.fromSerializableMap(
                  jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _DogGenders = (await secureStorage.getStringList('ff_DogGenders'))
              ?.map((x) {
                try {
                  return SelectableOptionTypeStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _DogGenders;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<SelectableOptionTypeStruct> _Genders = [
    SelectableOptionTypeStruct.fromSerializableMap(
        jsonDecode('{\"id\":\"2\",\"title\":\"Female\"}')),
    SelectableOptionTypeStruct.fromSerializableMap(
        jsonDecode('{\"id\":\"1\",\"title\":\"Male\"}'))
  ];
  List<SelectableOptionTypeStruct> get Genders => _Genders;
  set Genders(List<SelectableOptionTypeStruct> value) {
    _Genders = value;
    secureStorage.setStringList(
        'ff_Genders', value.map((x) => x.serialize()).toList());
  }

  void deleteGenders() {
    secureStorage.delete(key: 'ff_Genders');
  }

  void addToGenders(SelectableOptionTypeStruct value) {
    Genders.add(value);
    secureStorage.setStringList(
        'ff_Genders', _Genders.map((x) => x.serialize()).toList());
  }

  void removeFromGenders(SelectableOptionTypeStruct value) {
    Genders.remove(value);
    secureStorage.setStringList(
        'ff_Genders', _Genders.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromGenders(int index) {
    Genders.removeAt(index);
    secureStorage.setStringList(
        'ff_Genders', _Genders.map((x) => x.serialize()).toList());
  }

  void updateGendersAtIndex(
    int index,
    SelectableOptionTypeStruct Function(SelectableOptionTypeStruct) updateFn,
  ) {
    Genders[index] = updateFn(_Genders[index]);
    secureStorage.setStringList(
        'ff_Genders', _Genders.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInGenders(int index, SelectableOptionTypeStruct value) {
    Genders.insert(index, value);
    secureStorage.setStringList(
        'ff_Genders', _Genders.map((x) => x.serialize()).toList());
  }

  List<SelectableOptionTypeStruct> _Countries = [
    SelectableOptionTypeStruct.fromSerializableMap(
        jsonDecode('{\"value\":\"0\",\"title\":\"Turkey\"}')),
    SelectableOptionTypeStruct.fromSerializableMap(
        jsonDecode('{\"value\":\"1\",\"title\":\"Germany\"}'))
  ];
  List<SelectableOptionTypeStruct> get Countries => _Countries;
  set Countries(List<SelectableOptionTypeStruct> value) {
    _Countries = value;
    secureStorage.setStringList(
        'ff_Countries', value.map((x) => x.serialize()).toList());
  }

  void deleteCountries() {
    secureStorage.delete(key: 'ff_Countries');
  }

  void addToCountries(SelectableOptionTypeStruct value) {
    Countries.add(value);
    secureStorage.setStringList(
        'ff_Countries', _Countries.map((x) => x.serialize()).toList());
  }

  void removeFromCountries(SelectableOptionTypeStruct value) {
    Countries.remove(value);
    secureStorage.setStringList(
        'ff_Countries', _Countries.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCountries(int index) {
    Countries.removeAt(index);
    secureStorage.setStringList(
        'ff_Countries', _Countries.map((x) => x.serialize()).toList());
  }

  void updateCountriesAtIndex(
    int index,
    SelectableOptionTypeStruct Function(SelectableOptionTypeStruct) updateFn,
  ) {
    Countries[index] = updateFn(_Countries[index]);
    secureStorage.setStringList(
        'ff_Countries', _Countries.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCountries(int index, SelectableOptionTypeStruct value) {
    Countries.insert(index, value);
    secureStorage.setStringList(
        'ff_Countries', _Countries.map((x) => x.serialize()).toList());
  }

  List<SelectableOptionTypeStruct> _Cities = [
    SelectableOptionTypeStruct.fromSerializableMap(
        jsonDecode('{\"value\":\"0\",\"title\":\"Trabzon\"}')),
    SelectableOptionTypeStruct.fromSerializableMap(
        jsonDecode('{\"value\":\"1\",\"title\":\"İstanbul\"}')),
    SelectableOptionTypeStruct.fromSerializableMap(
        jsonDecode('{\"value\":\"2\",\"title\":\"Samsun\"}')),
    SelectableOptionTypeStruct.fromSerializableMap(
        jsonDecode('{\"value\":\"3\",\"title\":\"Ankara\"}')),
    SelectableOptionTypeStruct.fromSerializableMap(
        jsonDecode('{\"value\":\"4\",\"title\":\"İzmir\"}')),
    SelectableOptionTypeStruct.fromSerializableMap(
        jsonDecode('{\"value\":\"5\",\"title\":\"Antalya\"}')),
    SelectableOptionTypeStruct.fromSerializableMap(
        jsonDecode('{\"value\":\"6\",\"title\":\"Bursa\"}')),
    SelectableOptionTypeStruct.fromSerializableMap(
        jsonDecode('{\"value\":\"7\",\"title\":\"Eskişehir\"}')),
    SelectableOptionTypeStruct.fromSerializableMap(
        jsonDecode('{\"value\":\"8\",\"title\":\"Rize\"}')),
    SelectableOptionTypeStruct.fromSerializableMap(
        jsonDecode('{\"value\":\"10\",\"title\":\"Artvin\"}')),
    SelectableOptionTypeStruct.fromSerializableMap(
        jsonDecode('{\"value\":\"10\",\"title\":\"Muğla\"}'))
  ];
  List<SelectableOptionTypeStruct> get Cities => _Cities;
  set Cities(List<SelectableOptionTypeStruct> value) {
    _Cities = value;
    secureStorage.setStringList(
        'ff_Cities', value.map((x) => x.serialize()).toList());
  }

  void deleteCities() {
    secureStorage.delete(key: 'ff_Cities');
  }

  void addToCities(SelectableOptionTypeStruct value) {
    Cities.add(value);
    secureStorage.setStringList(
        'ff_Cities', _Cities.map((x) => x.serialize()).toList());
  }

  void removeFromCities(SelectableOptionTypeStruct value) {
    Cities.remove(value);
    secureStorage.setStringList(
        'ff_Cities', _Cities.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCities(int index) {
    Cities.removeAt(index);
    secureStorage.setStringList(
        'ff_Cities', _Cities.map((x) => x.serialize()).toList());
  }

  void updateCitiesAtIndex(
    int index,
    SelectableOptionTypeStruct Function(SelectableOptionTypeStruct) updateFn,
  ) {
    Cities[index] = updateFn(_Cities[index]);
    secureStorage.setStringList(
        'ff_Cities', _Cities.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCities(int index, SelectableOptionTypeStruct value) {
    Cities.insert(index, value);
    secureStorage.setStringList(
        'ff_Cities', _Cities.map((x) => x.serialize()).toList());
  }

  List<SelectableOptionTypeStruct> _Languages = [
    SelectableOptionTypeStruct.fromSerializableMap(
        jsonDecode('{\"id\":\"1\",\"title\":\"Turkish\"}')),
    SelectableOptionTypeStruct.fromSerializableMap(
        jsonDecode('{\"id\":\"2\",\"title\":\"English\"}'))
  ];
  List<SelectableOptionTypeStruct> get Languages => _Languages;
  set Languages(List<SelectableOptionTypeStruct> value) {
    _Languages = value;
    secureStorage.setStringList(
        'ff_Languages', value.map((x) => x.serialize()).toList());
  }

  void deleteLanguages() {
    secureStorage.delete(key: 'ff_Languages');
  }

  void addToLanguages(SelectableOptionTypeStruct value) {
    Languages.add(value);
    secureStorage.setStringList(
        'ff_Languages', _Languages.map((x) => x.serialize()).toList());
  }

  void removeFromLanguages(SelectableOptionTypeStruct value) {
    Languages.remove(value);
    secureStorage.setStringList(
        'ff_Languages', _Languages.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromLanguages(int index) {
    Languages.removeAt(index);
    secureStorage.setStringList(
        'ff_Languages', _Languages.map((x) => x.serialize()).toList());
  }

  void updateLanguagesAtIndex(
    int index,
    SelectableOptionTypeStruct Function(SelectableOptionTypeStruct) updateFn,
  ) {
    Languages[index] = updateFn(_Languages[index]);
    secureStorage.setStringList(
        'ff_Languages', _Languages.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInLanguages(int index, SelectableOptionTypeStruct value) {
    Languages.insert(index, value);
    secureStorage.setStringList(
        'ff_Languages', _Languages.map((x) => x.serialize()).toList());
  }

  List<SwipeItemTypeStruct> _SwipeItems = [
    SwipeItemTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"0\",\"images\":\"[\\\"https://picsum.photos/seed/434/600\\\",\\\"https://picsum.photos/seed/45/600\\\",\\\"https://picsum.photos/seed/430/600\\\"]\",\"isOnline\":\"true\",\"name\":\"Scott\",\"age\":\"1\",\"kind\":\"Basenji\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"owner\":\"{\\\"id\\\":\\\"0\\\",\\\"image\\\":\\\"[\\\\\\\"https://picsum.photos/seed/130/600\\\\\\\",\\\\\\\"https://picsum.photos/seed/512/600\\\\\\\",\\\\\\\"https://picsum.photos/seed/803/600\\\\\\\"]\\\",\\\"name\\\":\\\"Andrew\\\",\\\"age\\\":\\\"36\\\",\\\"description\\\":\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\\\"}\",\"distance\":\"1.2\"}')),
    SwipeItemTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"1\",\"images\":\"[\\\"https://picsum.photos/seed/468/600\\\",\\\"https://picsum.photos/seed/814/600\\\",\\\"https://picsum.photos/seed/27/600\\\"]\",\"isOnline\":\"false\",\"name\":\"Cesur\",\"age\":\"2\",\"kind\":\"Doberman\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"owner\":\"{\\\"id\\\":\\\"1\\\",\\\"image\\\":\\\"[\\\\\\\"https://picsum.photos/seed/930/600\\\\\\\",\\\\\\\"https://picsum.photos/seed/723/600\\\\\\\",\\\\\\\"https://picsum.photos/seed/8/600\\\\\\\"]\\\",\\\"name\\\":\\\"Ömer\\\",\\\"age\\\":\\\"25\\\",\\\"description\\\":\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\\\"}\",\"distance\":\"2.3\"}'))
  ];
  List<SwipeItemTypeStruct> get SwipeItems => _SwipeItems;
  set SwipeItems(List<SwipeItemTypeStruct> value) {
    _SwipeItems = value;
  }

  void addToSwipeItems(SwipeItemTypeStruct value) {
    SwipeItems.add(value);
  }

  void removeFromSwipeItems(SwipeItemTypeStruct value) {
    SwipeItems.remove(value);
  }

  void removeAtIndexFromSwipeItems(int index) {
    SwipeItems.removeAt(index);
  }

  void updateSwipeItemsAtIndex(
    int index,
    SwipeItemTypeStruct Function(SwipeItemTypeStruct) updateFn,
  ) {
    SwipeItems[index] = updateFn(_SwipeItems[index]);
  }

  void insertAtIndexInSwipeItems(int index, SwipeItemTypeStruct value) {
    SwipeItems.insert(index, value);
  }

  List<SelectedDogStruct> _SelectableDogs = [
    SelectedDogStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"0\",\"name\":\"Benjamin\",\"image\":\"https://picsum.photos/200/300\"}')),
    SelectedDogStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"1\",\"name\":\"Scoot\",\"image\":\"https://picsum.photos/seed/757/600\"}')),
    SelectedDogStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"2\",\"name\":\"Lilith\",\"image\":\"https://picsum.photos/seed/114/600\"}')),
    SelectedDogStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"3\",\"name\":\"Benjamin 2\",\"image\":\"https://picsum.photos/seed/83/600\"}')),
    SelectedDogStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"4\",\"name\":\"Scott 2\",\"image\":\"https://picsum.photos/seed/569/600\"}')),
    SelectedDogStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"5\",\"name\":\"Lilith 2\",\"image\":\"https://picsum.photos/seed/954/600\"}'))
  ];
  List<SelectedDogStruct> get SelectableDogs => _SelectableDogs;
  set SelectableDogs(List<SelectedDogStruct> value) {
    _SelectableDogs = value;
  }

  void addToSelectableDogs(SelectedDogStruct value) {
    SelectableDogs.add(value);
  }

  void removeFromSelectableDogs(SelectedDogStruct value) {
    SelectableDogs.remove(value);
  }

  void removeAtIndexFromSelectableDogs(int index) {
    SelectableDogs.removeAt(index);
  }

  void updateSelectableDogsAtIndex(
    int index,
    SelectedDogStruct Function(SelectedDogStruct) updateFn,
  ) {
    SelectableDogs[index] = updateFn(_SelectableDogs[index]);
  }

  void insertAtIndexInSelectableDogs(int index, SelectedDogStruct value) {
    SelectableDogs.insert(index, value);
  }

  List<ProfilePhotoTypeStruct> _ProfilePhotos = [
    ProfilePhotoTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"1\",\"order\":\"2\",\"image\":\"https://picsum.photos/seed/914/600\"}')),
    ProfilePhotoTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"2\",\"order\":\"1\",\"image\":\"https://picsum.photos/seed/562/600\"}')),
    ProfilePhotoTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"3\",\"order\":\"3\",\"image\":\"https://picsum.photos/seed/914/600\"}')),
    ProfilePhotoTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"4\",\"order\":\"4\",\"image\":\"https://picsum.photos/seed/562/600\"}'))
  ];
  List<ProfilePhotoTypeStruct> get ProfilePhotos => _ProfilePhotos;
  set ProfilePhotos(List<ProfilePhotoTypeStruct> value) {
    _ProfilePhotos = value;
  }

  void addToProfilePhotos(ProfilePhotoTypeStruct value) {
    ProfilePhotos.add(value);
  }

  void removeFromProfilePhotos(ProfilePhotoTypeStruct value) {
    ProfilePhotos.remove(value);
  }

  void removeAtIndexFromProfilePhotos(int index) {
    ProfilePhotos.removeAt(index);
  }

  void updateProfilePhotosAtIndex(
    int index,
    ProfilePhotoTypeStruct Function(ProfilePhotoTypeStruct) updateFn,
  ) {
    ProfilePhotos[index] = updateFn(_ProfilePhotos[index]);
  }

  void insertAtIndexInProfilePhotos(int index, ProfilePhotoTypeStruct value) {
    ProfilePhotos.insert(index, value);
  }

  List<MarkerStruct> _markers = [
    MarkerStruct.fromSerializableMap(jsonDecode(
        '{\"position\":\"40.9072286,29.25241759999999\",\"color\":\"orange\",\"id\":\"1\",\"image\":\"{\\\"is_asset\\\":\\\"false\\\",\\\"size\\\":\\\"0\\\",\\\"image_path\\\":\\\"https://picsum.photos/seed/778/600\\\"}\"}')),
    MarkerStruct.fromSerializableMap(jsonDecode(
        '{\"position\":\"40.9177322,29.1599233\",\"color\":\"red\",\"id\":\"2\",\"image\":\"{\\\"is_asset\\\":\\\"false\\\",\\\"size\\\":\\\"0\\\",\\\"image_path\\\":\\\"https://picsum.photos/seed/189/600\\\"}\"}'))
  ];
  List<MarkerStruct> get markers => _markers;
  set markers(List<MarkerStruct> value) {
    _markers = value;
  }

  void addToMarkers(MarkerStruct value) {
    markers.add(value);
  }

  void removeFromMarkers(MarkerStruct value) {
    markers.remove(value);
  }

  void removeAtIndexFromMarkers(int index) {
    markers.removeAt(index);
  }

  void updateMarkersAtIndex(
    int index,
    MarkerStruct Function(MarkerStruct) updateFn,
  ) {
    markers[index] = updateFn(_markers[index]);
  }

  void insertAtIndexInMarkers(int index, MarkerStruct value) {
    markers.insert(index, value);
  }

  List<MapShowSelectionStruct> _MapShowAbles = [];
  List<MapShowSelectionStruct> get MapShowAbles => _MapShowAbles;
  set MapShowAbles(List<MapShowSelectionStruct> value) {
    _MapShowAbles = value;
  }

  void addToMapShowAbles(MapShowSelectionStruct value) {
    MapShowAbles.add(value);
  }

  void removeFromMapShowAbles(MapShowSelectionStruct value) {
    MapShowAbles.remove(value);
  }

  void removeAtIndexFromMapShowAbles(int index) {
    MapShowAbles.removeAt(index);
  }

  void updateMapShowAblesAtIndex(
    int index,
    MapShowSelectionStruct Function(MapShowSelectionStruct) updateFn,
  ) {
    MapShowAbles[index] = updateFn(_MapShowAbles[index]);
  }

  void insertAtIndexInMapShowAbles(int index, MapShowSelectionStruct value) {
    MapShowAbles.insert(index, value);
  }

  MapShowSelectionStruct _CurrentShowMap = MapShowSelectionStruct();
  MapShowSelectionStruct get CurrentShowMap => _CurrentShowMap;
  set CurrentShowMap(MapShowSelectionStruct value) {
    _CurrentShowMap = value;
  }

  void updateCurrentShowMapStruct(Function(MapShowSelectionStruct) updateFn) {
    updateFn(_CurrentShowMap);
  }

  UserStruct _CurrentUser = UserStruct();
  UserStruct get CurrentUser => _CurrentUser;
  set CurrentUser(UserStruct value) {
    _CurrentUser = value;
    secureStorage.setString('ff_CurrentUser', value.serialize());
  }

  void deleteCurrentUser() {
    secureStorage.delete(key: 'ff_CurrentUser');
  }

  void updateCurrentUserStruct(Function(UserStruct) updateFn) {
    updateFn(_CurrentUser);
    secureStorage.setString('ff_CurrentUser', _CurrentUser.serialize());
  }

  bool _LocationAvailable = false;
  bool get LocationAvailable => _LocationAvailable;
  set LocationAvailable(bool value) {
    _LocationAvailable = value;
  }

  DateTime? _LastUpdateLocation;
  DateTime? get LastUpdateLocation => _LastUpdateLocation;
  set LastUpdateLocation(DateTime? value) {
    _LastUpdateLocation = value;
  }

  LatLng? _LastLocation;
  LatLng? get LastLocation => _LastLocation;
  set LastLocation(LatLng? value) {
    _LastLocation = value;
    value != null
        ? secureStorage.setString('ff_LastLocation', value.serialize())
        : secureStorage.remove('ff_LastLocation');
  }

  void deleteLastLocation() {
    secureStorage.delete(key: 'ff_LastLocation');
  }

  List<MarkerStruct> _MapMarkers = [];
  List<MarkerStruct> get MapMarkers => _MapMarkers;
  set MapMarkers(List<MarkerStruct> value) {
    _MapMarkers = value;
    secureStorage.setStringList(
        'ff_MapMarkers', value.map((x) => x.serialize()).toList());
  }

  void deleteMapMarkers() {
    secureStorage.delete(key: 'ff_MapMarkers');
  }

  void addToMapMarkers(MarkerStruct value) {
    MapMarkers.add(value);
    secureStorage.setStringList(
        'ff_MapMarkers', _MapMarkers.map((x) => x.serialize()).toList());
  }

  void removeFromMapMarkers(MarkerStruct value) {
    MapMarkers.remove(value);
    secureStorage.setStringList(
        'ff_MapMarkers', _MapMarkers.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromMapMarkers(int index) {
    MapMarkers.removeAt(index);
    secureStorage.setStringList(
        'ff_MapMarkers', _MapMarkers.map((x) => x.serialize()).toList());
  }

  void updateMapMarkersAtIndex(
    int index,
    MarkerStruct Function(MarkerStruct) updateFn,
  ) {
    MapMarkers[index] = updateFn(_MapMarkers[index]);
    secureStorage.setStringList(
        'ff_MapMarkers', _MapMarkers.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInMapMarkers(int index, MarkerStruct value) {
    MapMarkers.insert(index, value);
    secureStorage.setStringList(
        'ff_MapMarkers', _MapMarkers.map((x) => x.serialize()).toList());
  }

  PackageDetailsStruct _PackageDetails = PackageDetailsStruct();
  PackageDetailsStruct get PackageDetails => _PackageDetails;
  set PackageDetails(PackageDetailsStruct value) {
    _PackageDetails = value;
    secureStorage.setString('ff_PackageDetails', value.serialize());
  }

  void deletePackageDetails() {
    secureStorage.delete(key: 'ff_PackageDetails');
  }

  void updatePackageDetailsStruct(Function(PackageDetailsStruct) updateFn) {
    updateFn(_PackageDetails);
    secureStorage.setString('ff_PackageDetails', _PackageDetails.serialize());
  }

  UserStruct _RegisteringUser = UserStruct();
  UserStruct get RegisteringUser => _RegisteringUser;
  set RegisteringUser(UserStruct value) {
    _RegisteringUser = value;
  }

  void updateRegisteringUserStruct(Function(UserStruct) updateFn) {
    updateFn(_RegisteringUser);
  }

  DogRelationTypeStruct _RegisteringUserPrimaryDog = DogRelationTypeStruct();
  DogRelationTypeStruct get RegisteringUserPrimaryDog =>
      _RegisteringUserPrimaryDog;
  set RegisteringUserPrimaryDog(DogRelationTypeStruct value) {
    _RegisteringUserPrimaryDog = value;
  }

  void updateRegisteringUserPrimaryDogStruct(
      Function(DogRelationTypeStruct) updateFn) {
    updateFn(_RegisteringUserPrimaryDog);
  }

  bool _AppMounted = false;
  bool get AppMounted => _AppMounted;
  set AppMounted(bool value) {
    _AppMounted = value;
  }

  List<String> _AllChatTokens = [];
  List<String> get AllChatTokens => _AllChatTokens;
  set AllChatTokens(List<String> value) {
    _AllChatTokens = value;
    secureStorage.setStringList('ff_AllChatTokens', value);
  }

  void deleteAllChatTokens() {
    secureStorage.delete(key: 'ff_AllChatTokens');
  }

  void addToAllChatTokens(String value) {
    AllChatTokens.add(value);
    secureStorage.setStringList('ff_AllChatTokens', _AllChatTokens);
  }

  void removeFromAllChatTokens(String value) {
    AllChatTokens.remove(value);
    secureStorage.setStringList('ff_AllChatTokens', _AllChatTokens);
  }

  void removeAtIndexFromAllChatTokens(int index) {
    AllChatTokens.removeAt(index);
    secureStorage.setStringList('ff_AllChatTokens', _AllChatTokens);
  }

  void updateAllChatTokensAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    AllChatTokens[index] = updateFn(_AllChatTokens[index]);
    secureStorage.setStringList('ff_AllChatTokens', _AllChatTokens);
  }

  void insertAtIndexInAllChatTokens(int index, String value) {
    AllChatTokens.insert(index, value);
    secureStorage.setStringList('ff_AllChatTokens', _AllChatTokens);
  }

  bool _HasMessage = false;
  bool get HasMessage => _HasMessage;
  set HasMessage(bool value) {
    _HasMessage = value;
  }

  int _UnreadedMessageCount = 0;
  int get UnreadedMessageCount => _UnreadedMessageCount;
  set UnreadedMessageCount(int value) {
    _UnreadedMessageCount = value;
    secureStorage.setInt('ff_UnreadedMessageCount', value);
  }

  void deleteUnreadedMessageCount() {
    secureStorage.delete(key: 'ff_UnreadedMessageCount');
  }

  double _SafeTopPadding = 0.0;
  double get SafeTopPadding => _SafeTopPadding;
  set SafeTopPadding(double value) {
    _SafeTopPadding = value;
  }

  List<SelectableOptionTypeStruct> _DogTypes = [];
  List<SelectableOptionTypeStruct> get DogTypes => _DogTypes;
  set DogTypes(List<SelectableOptionTypeStruct> value) {
    _DogTypes = value;
  }

  void addToDogTypes(SelectableOptionTypeStruct value) {
    DogTypes.add(value);
  }

  void removeFromDogTypes(SelectableOptionTypeStruct value) {
    DogTypes.remove(value);
  }

  void removeAtIndexFromDogTypes(int index) {
    DogTypes.removeAt(index);
  }

  void updateDogTypesAtIndex(
    int index,
    SelectableOptionTypeStruct Function(SelectableOptionTypeStruct) updateFn,
  ) {
    DogTypes[index] = updateFn(_DogTypes[index]);
  }

  void insertAtIndexInDogTypes(int index, SelectableOptionTypeStruct value) {
    DogTypes.insert(index, value);
  }

  InAppPurchaseConfigurationStruct _InAppPurchaseConfiguration =
      InAppPurchaseConfigurationStruct();
  InAppPurchaseConfigurationStruct get InAppPurchaseConfiguration =>
      _InAppPurchaseConfiguration;
  set InAppPurchaseConfiguration(InAppPurchaseConfigurationStruct value) {
    _InAppPurchaseConfiguration = value;
    secureStorage.setString('ff_InAppPurchaseConfiguration', value.serialize());
  }

  void deleteInAppPurchaseConfiguration() {
    secureStorage.delete(key: 'ff_InAppPurchaseConfiguration');
  }

  void updateInAppPurchaseConfigurationStruct(
      Function(InAppPurchaseConfigurationStruct) updateFn) {
    updateFn(_InAppPurchaseConfiguration);
    secureStorage.setString('ff_InAppPurchaseConfiguration',
        _InAppPurchaseConfiguration.serialize());
  }

  SiderBarStruct _SideBarData = SiderBarStruct();
  SiderBarStruct get SideBarData => _SideBarData;
  set SideBarData(SiderBarStruct value) {
    _SideBarData = value;
  }

  void updateSideBarDataStruct(Function(SiderBarStruct) updateFn) {
    updateFn(_SideBarData);
  }

  List<SelectableOptionTypeStruct> _DogGenders = [];
  List<SelectableOptionTypeStruct> get DogGenders => _DogGenders;
  set DogGenders(List<SelectableOptionTypeStruct> value) {
    _DogGenders = value;
    secureStorage.setStringList(
        'ff_DogGenders', value.map((x) => x.serialize()).toList());
  }

  void deleteDogGenders() {
    secureStorage.delete(key: 'ff_DogGenders');
  }

  void addToDogGenders(SelectableOptionTypeStruct value) {
    DogGenders.add(value);
    secureStorage.setStringList(
        'ff_DogGenders', _DogGenders.map((x) => x.serialize()).toList());
  }

  void removeFromDogGenders(SelectableOptionTypeStruct value) {
    DogGenders.remove(value);
    secureStorage.setStringList(
        'ff_DogGenders', _DogGenders.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDogGenders(int index) {
    DogGenders.removeAt(index);
    secureStorage.setStringList(
        'ff_DogGenders', _DogGenders.map((x) => x.serialize()).toList());
  }

  void updateDogGendersAtIndex(
    int index,
    SelectableOptionTypeStruct Function(SelectableOptionTypeStruct) updateFn,
  ) {
    DogGenders[index] = updateFn(_DogGenders[index]);
    secureStorage.setStringList(
        'ff_DogGenders', _DogGenders.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDogGenders(int index, SelectableOptionTypeStruct value) {
    DogGenders.insert(index, value);
    secureStorage.setStringList(
        'ff_DogGenders', _DogGenders.map((x) => x.serialize()).toList());
  }

  int _UnReadNotificationCount = 0;
  int get UnReadNotificationCount => _UnReadNotificationCount;
  set UnReadNotificationCount(int value) {
    _UnReadNotificationCount = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
