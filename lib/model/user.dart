import 'dart:convert';

enum Gender { male, female }

class User {
  String firstName;
  String lastName;
  int? age;
  double height;
  Gender gender;
  List<String> hobbies;
  String favoriteProgrammingLanguage;
  String secret;

  User({
    this.firstName = "",
    this.lastName = "",
    this.age,
    this.height = 150.0,
    this.gender = Gender.male,
    this.hobbies = const [],
    this.favoriteProgrammingLanguage = "",
    this.secret = ""
  });

  String getFullName() => "$firstName $lastName";

  String heightToString() => "${height.toInt().toString()} cm";

  String genderToString() => gender == Gender.male ? "Man" : "Female";

  String ageToString() => age != null ? "$age y/o" : "";

  String hobbiesToString() {
    if (hobbies.isEmpty) {
      return "";
    }

    String hobbyString = "";
    hobbyString += hobbies.join(", ");

    return hobbyString;
  }

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'age': age,
    'height': height,
  };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      age: json['age'],
      height: json['height'],
    );
  }

  String serialize() {
    return jsonEncode(toJson());
  }

  static User deserialize(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return User.fromJson(json);
  }

}
