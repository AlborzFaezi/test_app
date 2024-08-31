class CatModel {
  String? id;
  String? mimetype;
  int? size;
  List<String>? tags;

  CatModel({
    this.id,
    this.mimetype,
    this.size,
    this.tags,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) => CatModel(
    id: json['_id'] as String?,
    mimetype: json['mimetype'] as String?,
    size: json['size'] as int?,
    tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'mimetype': mimetype,
    'size': size,
    'tags': tags,
  };
}
