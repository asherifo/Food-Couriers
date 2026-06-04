class UserProfile {
  final String firstName;
  final String lastName;
  final String companyName;
  final String title; // Occupation
  final String phone;
  final String email;
  final String image;

  UserProfile({required this.firstName, required this.lastName, required this.companyName, required this.title, required this.phone, required this.email, required this.image});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      firstName: json['firstName'],
      lastName: json['lastName'],
      companyName: json['company']['name'],
      title: json['company']['title'],
      phone: json['phone'],
      email: json['email'],
      image: json['image'],
    );
  }
}