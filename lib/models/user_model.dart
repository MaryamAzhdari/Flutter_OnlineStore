import 'dart:convert';

class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String password;
  final String state;
  final String city;
  final String locality;
  final String token;

  UserModel(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.password,
      required this.state,
      required this.city,
      required this.locality,
      required this.token});

  //Serialization : Convert UserModel Object to a Map
  //Map : A Map is a collection of key-value pairs
  //Why : Converting to a map is an intermediate step the makes it easier to serialize
  //The object to formats like json for storage or transmission
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'email': email,
      'password': password,
      'state': state,
      'city': city,
      'locality': locality,
      'token': token
    };
  }

  //Serialization : Convert Map to json string
  //This method directly encode the data from the map into a Json string
  //The json.encode() function converts a Dart object (such as Map or List)
  //Into a json string representation, making it suitable for communication
  //Between diferent systems.
  String toJson() => json.encode(toMap());

  //Deserialization : Convert a Map to UserModel object
  //Purpose : Manipulation and UserModel : once the data is converted to a UserModel object
  //The factory constructor takes a map
  //fromMap: This constructor takes a map and converts this into an object
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map['_id'] as String? ?? "",
        fullName: map['fullName'] as String? ?? "",
        email: map['email'] as String? ?? "",
        password: map['password'] as String? ?? "",
        state: map['state'] as String? ?? "",
        city: map['city'] as String? ?? "",
        locality: map['locality'] as String? ?? "",
        token: map['token'] as String? ?? "");
  }

  //fromJson: This constructor takes a json string, and decodes into a map<>
  //and then uses fromMap to convert the map into an object
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
