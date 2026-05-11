class Usermodel {
  String id;

  String name;

  String email;

  int createdAt;

  Usermodel({
    required this.createdAt,
    required this.email,
    required this.name,
    this.id = '',
  });

  Usermodel.fromJson(Map<String,dynamic>json):this(
    id:json['id']??"",
    name:json['name']??"",
    email:json['email']??"",
    createdAt:json['createdAt']??0,
  );
  Map<String, dynamic>toJson(){
    return {
      'id': id,'name' : name,
      'email' : email,'createdAt' : createdAt,
    };
  }
}
