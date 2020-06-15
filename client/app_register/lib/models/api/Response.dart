import 'dart:convert';



class Response {
  String code;
  String message;
  dynamic data;
  Response({
    this.code,
    this.message,
    this.data,
  });

  
  

  

  Response copyWith({
    String code,
    String message,
    dynamic data,
  }) {
    return Response(
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'message': message,
      'data': data,
    };
  }

  static Response fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Response(
      code: map['code'],
      message: map['message'],
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  static Response fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Response(code: $code, message: $message, data: $data)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Response &&
      o.code == code &&
      o.message == message &&
      o.data == data;
  }

  @override
  int get hashCode => code.hashCode ^ message.hashCode ^ data.hashCode;
}
