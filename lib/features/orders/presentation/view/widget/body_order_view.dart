import 'package:e_commerce/core/helper_functions/router/router_name.dart';
import 'package:e_commerce/features/orders/domain/entites/get_order_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class BodyOrderView extends StatelessWidget {
  const BodyOrderView({
    super.key,
    required this.orders,
  });

  final GetOrderEntity orders;

  @override
  Widget build(BuildContext context) {
    if (orders.data!.data!.length > 0) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: orders.data!.data!.length,
          itemBuilder: (context, index) {
            final isZero = orders.data!.data!.first == 0;
            return InkWell(
              onTap: () {
                context.push(RouterName.order_datails_rivepod_work,
                    extra: orders.data!.data![index].id);
              },
              child: Card(
                color: isZero ? Colors.grey[200] : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: isZero ? 0 : 3,
                margin: EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: isZero ? Colors.grey : Colors.blue,
                    child: Icon(
                      isZero ? Icons.close : Icons.check,
                      color: Colors.white,
                    ),
                  ),
                  title: Text("رقم الطلب: ${orders.data!.data![index].id}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("التاريخ: ${orders.data!.data![index].date}"),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${NumberFormat('#,##0.00').format(orders.data!.data![index].total)} جنيه",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isZero ? Colors.grey : Colors.green,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        orders.data!.data![index].status!,
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    } else {
      return Center(
        child: Text("لا يوجد أية ��لبات"),
      );
    }
  }
}
