import 'package:bloc/bloc.dart';

class AppError {
  final String message;
  final int? code;

  AppError(this.message, {this.code});
}

class AppErrorCubit extends Cubit<AppError?> {
  AppErrorCubit() : super(null);

  void show(AppError error) => emit(error);
  void clear() => emit(null);
}

