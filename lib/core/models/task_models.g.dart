// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelsAdapter extends TypeAdapter<TaskModels> {
  @override
  final int typeId = 1;

  @override
  TaskModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModels(
      id: fields[0] as String?,
      title: fields[1] as String?,
      description: fields[2] as String?,
      date: fields[3] as String?,
      starttime: fields[4] as String?,
      endtime: fields[5] as String?,
      colorindex: fields[6] as int?,
      isCompleted: fields[7] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModels obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.starttime)
      ..writeByte(5)
      ..write(obj.endtime)
      ..writeByte(6)
      ..write(obj.colorindex)
      ..writeByte(7)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
