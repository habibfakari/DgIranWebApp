import 'package:digiran/blocs/show_error_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth_bloc.dart';
import 'internet_bloc.dart';
import 'locale_bloc.dart';

extension BlocX on BuildContext {
  AuthCubit get auth => read<AuthCubit>();
  AppErrorCubit get error => read<AppErrorCubit>();
  LocaleCubit get locale => read<LocaleCubit>();
  InternetCubit get internet => read<InternetCubit>();
}