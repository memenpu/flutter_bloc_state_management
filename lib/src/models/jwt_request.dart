
class JwtRequest{
  final String email;
  final String password;

  JwtRequest({this.email, this.password});


  Map<String, dynamic> toJson() => _$AwtRequestToJson(this);

  Map<String, dynamic> _$AwtRequestToJson(JwtRequest instance) =>
      <String, dynamic>{
        'email': instance.email,
        'password': instance.password,
      };
}