class ReservationModel {
  ReservationModel({
      this.fromdate, 
      this.todate, 

      this.userid, 
      this.hotelid, 
      this.numguests, 
      this.id,});

  ReservationModel.fromJson(dynamic json) {
    fromdate = json['fromdate'];
    todate = json['todate'];

    userid = json['userid'];
    hotelid = json['hotelid'];
    numguests = json['numguests'];
    id = json['id'];
  }
  String? fromdate;
  String? todate;

  String? userid;
  String? hotelid;
  int? numguests;
  String? id;
ReservationModel copyWith({  String? fromdate,
  String? todate,

  String? userid,
  String? hotelid,
  int? numguests,
  String? id,
}) => ReservationModel(  fromdate: fromdate ?? this.fromdate,
  todate: todate ?? this.todate,

  userid: userid ?? this.userid,
  hotelid: hotelid ?? this.hotelid,
  numguests: numguests ?? this.numguests,
  id: id ?? this.id,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fromdate'] = fromdate;
    map['todate'] = todate;

    map['userid'] = userid;
    map['hotelid'] = hotelid;
    map['numguests'] = numguests;
    map['id'] = id;
    return map;
  }

}