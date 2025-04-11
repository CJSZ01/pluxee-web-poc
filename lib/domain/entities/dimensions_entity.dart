// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Dimensions {
  final double width;
  final double height;
  final double depth;
  final int? length;
  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
    this.length,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'width': width,
      'height': height,
      'depth': depth,
      'length': length,
    };
  }

  factory Dimensions.fromMap(Map<String, dynamic> map) {
    return Dimensions(
      width: map['width'] as double,
      height: map['height'] as double,
      depth: map['depth'] as double,
      length: map['length'] != null ? map['length'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dimensions.fromJson(String source) =>
      Dimensions.fromMap(json.decode(source) as Map<String, dynamic>);
}
