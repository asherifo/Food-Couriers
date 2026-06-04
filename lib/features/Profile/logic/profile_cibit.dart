import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/features/Profile/logic/profile_state.dart';

class ApiService {
  final Dio _dio = Dio();


  Future<Map<String, dynamic>> getUserData(int userId) async {
    final response = await _dio.get('https://dummyjson.com/users/$userId');
    return response.data;
  }
}
class UserCubit extends Cubit<UserState> {
  final ApiService apiService;
  UserCubit(this.apiService) : super(UserLoading());

  void fetchUser(int userId) async {
    emit(UserLoading());
    try {
      final user = await apiService.getUserData(userId);
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}