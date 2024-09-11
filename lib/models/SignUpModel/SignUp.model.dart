class SignUpModel {
  String? password;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? phoneNumber;
  String? department;
  String? designation;

  SignUpModel({
    this.password,
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.phoneNumber,
    this.department,
    this.designation,
  });

static const List<String> departments = [
    "Engineering",
    // need to add more
  ];

static const  List<String> designations = [
    "Software Engineer",
  ];

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'emailAddress': emailAddress,
      'phoneNumber': phoneNumber,
      'department': department,
      'designation': designation,
    };
  }
}
