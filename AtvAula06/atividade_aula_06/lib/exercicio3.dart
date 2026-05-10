import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Exercicio3 extends StatelessWidget {
  const Exercicio3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'JSONPlaceholder CRUD',

      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),

      home: const JsonPlaceholderPage(),
    );
  }
}

class Post {
  final int userId;

  final int? id;

  final String title;

  final String body;

  const Post({
    required this.userId,

    this.id,

    required this.title,

    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: (json['userId'] as num).toInt(),

      id: json['id'] == null ? null : (json['id'] as num).toInt(),

      title: json['title']?.toString() ?? '',

      body: json['body']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'userId': userId,

      'title': title,

      'body': body,
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }
}

class JsonPlaceholderPage extends StatefulWidget {
  const JsonPlaceholderPage({super.key});

  @override
  State<JsonPlaceholderPage> createState() => _JsonPlaceholderPageState();
}

class _JsonPlaceholderPageState extends State<JsonPlaceholderPage> {
  final _userIdController = TextEditingController(text: '1');

  final _idController = TextEditingController(text: '1');

  final _titleController = TextEditingController(text: 'Meu título');

  final _bodyController = TextEditingController(text: 'Meu conteúdo');

  bool _loading = false;

  String _status = 'Pronto.';

  Post? _singlePost;

  List<Post> _posts = [];

  final List<Post> _localPosts = [];

  Uri get _postsUri => Uri.https('jsonplaceholder.typicode.com', 'posts');

  Uri _postUri(int id) =>
      Uri.https('jsonplaceholder.typicode.com', 'posts/$id');

  int _readInt(TextEditingController controller, {required int fallback}) {
    return int.tryParse(controller.text.trim()) ?? fallback;
  }

  Future<void> _run(Future<void> Function() action) async {
    if (mounted) {
      setState(() => _loading = true);
    }

    try {
      await action();
    } catch (e) {
      if (mounted) {
        setState(() {
          _status = 'Erro: $e';
        });
      }
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  Future<void> _getSinglePost() async {
    await _run(() async {
      final id = _readInt(_idController, fallback: 1);
      Post? localPost;
      for (final post in _localPosts) {
        if (post.id == id) {
          localPost = post;
          break;
        }
      }

      if (localPost != null) {
        setState(() {
          _singlePost = localPost;
          _status = 'GET local /posts/$id concluído com sucesso.';
        });
        return;
      }

      final response = await http.get(
        _postUri(id),

        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;

        setState(() {
          _singlePost = Post.fromJson(data);

          _status = 'GET /posts/$id concluído com sucesso.';
        });
      } else {
        setState(() {
          _status = 'Falha no GET /posts/$id: ${response.statusCode}';
        });
      }
    });
  }

  Future<void> _getPosts() async {
    await _run(() async {
      setState(() {
        _posts = List<Post>.from(_localPosts);
        _singlePost = null;
        _status = 'Mostrando apenas posts criados localmente.';
      });
    });
  }

  Future<void> _createPost() async {
    await _run(() async {
      final post = Post(
        userId: _readInt(_userIdController, fallback: 1),
        title: _titleController.text.trim(),
        body: _bodyController.text.trim(),
      );

      final response = await http.post(
        _postsUri,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(post.toJson()),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final createdPost = Post.fromJson(data);
        final id = _readInt(_idController, fallback: createdPost.id ?? 101);
        final newPost = Post(
          userId: createdPost.userId,
          id: id,
          title: createdPost.title,
          body: createdPost.body,
        );

        setState(() {
          _singlePost = newPost;
          _localPosts.insert(0, newPost);
          _posts.removeWhere((post) => post.id == newPost.id);
          _posts.insert(0, newPost);
          _status = 'POST /posts concluído com sucesso.';
        });
      } else {
        setState(() {
          _status = 'Falha no POST /posts: ${response.statusCode}';
        });
      }
    });
  }

  Future<void> _updatePost() async {
    await _run(() async {
      final id = _readInt(_idController, fallback: 1);

      final post = Post(
        userId: _readInt(_userIdController, fallback: 1),

        id: id,

        title: _titleController.text.trim(),

        body: _bodyController.text.trim(),
      );

      final response = await http.put(
        _postUri(id),

        headers: {'Content-Type': 'application/json; charset=UTF-8'},

        body: jsonEncode(post.toJson()),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final updatedPost = Post.fromJson(data);

        setState(() {
          _singlePost = updatedPost;

          if (updatedPost.id != null) {
            final index = _localPosts.indexWhere((post) => post.id == updatedPost.id);
            if (index >= 0) {
              _localPosts[index] = updatedPost;
            } else {
              _localPosts.insert(0, updatedPost);
            }
            _posts.removeWhere((post) => post.id == updatedPost.id);
            _posts.insert(0, updatedPost);
          }

          _status = 'PUT /posts/$id concluído com sucesso.';
        });
      } else {
        setState(() {
          _status = 'Falha no PUT /posts/$id: ${response.statusCode}';
        });
      }
    });
  }

  Future<void> _deletePost() async {
    await _run(() async {
      final id = _readInt(_idController, fallback: 1);

      final response = await http.delete(
        _postUri(id),

        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        setState(() {
          _singlePost = null;
          _localPosts.removeWhere((post) => post.id == id);
          _posts.removeWhere((post) => post.id == id);

          _status = 'DELETE /posts/$id concluído com sucesso.';
        });
      } else {
        setState(() {
          _status = 'Falha no DELETE /posts/$id: ${response.statusCode}';
        });
      }
    });
  }

  @override
  void dispose() {
    _userIdController.dispose();

    _idController.dispose();

    _titleController.dispose();

    _bodyController.dispose();

    super.dispose();
  }

  Widget _buildField({
    required TextEditingController controller,

    required String label,

    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,

      keyboardType: keyboardType,

      decoration: InputDecoration(
        labelText: label,

        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildActionButton(
    String label,

    IconData icon,

    VoidCallback onPressed,
  ) {
    return ElevatedButton.icon(
      onPressed: _loading ? null : onPressed,

      icon: Icon(icon),

      label: Text(label),
    );
  }

  Widget _buildSinglePostCard(Post post) {
    return Card(
      child: ListTile(
        title: Text('ID ${post.id ?? '-'} • ${post.title}'),

        subtitle: Text('userId: ${post.userId}\n\n${post.body}'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSONPlaceholder CRUD')),

      body: SafeArea(
        child: Column(
          children: [
            if (_loading) const LinearProgressIndicator(),

            Expanded(
              flex: 2,
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    const Text(
                      'Campos',

                      style: TextStyle(
                        fontSize: 18,

                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    _buildField(
                      controller: _userIdController,

                      label: 'userId',

                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 12),

                    _buildField(
                      controller: _idController,

                      label: 'id',

                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 12),

                    _buildField(controller: _titleController, label: 'title'),

                    const SizedBox(height: 12),

                    _buildField(
                      controller: _bodyController,

                      label: 'body',

                      keyboardType: TextInputType.multiline,
                    ),

                    const SizedBox(height: 16),

                    Wrap(
                      spacing: 8,

                      runSpacing: 8,

                      children: [
                        _buildActionButton(
                          'GET',

                          Icons.download,

                          _getSinglePost,
                        ),

                        _buildActionButton('GET lista', Icons.list, _getPosts),

                        _buildActionButton(
                          'POST',

                          Icons.add_circle_outline,

                          _createPost,
                        ),

                        _buildActionButton('PUT', Icons.edit, _updatePost),

                        _buildActionButton(
                          'DELETE',

                          Icons.delete_outline,

                          _deletePost,
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Text(
                      _status,

                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),

                    const SizedBox(height: 16),

                    if (_singlePost != null) ...[
                      const Text(
                        'Último recurso retornado',

                        style: TextStyle(
                          fontSize: 18,

                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      _buildSinglePostCard(_singlePost!),
                    ],
                  ],
                ),
              ),
            ),

            const Divider(height: 1),

            Expanded(
              flex: 1,
              child: _posts.isEmpty
                  ? const Center(
                      child: Text(
                        'Clique em "GET lista" para carregar os posts.',
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(12),

                      itemCount: _posts.length,

                      itemBuilder: (context, index) {
                        final post = _posts[index];

                        return Card(
                          child: ListTile(
                            title: Text('ID ${post.id ?? '-'} • ${post.title}'),

                            subtitle: Text(post.body),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
