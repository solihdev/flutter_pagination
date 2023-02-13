import 'package:bloc/bloc.dart';
import 'package:flutter_pagination/data/models/my_order_model.dart';
import 'package:flutter_pagination/data/my_repository.dart';

part 'pagination_state.dart';

class PaginationCubit extends Cubit<PaginationState> {
  PaginationCubit() : super(InitialState());

  List<OrdersListItem> data = [];
  bool isFinished = false;

  void loadOrders(int page, int size) async {
    emit(LoadInProgress());
    if (page == 0) {
      data = [];
    }
    await Future.delayed(const Duration(seconds: 2));
    var orders = await MyRepository.getOrdersList(size, page);
    data.addAll(orders);
    print("DATA LENGTH :${data.length}");
    emit(LoadInSuccess(
      orders: data,
    ));
    isFinished = orders.length < size;
  }
}
