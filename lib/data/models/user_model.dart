class UserModel {
  final String id;
  final String name;
  final String email;
  final String gender;
  final String skinType;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.skinType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      skinType: json['skinType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'gender': gender,
      'skinType': skinType,
    };
  }
}
