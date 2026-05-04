

import '../../models/user_model.dart';

class AuthState {
  final bool loading;
  final bool singleLoading;
  final bool cityLoading;

  final UserModel? user;
  final String? token;

  final String? forgetEmail;
  final int? signUpId;

  final Map<String, dynamic>? loginFields;

  final String? error;

  const AuthState({
    this.loading = false,
    this.singleLoading = false,
    this.cityLoading = false,
    this.user,
    this.token,
    this.forgetEmail,
    this.signUpId,
    this.loginFields,
    this.error,
  });

  AuthState copyWith({
    bool? loading,
    bool? singleLoading,
    bool? cityLoading,
    UserModel? user,
    String? token,
    String? forgetEmail,
    int? signUpId,
    Map<String, dynamic>? loginFields,
    String? error,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      singleLoading: singleLoading ?? this.singleLoading,
      cityLoading: cityLoading ?? this.cityLoading,
      user: user ?? this.user,
      token: token ?? this.token,
      forgetEmail: forgetEmail ?? this.forgetEmail,
      signUpId: signUpId ?? this.signUpId,
      loginFields: loginFields ?? this.loginFields,
      error: error,
    );
  }
}