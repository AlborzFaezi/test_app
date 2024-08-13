class Object{
  final String id;
  final String name;
  final dynamic data;


  Object({
    required this.id,
    required this.name,
    required this.data
  });

  factory Object.fromJson(Map<String,dynamic> json){
    return Object(
        id: json['id'],
        name: json['name'],
        data: json['data']
    );
  }
}