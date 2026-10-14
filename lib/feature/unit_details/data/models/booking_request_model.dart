import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_request_model.freezed.dart';
part 'booking_request_model.g.dart';

@freezed
abstract class BookingRequestModel with _$BookingRequestModel {
  const factory BookingRequestModel({
    @JsonKey(name: 'unit_id') required int unitId,
    required String name,
    required String email,
    required String phone,
    required String date,
    required String time,
    @Default('') String notes,
  }) = _BookingRequestModel;

  factory BookingRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BookingRequestModelFromJson(json);
}
