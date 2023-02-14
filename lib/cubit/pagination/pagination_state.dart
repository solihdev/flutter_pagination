part of 'pagination_cubit.dart';

abstract class PaginationState {}

class InitialState extends PaginationState {}

class LoadInProgress extends PaginationState {}

class LoadInSuccess extends PaginationState {
  final List<OrdersListItem> orders;

  LoadInSuccess({
    required this.orders,
  });
}

class LoadInFailure extends PaginationState {}
