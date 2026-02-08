import 'package:equatable/equatable.dart';

class ContactRequestModel extends Equatable {
  const ContactRequestModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.message,
  });
  final String name;
  final String email;
  final String phone;
  final String address;
  final String message;

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'phone': phone,
    'address': address,
    'message': message,
  };

  @override
  List<Object?> get props => [name, email, phone, address, message];
}
