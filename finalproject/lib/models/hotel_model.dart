class HotelModel {
  HotelModel({
    this.name,
    this.avatar,
    this.descnmae,
    this.description,
    this.price,
    this.location,
    this.id,});

  HotelModel.fromJson(dynamic json) {
    name = json['name'];
    avatar = json['avatar'];
    descnmae = json['descnmae'];
    description = json['description'];
    price = json['price'];
    location = json['location'];
    id = json['id'];
  }
  String? name;
  String? avatar;
  String? descnmae;
  String? description;
  String? price;
  String? location;
  String? id;
  HotelModel copyWith({  String? name,
    String? avatar,
    String? descnmae,
    String? description,
    String? price,
    String? location,
    String? id,
  }) => HotelModel(  name: name ?? this.name,
    avatar: avatar ?? this.avatar,
    descnmae: descnmae ?? this.descnmae,
    description: description ?? this.description,
    price: price ?? this.price,
    location: location ?? this.location,
    id: id ?? this.id,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['avatar'] = avatar;
    map['descnmae'] = descnmae;
    map['description'] = description;
    map['price'] = price;
    map['location'] = location;
    map['id'] = id;
    return map;
  }

}