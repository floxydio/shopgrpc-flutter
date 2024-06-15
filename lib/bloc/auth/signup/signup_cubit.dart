import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grpc/grpc.dart';
import 'package:shopproto/pkg/auth.pbgrpc.dart';
import 'package:shopprotoflutter/bloc/auth/signup/signup_event.dart';

class SignUpCubit extends Cubit<SignUpEvent> {
  final ClientChannel channel;
  SignUpCubit({
    required this.channel,
  }) : super(const SignUpEvent(
            name: '',
            email: '',
            password: '',
            role: '',
            statusLogin: '',
            responseMessage: ''));

  void updateName(String name) {
    emit(state.copyWith(name: name));
  }

  void updateEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void updateRole(String role) {
    emit(state.copyWith(role: role));
  }

  void submit() async {
    Role? role;
    if (state.role == "Admin") {
      role = Role.ADMIN;
    } else {
      role = Role.USER;
    }
    final client = AuthServiceClient(channel);
    final request = await client.signUp(SignUpRequest(
      name: state.name,
      email: state.email,
      password: state.password,
      role: role,
    ));
    if (request.status == 201) {
      emit(state.copyWith(statusLogin: 'success'));
    } else if (request.status != 201) {
      emit(state.copyWith(responseMessage: request.message));
      emit(state.copyWith(statusLogin: 'failed'));
      emit(state.copyWith(statusLogin: ''));
      emit(state.copyWith(responseMessage: ''));
    }
  }
}
