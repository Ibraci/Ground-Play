import 'package:flutter/material.dart';
import 'package:ground_play/models/post.dart';
import 'package:ground_play/database_helper.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<Post> _posts = [];
  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    final postsData = await DatabaseHelper.instance.getPosts();
    setState(() {
      _posts = postsData.map<Post>((map) => Post.fromMap(map)).toList();
    });
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        final post = _posts[index];
        return ListTile(
          title: Text(post.title),
          subtitle: RichText(
            text: TextSpan(
              text: post.content,
              style: DefaultTextStyle.of(context).style,
            ),
          ),
        );
      },
    );
  }
}

// class PostsPage extends StatefulWidget {
//   const PostsPage({super.key});

//   @override
//   State<PostsPage> createState() => _PostsPageState();
// }

// class _PostsPageState extends State<PostsPage> {
//   List<Post> _posts = [];
//   @override
//   void initState() {
//     super.initState();
//     _loadPosts();
//   }

//   Future<void> _loadPosts() async {
//     final postsData = await DatabaseHelper.instance.getPosts();
//     setState(() {
//       _posts = postsData.map<Post>((map) => Post.fromMap(map)).toList();
//     });
//   }

//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: _posts.length,
//       itemBuilder: (context, index) {
//         final post = _posts[index];
//         return ListTile(
//           title: Text(post.title),
//           subtitle: RichText(
//             text: TextSpan(
//               text: post.content,
//               style: DefaultTextStyle.of(context).style,
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     DatabaseHelper.instance.close();
//     super.dispose();
//   }
// }
