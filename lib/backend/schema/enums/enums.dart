import 'package:collection/collection.dart';

enum MapStyle {
  standart,
  retro,
  silver,
  dark,
  night,
  aubergine,
}

enum MarkerColor {
  red,
  orange,
  yellow,
  green,
  cyan,
  azure,
  blue,
  violet,
  magenta,
  rose,
}

enum NotificationTypes {
  like,
  touch,
  friend,
}

enum MessageTypes {
  text,
  image,
  touch,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (MapStyle):
      return MapStyle.values.deserialize(value) as T?;
    case (MarkerColor):
      return MarkerColor.values.deserialize(value) as T?;
    case (NotificationTypes):
      return NotificationTypes.values.deserialize(value) as T?;
    case (MessageTypes):
      return MessageTypes.values.deserialize(value) as T?;
    default:
      return null;
  }
}
