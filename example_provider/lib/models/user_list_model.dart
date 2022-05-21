import 'dart:convert';

List<UserModel> usersListFromJson(String str) {
  final userList = <UserModel>[];
  final jsonData = jsonDecode(str) as List<dynamic>;

  for (final user in jsonData) {
    userList.add(UserModel.fromJson(user as Map<String, dynamic>));
  }
  return userList;
}

// List<UserModel> usersListFromJson(String str) {
//   final jsonData = jsonDecode(str) as List<dynamic>;
//   final userList = List<UserModel>.from(jsonData.map<UserModel>((user as Map<String, dynamic>) => UserModel.fromJson(user)));
//   return userList;
// }

String usersListToJson(List<UserModel> data) {
  return jsonEncode(
      List<dynamic>.from(data.map<Map<String, dynamic>>((x) => x.toJson())));
}

class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int,
        name: json['name'] as String,
        username: json['username'] as String,
        email: json['email'] as String,
        address: Address.fromJson(json['address'] as Map<String, dynamic>),
        phone: json['phone'] as String,
        website: json['website'] as String,
        company: Company.fromJson(json['company'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'address': address.toJson(),
        'phone': phone,
        'website': website,
        'company': company.toJson(),
      };
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json['street'] as String,
        suite: json['suite'] as String,
        city: json['city'] as String,
        zipcode: json['zipcode'] as String,
        geo: Geo.fromJson(json['geo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'street': street,
        'suite': suite,
        'city': city,
        'zipcode': zipcode,
        'geo': geo.toJson(),
      };
}

class Geo {
  final String lat;
  final String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json['lat'] as String,
        lng: json['lng'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'lat': lat,
        'lng': lng,
      };
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json['name'] as String,
        catchPhrase: json['catchPhrase'] as String,
        bs: json['bs'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'catchPhrase': catchPhrase,
        'bs': bs,
      };
}
