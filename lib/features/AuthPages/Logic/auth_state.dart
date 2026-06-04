// abstract class AuthState {}
//
// class AuthInitial extends AuthState {}
// class AuthLoading extends AuthState {}
//
// class LoginSuccess extends AuthState {
//   final Map<String, dynamic> userData;
//   LoginSuccess({required this.userData});
// }
//
// class SignupSuccess extends AuthState {}
//
// class AuthFailure extends AuthState {
//   final String errorMessage;
//   AuthFailure({required this.errorMessage});
// }
abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final int userId; // تخزين الـ id هنا مباشرة لتسهيل الوصول
  final Map<String, dynamic> userData;

  LoginSuccess({required this.userId, required this.userData});
}

class SignupSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String errorMessage;
  AuthFailure({required this.errorMessage});
}