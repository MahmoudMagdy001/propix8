import 'package:equatable/equatable.dart';

class FaqModel extends Equatable {
  const FaqModel({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
    id: json['id'] as int,
    question: json['question'] as String,
    answer: json['answer'] as String,
  );
  final int id;
  final String question;
  final String answer;

  @override
  List<Object?> get props => [id, question, answer];
}
