import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:ground_play/models/post.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('mydb.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
            CREATE TABLE posts (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT NOT NULL,
              content TEXT NOT NULL,
              createdAt TEXT NOT NULL
            )
        ''');
  }

  // Create a new post
  Future<int> insertPost(Map<String, dynamic> post) async {
    final db = await instance.database;
    return await db.insert('posts', post);
  }

  // Read all posts
  Future<List<Map<String, dynamic>>> getPosts() async {
    final db = await instance.database;
    return await db.query('posts', orderBy: 'createdAt DESC');
  }

  // Read a single post by id
  Future<Map<String, dynamic>?> getPost(int id) async {
    final db = await instance.database;
    final result = await db.query('posts', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  // Update a post
  Future<int> updatePost(int id, Map<String, dynamic> post) async {
    final db = await instance.database;
    return await db.update('posts', post, where: 'id = ?', whereArgs: [id]);
  }

  // Delete a post
  Future<int> deletePost(int id) async {
    final db = await instance.database;
    return await db.delete('posts', where: 'id = ?', whereArgs: [id]);
  }

  final List<Post> seedPosts = [
    Post(
      title: 'First Blog Post',
      content: 'This is the content of my very first blog post.',
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
    Post(
      title: 'Another Interesting Article',
      content: 'Here\'s some more great content for your reading pleasure.',
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Post(
      title: 'Travel Adventures',
      content: 'Sharing my latest travel experiences and tips.',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  // Use a batch for efficiency when inserting multiple items
  Future<void> insertSeedPosts(Database db) async {
    final Batch batch = db.batch();
    for (var post in seedPosts) {
      batch.insert(
        'posts',
        post.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit();
    print('Database created and seed data inserted!');
  }

  Future<void> close() async {
    final db = await database;
    db.close();
  }
}
