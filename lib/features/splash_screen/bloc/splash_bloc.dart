import 'package:flutter_bloc/flutter_bloc.dart';
import 'spash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashStarted>(_onSplashStarted);
    on<SplashLoginWithGooglePressed>(_onSplashLoginWithGoogle);
    on<SplashLoginWithApplePressed>(_onSplashLoginWithApple);
  }

  Future<void> _onSplashStarted(SplashStarted event, Emitter<SplashState> emit) async {
    // You can handle initial loading here if needed.
  }

  Future<void> _onSplashLoginWithGoogle(SplashLoginWithGooglePressed event, Emitter<SplashState> emit) async {
    emit(SplashLoading());
    await Future.delayed(const Duration(seconds: 1)); // Simulate api call
    emit(const SplashSuccess(message: "Logged in with Google"));
  }

  Future<void> _onSplashLoginWithApple(SplashLoginWithApplePressed event, Emitter<SplashState> emit) async {
    emit(SplashLoading());
    await Future.delayed(const Duration(seconds: 1)); // Simulate api call
    emit(const SplashSuccess(message: "Logged in with Apple"));
  }
}
