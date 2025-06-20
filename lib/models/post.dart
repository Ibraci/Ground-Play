class Post {
  final int? id;
  final String title;
  final String content;
  final DateTime createdAt;

  Post({
    this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  // Convert a Post into a Map. The keys must correspond to the names of the columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Create a Post from a Map (from the database)
  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as int?,
      title: map['title'] as String,
      content: map['content'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }
}
