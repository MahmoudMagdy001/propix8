class FaqEntity {
  const FaqEntity({
    required this.id,
    required this.question,
    required this.answer,
  });

  final int id;
  final String question;
  final String answer;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FaqEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          question == other.question &&
          answer == other.answer;

  @override
  int get hashCode => Object.hash(id, question, answer);
}
