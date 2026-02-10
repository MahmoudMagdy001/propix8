import 'package:equatable/equatable.dart';

class BookingRequestModel extends Equatable {
  const BookingRequestModel({
    required this.unitId,
    required this.name,
    required this.email,
    required this.phone,
    required this.date,
    required this.time,
    this.notes = '',
  });

  final int unitId;
  final String name;
  final String email;
  final String phone;
  final String date;
  final String time;
  final String notes;

  Map<String, dynamic> toJson() => {
    'unit_id': unitId,
    'name': name,
    'email': email,
    'phone': phone,
    'date': date,
    'time': time,
    'notes': notes,
  };

  @override
  List<Object?> get props => [unitId, name, email, phone, date, time, notes];
}
