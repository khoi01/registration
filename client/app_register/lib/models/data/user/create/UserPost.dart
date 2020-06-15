import 'dart:convert';

class UserPost {
  String name;
  UserPost(
    this.name,
  );

  UserPost copyWith({
    String name,
  }) {
    return UserPost(
      name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  static UserPost fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UserPost(
      map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  static UserPost fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'UserPost(name: $name)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is UserPost &&
      o.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
