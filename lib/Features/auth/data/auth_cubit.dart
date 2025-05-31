// ignore_for_file: avoid_print
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthState {
  final bool isLoggedIn;

  AuthState({required this.isLoggedIn});
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(isLoggedIn: true));

  void login() {
    emit(AuthState(isLoggedIn: true));
    print(state.isLoggedIn);
    print('login');
  }

  void logout() {
    emit(AuthState(isLoggedIn: false));
    print(state.isLoggedIn);
    print('logout');
  }
}
