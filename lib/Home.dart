import 'package:bitcoin1/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ; 
import 'dart:convert';
import 'dart:async';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
    static var _logo = AssetImage("imagens/bitcoin.png");
  
  String _urlBase = "https://jsonplaceholder.typicode.com"; 

       
      
    Future<List<Post>> Recuperar_postagens() async{
      
     http.Response response = await http.get(_urlBase + "/posts");
    var dadosJson = json.decode(response.body);
      List<Post> postagens = List();
      for (var post in dadosJson){
        Post p = new Post(post["userId"],post["id"], post["title"], post["body"]);
      
        postagens.add(p);
      }
 return postagens;
     }

  @override
  Widget build(BuildContext context) {
  
    
  
    return  Scaffold(
     appBar: AppBar(
       title: Text("Consumo de serviço avançado"),

     ),
     body: FutureBuilder<List<Post>>(

      future: Recuperar_postagens(),
      builder: (context, snapshot) {
      
        switch(snapshot.connectionState){

          case ConnectionState.none:
     
          break;

          case ConnectionState.waiting:
       return Center(
          child: CircularProgressIndicator(),
       );
          break;

          case ConnectionState.active:
          break;  

          case ConnectionState.done:
            if(snapshot.hasError){
          print("deu ruim");
            } else {
             
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder:(context,index){

                    List<Post> lista = snapshot.data;
                    Post post = lista[index];
                    


                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.id.toString()), 
                  );
              },
            );
            }     
        break;
      }
      }
    ),
      
    );
      
    
    
    
    
    
    
    
    
    
    
    
  }
}