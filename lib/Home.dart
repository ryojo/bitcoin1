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
  
    Future<Map> Conecao() async{
       String url = "https://blockchain.info/ticker";
       http.Response response =  await http.get(url);
      return  json.decode(response.body);
      
     }

  @override
  Widget build(BuildContext context) {
  
    
  
    return  FutureBuilder<Map>(

      future: Conecao(),
      builder: (context, snapshot) {
        String _resultado;
        switch(snapshot.connectionState){

          case ConnectionState.none:
          _resultado = "R\$ 0 ";
          break;

          case ConnectionState.waiting:
          _resultado = "Carregando...";
          break;

          case ConnectionState.active:
          break;  

          case ConnectionState.done:
            if(snapshot.hasError){
              _resultado = "Erro no servidor";
            } else {
              String _valor = snapshot.data["BRL"]["buy"].toString();
               _resultado = "R\$ ${_valor}";
            }
            break;
            }     
     return Scaffold(
       
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(28),
          decoration: BoxDecoration(
            border:Border.all(width: 3,color:Colors.amber),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: _logo),
              Padding(padding: EdgeInsets.only(top:25,bottom: 15),
              child: Text(" ${_resultado}",
              style: TextStyle(
                fontSize:29,
                
              ),
              ),
              ),
            FlatButton(
              onPressed: Conecao,
              
             child: Text("Atualizar",
             style: TextStyle(
               color: Colors.white,
             ),
             ),
             color: Colors.orange,
             padding: EdgeInsets.fromLTRB(25, 13, 25, 13),
             ),
            ],
          ),
        ),
      
    
    );
      }
    );
    
    
    
    
    
    
    
    
    
    
    
    
  }
}