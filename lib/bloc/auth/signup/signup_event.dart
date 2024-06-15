import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_event.freezed.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent({
    required String name,
    required String email,
    required String password,
    required String role,
    required String statusLogin,
    required String responseMessage,
  }) = _SignUpEvent;
}
