import 'dart:convert';

import 'package:equatable/equatable.dart';

class Artist extends Equatable {
  const Artist({required this.name, required this.mbid});

  final String name;
  final String mbid;

  Artist copyWith({String? name, String? mbid}) {
    return Artist(name: name ?? this.name, mbid: mbid ?? this.mbid);
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'mbid': mbid};
  }

  factory Artist.fromMap(Map<String, dynamic> map) {
    return Artist(name: map['name'], mbid: map['mbid']);
  }

  String toJson() => json.encode(toMap());

  factory Artist.fromJson(String source) => Artist.fromMap(json.decode(source));

  @override
  List<Object?> get props => [name, mbid];
}
