import 'dart:convert';

///Use this https://app.quicktype.io/ converter tool to create your data class
///according to the JSON response
///API used here is - https://jsonplaceholder.typicode.com/posts/1

///Used to map JSON data fetched from the server
Demo responseFromJson(String jsonString) {
  final jsonData = json.decode(jsonString);
  return Demo.fromJson(jsonData);
}

///Used to map string data to JSON to post to the server
//String responseToJson(Demo data) {
//  final stringData = data.toJson();
//  return json.encode(stringData);
//}

///Model Class
///Make sure the keys here are same as that in
///the response
class Demo {
  int userId;
  int id;
  String title;
  String body;

  Demo({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  ///This method is to deserialize your JSON
  ///Basically converting a string response to an object model
  ///Here key is always a String type and value can be of any type
  ///so we create a map of String and dynamic.
  factory Demo.fromJson(Map<String, dynamic> json) => new Demo(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );


  ///Converting String to JSON
//  Map<String, dynamic> toJson() => {
//    "userId": userId,
//    "id": id,
//    "title": title,
//    "body": body,
//  };
}