import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(isLoading: false, isDone: false));

  Future<void> nextPage() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(isDone: true));
  }
}