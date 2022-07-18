import 'dart:convert';
/// status : "success"
/// message : "ok"
/// redirect : ""
/// data : [{"id":1,"bannerType":"SHOPPING","bannerImage":"https://du3kkzispvlyx.cloudfront.net/img/284683b7-a5c7-4760-984d-55460399be3f.jpg"}]

ShoppingBannerModel shoppingBannerModelFromJson(String str) => ShoppingBannerModel.fromJson(json.decode(str));
String shoppingBannerModelToJson(ShoppingBannerModel data) => json.encode(data.toJson());
class ShoppingBannerModel {
  ShoppingBannerModel({
      String? status, 
      String? message, 
      String? redirect, 
      List<BannerData>? data,}){
    _status = status;
    _message = message;
    _redirect = redirect;
    _data = data;
}

  ShoppingBannerModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _redirect = json['redirect'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BannerData.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  String? _redirect;
  List<BannerData>? _data;
ShoppingBannerModel copyWith({  String? status,
  String? message,
  String? redirect,
  List<BannerData>? data,
}) => ShoppingBannerModel(  status: status ?? _status,
  message: message ?? _message,
  redirect: redirect ?? _redirect,
  data: data ?? _data,
);
  String? get status => _status;
  String? get message => _message;
  String? get redirect => _redirect;
  List<BannerData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['redirect'] = _redirect;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// bannerType : "SHOPPING"
/// bannerImage : "https://du3kkzispvlyx.cloudfront.net/img/284683b7-a5c7-4760-984d-55460399be3f.jpg"

BannerData dataFromJson(String str) => BannerData.fromJson(json.decode(str));
String dataToJson(BannerData data) => json.encode(data.toJson());
class BannerData {
  BannerData({
      int? id, 
      String? bannerType, 
      String? bannerImage,}){
    _id = id;
    _bannerType = bannerType;
    _bannerImage = bannerImage;
}

  BannerData.fromJson(dynamic json) {
    _id = json['id'];
    _bannerType = json['bannerType'];
    _bannerImage = json['bannerImage'];
  }
  int? _id;
  String? _bannerType;
  String? _bannerImage;
BannerData copyWith({  int? id,
  String? bannerType,
  String? bannerImage,
}) => BannerData(  id: id ?? _id,
  bannerType: bannerType ?? _bannerType,
  bannerImage: bannerImage ?? _bannerImage,
);
  int? get id => _id;
  String? get bannerType => _bannerType;
  String? get bannerImage => _bannerImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['bannerType'] = _bannerType;
    map['bannerImage'] = _bannerImage;
    return map;
  }

}