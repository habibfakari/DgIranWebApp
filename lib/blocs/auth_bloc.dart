import 'package:bloc/bloc.dart';
import 'package:digiran/blocs/show_error_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config.dart';
import '../../models/user_model.dart';
import '../api/auth_api.dart';
import '../blocRepositoryState/auth_state.dart';
import '../utility/htify.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthApi repo;
  final AppErrorCubit errorCubit;

  AuthCubit(this.repo, this.errorCubit) : super(const AuthState());

  // ---------------- helpers ----------------

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    Conf.token = token;
  }

  Future<void> _clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Conf.token = null;
  }

  void _mapError(Object e) {
    if (e is NetworkException) {
      errorCubit.show(AppError(e.message.toString()));
    }
    errorCubit.show(AppError('خطای غیرمنتظره رخ داد'));
  }

  // ---------------- LOGIN ----------------

  Future<void> login(Map<String, dynamic> data) async {
    emit(state.copyWith(loading: true, error: null));

    try {
      // final res =
      await repo.login(data);

      // if (res['access_token'] != null) {
      //   await _saveToken(res['access_token']);
      // }
      //
      // final user = await repo.getUser();
      //
      emit(state.copyWith(
        loading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        loading: false,
      ));
      _mapError(e);
    }
  }

  // ---------------- LOGIN VERIFY ----------------

  Future<void> loginVerify(Map<String, dynamic> data) async {
    emit(state.copyWith(loading: true, error: null));

    try {
      final res = await repo.loginVerify(data);
      print('res777 ===> ${res}');

      if (res['data']['token'] != null && res['data']['token']['access'] != null) {
        await _saveToken(res['data']['token']['access']);
      }
      final user = await repo.getUser(res['data']['uuid']);
      final resRegister = await repo.signupStep1({"fcm_token"
          :""});

      emit(state.copyWith(
        user: UserModel.fromJson(user),
        loading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        loading: false,
      ));
      _mapError(e);
    }
  }

  // ---------------- LOGOUT ----------------

  Future<void> logout() async {
    emit(state.copyWith(loading: true, error: null));

    try {
      await repo.logout();
      await _clearToken();

      emit(const AuthState());
    } catch (e) {
      emit(state.copyWith(
        loading: false,
      ));
      _mapError(e);
    }
  }

  // ---------------- FORGOT PASSWORD ----------------

  Future<void> forgotStep1(String email) async {
    emit(state.copyWith(loading: true, error: null));

    try {
      final res = await repo.forgotStep1(email);

      emit(state.copyWith(
        signUpId: res,
        loading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        loading: false,
      ));
      _mapError(e);
    }
  }

  Future<void> forgotStep2(Map<String,dynamic> data) async {
    emit(state.copyWith(loading: true, error: null));

    try {
      await repo.forgotStep2(data);

      emit(state.copyWith(loading: false));
    } catch (e) {
      emit(state.copyWith(
        loading: false,
      ));
      _mapError(e);
    }
  }

  Future<void> forgotStep3(Map<String,dynamic> data) async {
    emit(state.copyWith(loading: true, error: null));

    try {
      await repo.forgotStep3(data);

      emit(state.copyWith(loading: false));
    } catch (e) {
      emit(state.copyWith(
        loading: false,
      ));
      _mapError(e);
    }
  }

  // ---------------- USER ----------------

  Future<void> getUser(String userId) async {
    emit(state.copyWith(loading: true, error: null));

    try {
      final user = await repo.getUser(userId);

      emit(state.copyWith(
        user: UserModel.fromJson(user),
        loading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        loading: false,
      ));
      _mapError(e);
    }
  }

  // ---------------- STATE UPDATE ----------------

  void setForgetEmail(String email) {
    emit(state.copyWith(forgetEmail: email));
  }

  void clearError() {
    emit(state.copyWith(error: null));
  }
}