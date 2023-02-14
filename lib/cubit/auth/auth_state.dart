part of 'auth_cubit.dart';

// ignore: must_be_immutable
class AuthState extends Equatable {
  bool isDone;
  bool isLoading;

  AuthState({required this.isDone, required this.isLoading});

  copyWith({
    bool? isDone,
    bool? isLoading,
  }) =>
      AuthState(
        isDone: isDone ?? this.isDone,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object?> get props => [isDone, isLoading];
}
