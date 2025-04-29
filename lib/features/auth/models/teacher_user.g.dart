// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeacherUserAdapter extends TypeAdapter<_TeacherUser> {
  @override
  final int typeId = 1;

  @override
  _TeacherUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _TeacherUser(
      teacherVerification: fields[0] as TeacherVerification?,
      error: fields[2] as bool?,
      regId: fields[3] as String?,
      password: fields[4] as String?,
      defaultPwd: fields[5] as String?,
      name: fields[6] as String?,
      userId: fields[7] as String?,
      roleId: fields[8] as String?,
      academicYr: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _TeacherUser obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.teacherVerification)
      ..writeByte(2)
      ..write(obj.error)
      ..writeByte(3)
      ..write(obj.regId)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.defaultPwd)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.userId)
      ..writeByte(8)
      ..write(obj.roleId)
      ..writeByte(9)
      ..write(obj.academicYr);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeacherUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeacherUser _$TeacherUserFromJson(Map<String, dynamic> json) => _TeacherUser(
      teacherVerification: json['teacher_verification'] == null
          ? null
          : TeacherVerification.fromJson(
              json['teacher_verification'] as Map<String, dynamic>),
      error: json['error'] as bool?,
      regId: json['reg_id'] as String?,
      password: json['password'] as String?,
      defaultPwd: json['default_pwd'] as String?,
      name: json['name'] as String?,
      userId: json['user_id'] as String?,
      roleId: json['role_id'] as String?,
      academicYr: json['academic_yr'] as String?,
    );

Map<String, dynamic> _$TeacherUserToJson(_TeacherUser instance) =>
    <String, dynamic>{
      'teacher_verification': instance.teacherVerification,
      'error': instance.error,
      'reg_id': instance.regId,
      'password': instance.password,
      'default_pwd': instance.defaultPwd,
      'name': instance.name,
      'user_id': instance.userId,
      'role_id': instance.roleId,
      'academic_yr': instance.academicYr,
    };
