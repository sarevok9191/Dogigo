// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FileTypeStruct extends FFFirebaseStruct {
  FileTypeStruct({
    int? id,
    int? fileSize,
    String? fileSizeFormatted,
    String? fileName,
    bool? isImage,
    int? width,
    int? height,
    int? sortOrder,
    String? url,
    DateTime? createdAt,
    String? thumbUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _fileSize = fileSize,
        _fileSizeFormatted = fileSizeFormatted,
        _fileName = fileName,
        _isImage = isImage,
        _width = width,
        _height = height,
        _sortOrder = sortOrder,
        _url = url,
        _createdAt = createdAt,
        _thumbUrl = thumbUrl,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "file_size" field.
  int? _fileSize;
  int get fileSize => _fileSize ?? 0;
  set fileSize(int? val) => _fileSize = val;

  void incrementFileSize(int amount) => fileSize = fileSize + amount;

  bool hasFileSize() => _fileSize != null;

  // "file_size_formatted" field.
  String? _fileSizeFormatted;
  String get fileSizeFormatted => _fileSizeFormatted ?? '';
  set fileSizeFormatted(String? val) => _fileSizeFormatted = val;

  bool hasFileSizeFormatted() => _fileSizeFormatted != null;

  // "file_name" field.
  String? _fileName;
  String get fileName => _fileName ?? '';
  set fileName(String? val) => _fileName = val;

  bool hasFileName() => _fileName != null;

  // "is_image" field.
  bool? _isImage;
  bool get isImage => _isImage ?? false;
  set isImage(bool? val) => _isImage = val;

  bool hasIsImage() => _isImage != null;

  // "width" field.
  int? _width;
  int get width => _width ?? 0;
  set width(int? val) => _width = val;

  void incrementWidth(int amount) => width = width + amount;

  bool hasWidth() => _width != null;

  // "height" field.
  int? _height;
  int get height => _height ?? 0;
  set height(int? val) => _height = val;

  void incrementHeight(int amount) => height = height + amount;

  bool hasHeight() => _height != null;

  // "sort_order" field.
  int? _sortOrder;
  int get sortOrder => _sortOrder ?? 0;
  set sortOrder(int? val) => _sortOrder = val;

  void incrementSortOrder(int amount) => sortOrder = sortOrder + amount;

  bool hasSortOrder() => _sortOrder != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "thumb_url" field.
  String? _thumbUrl;
  String get thumbUrl => _thumbUrl ?? '';
  set thumbUrl(String? val) => _thumbUrl = val;

  bool hasThumbUrl() => _thumbUrl != null;

  static FileTypeStruct fromMap(Map<String, dynamic> data) => FileTypeStruct(
        id: castToType<int>(data['id']),
        fileSize: castToType<int>(data['file_size']),
        fileSizeFormatted: data['file_size_formatted'] as String?,
        fileName: data['file_name'] as String?,
        isImage: data['is_image'] as bool?,
        width: castToType<int>(data['width']),
        height: castToType<int>(data['height']),
        sortOrder: castToType<int>(data['sort_order']),
        url: data['url'] as String?,
        createdAt: data['created_at'] as DateTime?,
        thumbUrl: data['thumb_url'] as String?,
      );

  static FileTypeStruct? maybeFromMap(dynamic data) =>
      data is Map ? FileTypeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'file_size': _fileSize,
        'file_size_formatted': _fileSizeFormatted,
        'file_name': _fileName,
        'is_image': _isImage,
        'width': _width,
        'height': _height,
        'sort_order': _sortOrder,
        'url': _url,
        'created_at': _createdAt,
        'thumb_url': _thumbUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'file_size': serializeParam(
          _fileSize,
          ParamType.int,
        ),
        'file_size_formatted': serializeParam(
          _fileSizeFormatted,
          ParamType.String,
        ),
        'file_name': serializeParam(
          _fileName,
          ParamType.String,
        ),
        'is_image': serializeParam(
          _isImage,
          ParamType.bool,
        ),
        'width': serializeParam(
          _width,
          ParamType.int,
        ),
        'height': serializeParam(
          _height,
          ParamType.int,
        ),
        'sort_order': serializeParam(
          _sortOrder,
          ParamType.int,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'thumb_url': serializeParam(
          _thumbUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static FileTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      FileTypeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        fileSize: deserializeParam(
          data['file_size'],
          ParamType.int,
          false,
        ),
        fileSizeFormatted: deserializeParam(
          data['file_size_formatted'],
          ParamType.String,
          false,
        ),
        fileName: deserializeParam(
          data['file_name'],
          ParamType.String,
          false,
        ),
        isImage: deserializeParam(
          data['is_image'],
          ParamType.bool,
          false,
        ),
        width: deserializeParam(
          data['width'],
          ParamType.int,
          false,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.int,
          false,
        ),
        sortOrder: deserializeParam(
          data['sort_order'],
          ParamType.int,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        thumbUrl: deserializeParam(
          data['thumb_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FileTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FileTypeStruct &&
        id == other.id &&
        fileSize == other.fileSize &&
        fileSizeFormatted == other.fileSizeFormatted &&
        fileName == other.fileName &&
        isImage == other.isImage &&
        width == other.width &&
        height == other.height &&
        sortOrder == other.sortOrder &&
        url == other.url &&
        createdAt == other.createdAt &&
        thumbUrl == other.thumbUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        fileSize,
        fileSizeFormatted,
        fileName,
        isImage,
        width,
        height,
        sortOrder,
        url,
        createdAt,
        thumbUrl
      ]);
}

FileTypeStruct createFileTypeStruct({
  int? id,
  int? fileSize,
  String? fileSizeFormatted,
  String? fileName,
  bool? isImage,
  int? width,
  int? height,
  int? sortOrder,
  String? url,
  DateTime? createdAt,
  String? thumbUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FileTypeStruct(
      id: id,
      fileSize: fileSize,
      fileSizeFormatted: fileSizeFormatted,
      fileName: fileName,
      isImage: isImage,
      width: width,
      height: height,
      sortOrder: sortOrder,
      url: url,
      createdAt: createdAt,
      thumbUrl: thumbUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FileTypeStruct? updateFileTypeStruct(
  FileTypeStruct? fileType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    fileType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFileTypeStructData(
  Map<String, dynamic> firestoreData,
  FileTypeStruct? fileType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (fileType == null) {
    return;
  }
  if (fileType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && fileType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fileTypeData = getFileTypeFirestoreData(fileType, forFieldValue);
  final nestedData = fileTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = fileType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFileTypeFirestoreData(
  FileTypeStruct? fileType, [
  bool forFieldValue = false,
]) {
  if (fileType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(fileType.toMap());

  // Add any Firestore field values
  fileType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFileTypeListFirestoreData(
  List<FileTypeStruct>? fileTypes,
) =>
    fileTypes?.map((e) => getFileTypeFirestoreData(e, true)).toList() ?? [];
