class UserModel {
  UserModel({
      this.fName, 
      this.img, 
      this.uName, 
      this.password, 
      this.phone, 
      this.per, 
      this.gender, 
      this.email, 
      this.id,});

  UserModel.fromJson(dynamic json) {
    fName = json['fName'];
    img = json['img'];
    uName = json['uName'];
    password = json['password'];
    phone = json['phone'];
    per = json['per'];
    gender = json['gender'];
    email = json['email'];
    id = json['id'];
  }
  String? fName;
  String? img;
  String? uName;
  String? password;
  int? phone;
  String? per;
  String? gender;
  String? email;
  String? id;
UserModel copyWith({  String? fName,
  String? img,
  String? uName,
  String? password,
  int? phone,
  String? per,
  String? gender,
  String? email,
  String? id,
}) => UserModel(  fName: fName ?? this.fName,
  img: img ?? this.img,
  uName: uName ?? this.uName,
  password: password ?? this.password,
  phone: phone ?? this.phone,
  per: per ?? this.per,
  gender: gender ?? this.gender,
  email: email ?? this.email,
  id: id ?? this.id,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fName'] = fName;
    map['img'] = img;
    map['uName'] = uName;
    map['password'] = password;
    map['phone'] = phone;
    map['per'] = per;
    map['gender'] = gender;
    map['email'] = email;
    map['id'] = id;
    return map;
  }

}