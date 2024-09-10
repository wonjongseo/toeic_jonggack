// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toeic_question_step.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToeicQuestionStepAdapter extends TypeAdapter<ToeicQuestionStep> {
  @override
  final int typeId = 26;

  @override
  ToeicQuestionStep read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToeicQuestionStep(
      headTitle: fields[0] as String,
      step: fields[1] as int,
      toeicQuestions: (fields[2] as List).cast<ToeicQuestion>(),
      scores: fields[4] as int,
    )
      ..wrongToeicQuestions = (fields[3] as List).cast<ToeicQuestion>()
      ..isFinished = fields[5] as bool?;
  }

  @override
  void write(BinaryWriter writer, ToeicQuestionStep obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.headTitle)
      ..writeByte(1)
      ..write(obj.step)
      ..writeByte(2)
      ..write(obj.toeicQuestions)
      ..writeByte(3)
      ..write(obj.wrongToeicQuestions)
      ..writeByte(4)
      ..write(obj.scores)
      ..writeByte(5)
      ..write(obj.isFinished);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToeicQuestionStepAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
