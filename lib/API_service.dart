import 'dart:convert';
import 'dart:math';

import 'package:apiaula/post.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseURL = 'https://jsonplaceholder.typicode.com/posts';

//GET
  Future<List<Post>> getPosts() async{
    final response = await http.get(Uri.parse(baseURL));
    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item){
        return Post.fromMap(item);
      }).toList();
    }
    return[];
  }
  
}