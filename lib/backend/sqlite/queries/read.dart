import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN REFRESH TOKEN
Future<List<RefreshTokenRow>> performRefreshToken(
  Database database,
) {
  final query = '''
SELECT refresh_token FROM refresh_tokens ORDER BY id DESC LIMIT 1;
''';
  return _readQuery(database, query, (d) => RefreshTokenRow(d));
}

class RefreshTokenRow extends SqliteRow {
  RefreshTokenRow(Map<String, dynamic> data) : super(data);

  String? get refreshToken => data['refresh_token'] as String?;
}

/// END REFRESH TOKEN
