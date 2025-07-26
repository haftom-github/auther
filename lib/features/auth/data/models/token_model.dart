import '../../domain/entities/token.dart';

class TokenModel {
  final String value;
  const TokenModel(this.value);

  Token toEntity() => Token(value);

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(json['value'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
    };
  }
}