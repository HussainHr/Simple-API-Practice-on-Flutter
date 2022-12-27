class MyClass {
  MyClass({
      required this.postId,
      required this.id,
      required this.name,
      required this.email,
      required this.body,});

  MyClass.fromJson(dynamic json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['postId'] = postId;
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['body'] = body;
    return map;
  }

}