class User {
  final String id;
  final String fullName;
  final String email;
  final String userRole;
  final String phoneNumber;

  User({this.id, this.fullName, this.email, this.userRole, this.phoneNumber});

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        userRole = data['userRole'],
        phoneNumber = data['phoneNumber'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'userRole': userRole,
      'phoneNumber': phoneNumber,
    };
  }
}
