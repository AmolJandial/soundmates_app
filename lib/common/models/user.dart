import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:soundmates_app/config/enums/gender.dart';
import 'package:soundmates_app/common/models/artist.dart';
import 'package:soundmates_app/common/models/location.dart';

class User extends Equatable {
  final int phone;
  final String desc;
  final String displayName;
  final int age;
  final Gender gender;
  final List<String> photosUrl;
  final List<Artist> favArtists;
  final Location location;

  const User({
    required this.phone,
    required this.desc,
    required this.displayName,
    required this.age,
    required this.gender,
    required this.photosUrl,
    required this.favArtists,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      'desc': desc,
      'displayName': displayName,
      'age': age,
      'gender': gender.toString(),
      'photosUrl': photosUrl,
      'favArtists': favArtists.map((artist) => artist.toMap()).toList(),
      'location': location.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) => User(
    phone: map['phone'],
    desc: map['desc'],
    displayName: map['displayName'],
    age: map['age'],
    gender: map['gender'],
    photosUrl: map['photosUrl'],
    favArtists: (map['favArtists'] as List).map((element) => Artist.fromMap(element as Map<String, dynamic>)).toList(),
    location: Location.fromMap(map['location']),
  );

  String toJson() => json.encode(toMap());
  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  List<Object?> get props => [phone, desc, displayName, age, gender, photosUrl, favArtists, location];
}
