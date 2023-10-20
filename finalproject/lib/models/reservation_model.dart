class ReservationModel {
  ReservationModel({
      this.fromdate, 
      this.todate, 
      this.time, 
      this.userid, 
      this.hotelid, 
      this.numguests, 
      this.id,});

  ReservationModel.fromJson(dynamic json) {
    fromdate = json['fromdate'];
    todate = json['todate'];
    time = json['time'];
    userid = json['userid'];
    hotelid = json['hotelid'];
    numguests = json['numguests'];
    id = json['id'];
  }
  int? fromdate;
  int? todate;
  int? time;
  int? userid;
  int? hotelid;
  int? numguests;
  String? id;
ReservationModel copyWith({  int? fromdate,
  int? todate,
  int? time,
  int? userid,
  int? hotelid,
  int? numguests,
  String? id,
}) => ReservationModel(  fromdate: fromdate ?? this.fromdate,
  todate: todate ?? this.todate,
  time: time ?? this.time,
  userid: userid ?? this.userid,
  hotelid: hotelid ?? this.hotelid,
  numguests: numguests ?? this.numguests,
  id: id ?? this.id,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fromdate'] = fromdate;
    map['todate'] = todate;
    map['time'] = time;
    map['userid'] = userid;
    map['hotelid'] = hotelid;
    map['numguests'] = numguests;
    map['id'] = id;
    return map;
  }

}