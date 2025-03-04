import 'dart:convert';

import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String type;
  final List<double> coordinates;

  const Location({this.type = 'Point', required this.coordinates});

  Map<String, dynamic> toMap() => {'type': type, 'coordinates': coordinates};
  factory Location.fromMap(Map<String, dynamic> map) => Location(type: map['type'], coordinates: map['coordinates']);

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) => Location.fromMap(json.decode(source));

  @override
  List<Object?> get props => [type, coordinates];

  Location copyWith({String? type, List<double>? coordinates}) =>
      Location(type: type ?? this.type, coordinates: coordinates ?? this.coordinates);
}
