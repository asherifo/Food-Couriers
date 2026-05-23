import 'package:flutter_bloc/flutter_bloc.dart';
import '../Data/auth_model.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {

  final AuthService _authService = AuthService();

  AuthCubit() : super(AuthInitial());

  Future<void> loginUser(String username, String password) async {

    emit(AuthLoading());

    try {

      final data = await _authService.login(username, password);

      emit(LoginSuccess(userData: data));

    } catch (error) {

      emit(AuthFailure(errorMessage: error.toString()));
    }
  }


  Future<void> signupUser(String firstName, String email, String password) async {
    emit(AuthLoading());

    try {
      await _authService.signup(firstName, email, password);
      emit(SignupSuccess());

    } catch (error) {
      emit(AuthFailure(errorMessage: error.toString()));
    }
  }
}