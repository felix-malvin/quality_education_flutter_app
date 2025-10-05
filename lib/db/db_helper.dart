import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE profile(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            username TEXT,
            phone TEXT,
            email TEXT,
            gender TEXT,
            birthDate TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE courses(
            id TEXT PRIMARY KEY,
            image TEXT,
            name TEXT,
            category TEXT,
            categoryBaseColor TEXT,
            duration TEXT,
            tutor TEXT,
            price REAL,
            level TEXT,
            rating REAL,
            totalRatings INTEGER,
            language TEXT,
            totalStudents TEXT,
            isCertificate INTEGER,
            description TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE badges(
            id TEXT PRIMARY KEY,
            courseId TEXT,
            badgeName TEXT,
            badgeColor TEXT,
            FOREIGN KEY(courseId) REFERENCES courses(id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE lesson_sections(
            id TEXT PRIMARY KEY,
            courseId TEXT,
            sectionTitle TEXT,
            duration TEXT,
            lessons TEXT,
            FOREIGN KEY(courseId) REFERENCES courses(id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
           CREATE TABLE enrolled_courses(
            id TEXT PRIMARY KEY,
            courseId TEXT,
            enrolledAt TEXT,
            paymentMethod TEXT,
            progress TEXT,
            FOREIGN KEY(courseId) REFERENCES courses(id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE subjects(
            id TEXT PRIMARY KEY,
            title TEXT,
            image TEXT,
            imagePrimary TEXT,
            baseColor INTEGER,
            quarterColor INTEGER,
            quiz TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE news(
            id TEXT PRIMARY KEY,
            title TEXT,
            image TEXT,
            author TEXT,
            time TEXT,
            category TEXT,
            tag TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE quiz(
            id TEXT PRIMARY KEY,
            question TEXT,
            options TEXT,
            answer TEXT
          )
        ''');

        await db.insert('profile', {
          'name': 'Gojo Satoru',
          'username': 'satorugojo',
          'phone': '081234567890',
          'email': 'satoru_gojo@gmail.com',
          'gender': 'Male',
          'birthDate': '2000-01-01',
        });
      },
    );
  }

  // Simpan/update profile
  Future<void> saveProfile(Map<String, dynamic> data) async {
    final database = await db;
    final existing = await database.query('profile', limit: 1);
    if (existing.isEmpty) {
      await database.insert('profile', data);
    } else {
      await database.update(
        'profile',
        data,
        where: 'id = ?',
        whereArgs: [existing.first['id']],
      );
    }
  }

  // Ambil profile
  Future<Map<String, dynamic>?> getProfile() async {
    final database = await db;
    final result = await database.query('profile', limit: 1);
    if (result.isNotEmpty) return result.first;
    return null;
  }

  Future<List<Map<String, dynamic>>> readAll(String table) async {
    final database = await db;
    return await database.query(table);
  }
}
