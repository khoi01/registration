import 'dart:convert';

import 'package:collection/collection.dart';

class GetAllUserResponse {
 String code;
  String message;
  List<UserInfo> data;
  GetAllUserResponse({
    this.code,
    this.message,
    this.data,
  });

  GetAllUserResponse copyWith({
    String code,
    String message,
    List<UserInfo> data,
  }) {
    return GetAllUserResponse(
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'message': message,
      'data': List<dynamic>.from(data.map((x) => x.toMap())),
    };
  }

  static GetAllUserResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return GetAllUserResponse(
      code: map['code'],
      message: map['message'],
      data: List<UserInfo>.from(map['data']?.map((x) => UserInfo.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static GetAllUserResponse fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'GetAllUserResponse(code: $code, message: $message, data: $data)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return o is GetAllUserResponse &&
      o.code == code &&
      o.message == message &&
      listEquals(o.data, data);
  }

  @override
  int get hashCode => code.hashCode ^ message.hashCode ^ data.hashCode;
}

class UserInfo {
  int no;
  String name;
  UserInfo({
    this.no,
    this.name,
  });


  UserInfo copyWith({
    int no,
    String name,
  }) {
    return UserInfo(
      no: no ?? this.no,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'no': no,
      'name': name,
    };
  }

  static UserInfo fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UserInfo(
      no: map['no'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  static UserInfo fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'UserInfo(no: $no, name: $name)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is UserInfo &&
      o.no == no &&
      o.name == name;
  }

  @override
  int get hashCode => no.hashCode ^ name.hashCode;
}
