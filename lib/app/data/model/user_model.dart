class User {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  bool? isMale;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.isMale,
  });

  User.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'],
        lastName = json['lastName'],
        email = json['email'],
        password = json['password'],
        isMale = json['isMale'];

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'isMale': isMale,
      };
}
