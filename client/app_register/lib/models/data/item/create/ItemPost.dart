import 'dart:convert';

class ItemPost {
  String item;
  ItemPost({
    this.item,
  });

  ItemPost copyWith({
    String item,
  }) {
    return ItemPost(
      item: item ?? this.item,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'item': item,
    };
  }

  static ItemPost fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ItemPost(
      item: map['item'],
    );
  }

  String toJson() => json.encode(toMap());

  static ItemPost fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'ItemPost(item: $item)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ItemPost &&
      o.item == item;
  }

  @override
  int get hashCode => item.hashCode;
}
