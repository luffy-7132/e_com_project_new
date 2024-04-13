class SignUpModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  SignUpModel({
    required this.email,
    required this.phone,
    required this.lastName,
    required this.firstName,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "f_name": firstName,
      "l_name": lastName,
      "email": email,
      "phone": phone,
      "password": password
    };
  }
}
