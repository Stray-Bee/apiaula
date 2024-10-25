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

  void _createPost() async{
    Post novoPost = Post(
        userId: 200,
        id: 200,
        title: 'Novo título',
        body: "informações sobre o novo sistema de posts"
    );
    Post? aux = await apiService.createPost(novoPost);
    if(aux!=null){
        print('${aux.userId} - ${aux.id} - ${aux.title} - ${aux.body}');
    }
    _loadPosts();
  }

  void _updatePost() async{
    Post updatePost = Post(
        userId: 200,
        id: 200,
        title: 'Atualizações',
        body: "Atualizações sobre as informações do novo sistema de posts"
    );
    Post? aux = await apiService.updatePost(updatePost, 1);
    if(aux!=null){
        print('${aux.userId} - ${aux.id} - ${aux.title} - ${aux.body}');
    }
    _loadPosts();
  }

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
          return Card(
            elevation: 10,
            child: ListTile(
              title: Text('${posts[index].userId} - ${posts[index].id}'),
              subtitle: Text ('${posts[index].title} - ${posts[index].body}')
            ),
          );  
        },
      ),
    );
  }
}