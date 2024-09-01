// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toeic_question.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToeicQuestionAdapter extends TypeAdapter<ToeicQuestion> {
  @override
  final int typeId = 25;

  @override
  ToeicQuestion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToeicQuestion(
      id: fields[0] as String,
      question: fields[1] as String,
      answers: (fields[3] as List).cast<String>(),
      description: fields[4] as String,
      answer: fields[5] as String,
      mean: fields[6] as String,
    )..wasCorrected = fields[7] as bool?;
  }

  @override
  void write(BinaryWriter writer, ToeicQuestion obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(3)
      ..write(obj.answers)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.answer)
      ..writeByte(6)
      ..write(obj.mean)
      ..writeByte(7)
      ..write(obj.wasCorrected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToeicQuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
