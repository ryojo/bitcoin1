class Post {
  int _userId = 0;
  int _id = 0;
  String _title;
  String _body;

  Post(this._userId, this._id, this._title, this._body);


 set userid(int userId){
    _userId =  userId;
  }

 int get userid{
   return _userId;
}
 set  id(int id){
   _id = id;
 }
 
 int get id{
   return _id;
   }

set title(String title){
  _title = title;
}   

String get title {
  return _title;
}

set body(String body){
  _body = body;
}

String get body {
  return _body;
}

}  




