import 'package:flutter/material.dart';
import 'package:meurastreio/models/order.dart';
import 'package:meurastreio/services/order_service.dart';
import 'package:meurastreio/widgets/layout/global_scaffold.dart';
import 'package:meurastreio/widgets/order_card.dart';

class ListOrdersScreen extends StatefulWidget {
  const ListOrdersScreen({super.key});

  @override
  ListOrdersState createState() {
    return ListOrdersState();
  }
}

class ListOrdersState extends State<ListOrdersScreen> {
  late OrderService _orderService;
  var optionStyle = const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  void initState() {
    _orderService = OrderService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
        appBarTitle: "Meu Rastreio",
        body: Center(
          child: FutureBuilder<List<Order>>(
            future: _orderService.getAllOrders(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                    child: Text('Nenhuma encomenda disponível.'));
              } else {
                List<Order> orders = snapshot.data!;
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    return OrderCard(
                      order: order,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                );
              }
            },
          ),
        ));
  }
}
