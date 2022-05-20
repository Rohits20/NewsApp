import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/article_model.dart';

class ApiService{
  final endPointUrl ="https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=4d79a5fddcb0428eaff922636f7a766d";

  // Change this api key(4d79a5fddcb0428eaff922636f7a766d) if not working by creating a new

Future<List<Article>> getArticle() async{
  Response res =await get(Uri.parse(endPointUrl));
  if(res.statusCode ==200){
    Map<String,dynamic> json = jsonDecode(res.body);

    List<dynamic> body =json['articles'];
    List<Article> articles = body.map((dynamic item)=> Article.fromJson(item)).toList();

    return articles;
  } else{
    throw("News not found");
  }
}
}