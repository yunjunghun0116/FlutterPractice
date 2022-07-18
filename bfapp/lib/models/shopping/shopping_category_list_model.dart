import 'dart:convert';
/// status : "success"
/// message : "ok"
/// redirect : ""
/// data : [{"code":"10","name":"바디프랜드","fullCategoryName":"바디프랜드","imageUrl":"https://d1hx9iux3qv0op.cloudfront.net/img/665b88e0-30e0-4c5a-8118-505d49cef239.png","active":true},{"code":"20","name":"라클라우드","fullCategoryName":"라클라우드","imageUrl":"https://d1hx9iux3qv0op.cloudfront.net/img/764fb23b-360c-4a4a-8009-ac2bd29e30d7.png","active":true},{"code":"22","name":"test3","fullCategoryName":"test3","imageUrl":null,"active":true},{"code":"23","name":"나나나나","fullCategoryName":"나나나나","imageUrl":"https://d1hx9iux3qv0op.cloudfront.net/img/a829c091-8a88-4b93-83c7-111ba849ed78.jpg","active":true},{"code":"30","name":"W정수기","fullCategoryName":"W정수기","imageUrl":"https://d1hx9iux3qv0op.cloudfront.net/img/0c7bf5e1-c936-4e91-8f7f-2e54791a6725.png","active":true},{"code":"40","name":"핏타임","fullCategoryName":"핏타임","imageUrl":"https://d1hx9iux3qv0op.cloudfront.net/img/6b86c6d5-e5e6-46b7-9ec0-0d52f9fb2cec.png","active":true},{"code":"50","name":"백투더네이처","fullCategoryName":"백투더네이처","imageUrl":"https://d1hx9iux3qv0op.cloudfront.net/img/daae753a-6c69-494f-9798-fc1920fad975.png","active":true}]

ShoppingCategoryList shoppingCategoryListFromJson(String str) => ShoppingCategoryList.fromJson(json.decode(str));
String shoppingCategoryListToJson(ShoppingCategoryList data) => json.encode(data.toJson());
class ShoppingCategoryList {
  ShoppingCategoryList({
      String? status, 
      String? message, 
      String? redirect, 
      List<CategoryData>? data,}){
    _status = status;
    _message = message;
    _redirect = redirect;
    _data = data;
}

  ShoppingCategoryList.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _redirect = json['redirect'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(CategoryData.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  String? _redirect;
  List<CategoryData>? _data;
ShoppingCategoryList copyWith({  String? status,
  String? message,
  String? redirect,
  List<CategoryData>? data,
}) => ShoppingCategoryList(  status: status ?? _status,
  message: message ?? _message,
  redirect: redirect ?? _redirect,
  data: data ?? _data,
);
  String? get status => _status;
  String? get message => _message;
  String? get redirect => _redirect;
  List<CategoryData>? get data => _data;

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

/// code : "10"
/// name : "바디프랜드"
/// fullCategoryName : "바디프랜드"
/// imageUrl : "https://d1hx9iux3qv0op.cloudfront.net/img/665b88e0-30e0-4c5a-8118-505d49cef239.png"
/// active : true

CategoryData dataFromJson(String str) => CategoryData.fromJson(json.decode(str));
String dataToJson(CategoryData data) => json.encode(data.toJson());
class CategoryData {
  CategoryData({
      String? code, 
      String? name, 
      String? fullCategoryName, 
      String? imageUrl, 
      bool? active,}){
    _code = code;
    _name = name;
    _fullCategoryName = fullCategoryName;
    _imageUrl = imageUrl;
    _active = active;
}

  CategoryData.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _fullCategoryName = json['fullCategoryName'];
    _imageUrl = json['imageUrl'];
    _active = json['active'];
  }
  String? _code;
  String? _name;
  String? _fullCategoryName;
  String? _imageUrl;
  bool? _active;
CategoryData copyWith({  String? code,
  String? name,
  String? fullCategoryName,
  String? imageUrl,
  bool? active,
}) => CategoryData(  code: code ?? _code,
  name: name ?? _name,
  fullCategoryName: fullCategoryName ?? _fullCategoryName,
  imageUrl: imageUrl ?? _imageUrl,
  active: active ?? _active,
);
  String? get code => _code;
  String? get name => _name;
  String? get fullCategoryName => _fullCategoryName;
  String? get imageUrl => _imageUrl;
  bool? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['fullCategoryName'] = _fullCategoryName;
    map['imageUrl'] = _imageUrl;
    map['active'] = _active;
    return map;
  }

}