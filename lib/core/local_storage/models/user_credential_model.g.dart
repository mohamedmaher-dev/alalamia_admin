// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_credential_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserCredentialAdapter extends TypeAdapter<UserCredential> {
  @override
  final int typeId = 2;

  @override
  UserCredential read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCredential(
      email: fields[0] as String,
      password: fields[1] as String,
      token: fields[2] as String,
      countryName: fields[3] as String,
      countryId: fields[4] as int,
      countryCode: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserCredential obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.token)
      ..writeByte(3)
      ..write(obj.countryName)
      ..writeByte(4)
      ..write(obj.countryId)
      ..writeByte(5)
      ..write(obj.countryCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCredentialAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
