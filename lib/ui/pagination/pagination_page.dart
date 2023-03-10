import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination/cubit/pagination/pagination_cubit.dart';
import 'package:flutter_pagination/data/models/my_order_model.dart';

class PaginationPage extends StatefulWidget {
  const PaginationPage({Key? key}) : super(key: key);

  @override
  State<PaginationPage> createState() => _PaginationPageState();
}

class _PaginationPageState extends State<PaginationPage> {
  int page = 0;

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    _loadMore(0);
    scrollController.addListener(() {
      print("CURRENT LIST PIXEL:${scrollController.position.pixels}");
      print("MAX LIST PIXEL:${scrollController.position.maxScrollExtent}");
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _loadMore(page);
      }
    });
    super.initState();
  }

  _loadMore(int index) async {
    var cubit = BlocProvider.of<PaginationCubit>(context);
    if (!cubit.isFinished) {
      cubit.loadOrders(index, 15);
      page++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagination Example"),
      ),
      body: BlocBuilder<PaginationCubit, PaginationState>(
        builder: (context, state) {
          if (state is LoadInProgress) {
            return const CircularProgressIndicator();
          }
          else if (state is LoadInSuccess) {
            List<OrdersListItem> orders = state.orders;
            print("ORDERS LENGTH:${state.orders.length}");
            return ListView.builder(
              controller: scrollController,
              itemCount: orders.length + 1,
              itemBuilder: (BuildContext context, index) {
                if (index == orders.length) {
                  return Opacity(
                    opacity:
                        context.read<PaginationCubit>().isFinished ? 0.0 : 1.0,
                    child: const SizedBox(
                      height: 40,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  );
                } else {
                  var item = state.orders[index];
                  return SizedBox(
                    child: ListTile(
                      title: Text(item.id.toString()),
                      subtitle: Text(item.date),
                    ),
                  );
                }
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
