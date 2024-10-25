import 'package:apiaula/API_service.dart';
import 'package:apiaula/post.dart';
import 'package:flutter/material.dart';

class Pagina extends StatefulWidget {
  const Pagina({super.key});

  @override
  State<Pagina> createState() => _PaginaState();
}

class _PaginaState extends State<Pagina> {
    final ApiService apiService = ApiService();

  List<Post> posts = [];

  @override
  void initState() {
    _loadPosts();
    super.initState();

  }

  void _loadPosts() async{
    var aux = await apiService.getPosts();
    setState(() {
      posts = aux;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('API Exemplo'),
            backgroundColor: Colors.deepPurple.shade100,
        ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text('${posts[index].userId} - ${posts[index].id}'),
            subtitle: Text ('${posts[index].title} - ${posts[index].body}')
          );  
        },
      ),
    );
  }
}