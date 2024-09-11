class UserModel {
   String? id;
   String? name;
   String? email;
   String? phone;
   String? address;
   String? designation;
   String? department;
   String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.designation,
    this.department,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      designation: json['designation'] as String?,
      department: json['department'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'designation': designation,
      'department': department,
      'token': token,
    };
  }

  UserModel update({
    String? name,
    String? email,
    String? phone,
    String? address,
    String? designation,
    String? department,
    String? token,
  }) {
    return UserModel(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      designation: designation ?? this.designation,
      department: department ?? this.department,
      token: token ?? this.token,
    );
  }
}
