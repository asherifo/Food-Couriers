import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/features/Profile/logic/profile_cibit.dart';

// الحالات
abstract class UserState {}
class UserLoading extends UserState {}
class UserLoaded extends UserState { final Map<String, dynamic> user; UserLoaded(this.user); }
class UserError extends UserState { final String error; UserError(this.error); }


