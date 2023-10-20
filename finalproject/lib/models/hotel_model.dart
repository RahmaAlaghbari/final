class HotelModel {
  HotelModel({
    this.name,
    this.avatar,
    this.descnmae,
    this.description,
    this.price,
    this.location,
    this.rooms,
    this.id,});

  HotelModel.fromJson(dynamic json) {
    name = json['name'];
    avatar = json['avatar'];
    descnmae = json['descnmae'];
    description = json['description'];
    price = json['price'];
    location = json['location'];
    rooms = json['rooms'];
    id = json['id'];
  }
  String? name;
  String? avatar;
  String? descnmae;
  String? description;
  String? price;
  String? location;
  int? rooms;
  String? id;
  HotelModel copyWith({  String? name,
    String? avatar,
    String? descnmae,
    String? description,
    String? price,
    String? location,
    int? rooms,
    String? id,
  }) => HotelModel(  name: name ?? this.name,
    avatar: avatar ?? this.avatar,
    descnmae: descnmae ?? this.descnmae,
    description: description ?? this.description,
    price: price ?? this.price,
    location: location ?? this.location,
    rooms: rooms ?? this.rooms,
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
    map['rooms'] = rooms;
    map['id'] = id;
    return map;
  }

}