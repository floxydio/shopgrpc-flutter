import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grpc/grpc.dart';
import 'package:shopprotoflutter/bloc/auth/login/login_event.dart';
import 'package:shopproto/pkg/auth.pbgrpc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginEvent> {
  final ClientChannel channel;
  LoginCubit({
    required this.channel,
  }) : super(const LoginEvent(
            email: '', password: '', statusLogin: '', responseMessage: ''));

  void updateEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void updateStatusLogin(String statusLogin) {
    emit(state.copyWith(statusLogin: statusLogin));
  }

  void submit() async {
    final prefs = await SharedPreferences.getInstance();
    final client = AuthServiceClient(channel);
    final request = await client
        .login(LoginRequest(email: state.email, password: state.password));
    if (request.status == 200) {
      prefs.setString('token', request.token);
      prefs.setString('role', request.role);
      emit(state.copyWith(statusLogin: 'success'));
    } else if (request.status != 200) {
      emit(state.copyWith(responseMessage: request.message));
      emit(state.copyWith(statusLogin: 'failed'));
      emit(state.copyWith(statusLogin: ''));
      emit(state.copyWith(responseMessage: ''));
    }
  }
}
