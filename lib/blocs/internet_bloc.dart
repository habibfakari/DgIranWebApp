import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum InternetStatus { connected, disconnected }

class InternetCubit extends Cubit<InternetStatus> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _subscription;

  InternetCubit() : super(InternetStatus.connected) {
    _init();
  }

  void _init() {
    _subscription =
        _connectivity.onConnectivityChanged.listen((result) async {
          if (result == ConnectivityResult.none) {
            emit(InternetStatus.disconnected);
          } else {
            final hasInternet = await _hasInternet();
            emit(hasInternet
                ? InternetStatus.connected
                : InternetStatus.disconnected);
          }
        });
  }

  Future<bool> _hasInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}