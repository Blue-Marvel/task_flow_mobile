class UserModel {
  final String firstName;
  final String lastName;
  final String email;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory UserModel.fromData(Map<String, dynamic> data) {
    return UserModel(
        firstName: data['firstName'],
        lastName: data['lastName'],
        email: data['email']);
  }
}
