import 'package:flutter/material.dart';
import 'package:meurastreio/models/order.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFCFCFCF)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(children: [
              Text(
                order.trackingNumber.toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Text(order.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16))
            ]),
            Column(
              children: [Text("TESTE")],
            )
          ],
        ));
  }
}
