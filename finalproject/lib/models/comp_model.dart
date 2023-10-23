class CompModel {
  CompModel({
      this.email, 
      this.description, 
      this.id,});

  CompModel.fromJson(dynamic json) {
    email = json['email'];
    description = json['description'];
    id = json['id'];
  }
  String? email;
  String? description;
  String? id;
CompModel copyWith({  String? email,
  String? description,
  String? id,
}) => CompModel(  email: email ?? this.email,
  description: description ?? this.description,
  id: id ?? this.id,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['description'] = description;
    map['id'] = id;
    return map;
  }

}