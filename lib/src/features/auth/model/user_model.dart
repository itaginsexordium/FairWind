import 'models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
sealed class UserModel with _$UserModel {
  @JsonSerializable(explicitToJson: true)
  const factory UserModel({
    required final int id,
    required final String firstName,
    required final String lastName,
    required final String email,
    required final UserRoleType userRoleType,
    // TODO: найти способ получать тут сразу класс страны если будет необходимо
    required final String correspondenceLanguage,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}