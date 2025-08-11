import 'package:sqflite/sqflite.dart';

/// BEGIN ADD REFRESH TOKEN
Future performAddRefreshToken(
  Database database, {
  String? token,
}) {
  final query = '''
INSERT INTO  refresh_tokens (refresh_token) VALUES ('${token}');
''';
  return database.rawQuery(query);
}

/// END ADD REFRESH TOKEN

/// BEGIN CLEAR REFRESH TOKENS
Future performClearRefreshTokens(
  Database database,
) {
  final query = '''
DELETE FROM refresh_tokens WHERE id > 0;
''';
  return database.rawQuery(query);
}

/// END CLEAR REFRESH TOKENS
