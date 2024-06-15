// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginEvent {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get statusLogin => throw _privateConstructorUsedError;
  String get responseMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginEventCopyWith<LoginEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
  @useResult
  $Res call(
      {String email,
      String password,
      String statusLogin,
      String responseMessage});
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? statusLogin = null,
    Object? responseMessage = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      statusLogin: null == statusLogin
          ? _value.statusLogin
          : statusLogin // ignore: cast_nullable_to_non_nullable
              as String,
      responseMessage: null == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginEventImplCopyWith<$Res>
    implements $LoginEventCopyWith<$Res> {
  factory _$$LoginEventImplCopyWith(
          _$LoginEventImpl value, $Res Function(_$LoginEventImpl) then) =
      __$$LoginEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      String statusLogin,
      String responseMessage});
}

/// @nodoc
class __$$LoginEventImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginEventImpl>
    implements _$$LoginEventImplCopyWith<$Res> {
  __$$LoginEventImplCopyWithImpl(
      _$LoginEventImpl _value, $Res Function(_$LoginEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? statusLogin = null,
    Object? responseMessage = null,
  }) {
    return _then(_$LoginEventImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      statusLogin: null == statusLogin
          ? _value.statusLogin
          : statusLogin // ignore: cast_nullable_to_non_nullable
              as String,
      responseMessage: null == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginEventImpl implements _LoginEvent {
  const _$LoginEventImpl(
      {required this.email,
      required this.password,
      required this.statusLogin,
      required this.responseMessage});

  @override
  final String email;
  @override
  final String password;
  @override
  final String statusLogin;
  @override
  final String responseMessage;

  @override
  String toString() {
    return 'LoginEvent(email: $email, password: $password, statusLogin: $statusLogin, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginEventImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.statusLogin, statusLogin) ||
                other.statusLogin == statusLogin) &&
            (identical(other.responseMessage, responseMessage) ||
                other.responseMessage == responseMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, statusLogin, responseMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginEventImplCopyWith<_$LoginEventImpl> get copyWith =>
      __$$LoginEventImplCopyWithImpl<_$LoginEventImpl>(this, _$identity);
}

abstract class _LoginEvent implements LoginEvent {
  const factory _LoginEvent(
      {required final String email,
      required final String password,
      required final String statusLogin,
      required final String responseMessage}) = _$LoginEventImpl;

  @override
  String get email;
  @override
  String get password;
  @override
  String get statusLogin;
  @override
  String get responseMessage;
  @override
  @JsonKey(ignore: true)
  _$$LoginEventImplCopyWith<_$LoginEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
