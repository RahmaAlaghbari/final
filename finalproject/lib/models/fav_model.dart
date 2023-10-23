class FavModel {
  FavModel({
      this.userid, 
      this.hotelid, 
      this.id,});

  FavModel.fromJson(dynamic json) {
    userid = json['userid'];
    hotelid = json['hotelid'];
    id = json['id'];
  }
  String? userid;
  String? hotelid;
  String? id;
FavModel copyWith({  String? userid,
  String? hotelid,
  String? id,
}) => FavModel(  userid: userid ?? this.userid,
  hotelid: hotelid ?? this.hotelid,
  id: id ?? this.id,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userid'] = userid;
    map['hotelid'] = hotelid;
    map['id'] = id;
    return map;
  }

}