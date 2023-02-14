import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination/data/repository/auth_repo/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(isLoading: false, isDone: false));

  String number = '';

  Future<void> nextPage(String number, String signature) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(isDone: true));
    Auth().sendSms(number: number, signature: signature);
  }
}
