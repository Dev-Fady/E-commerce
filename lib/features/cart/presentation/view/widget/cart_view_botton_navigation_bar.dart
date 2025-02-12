import 'dart:developer';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:e_commerce/core/helper_functions/security.dart';
import 'package:e_commerce/core/widget/custom_snackbar.dart';
import 'package:e_commerce/features/cart/domain/entites/get_carts_entity.dart';
import 'package:e_commerce/features/orders/presentation/manger/cubit/add_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import '../../../../orders/presentation/manger/cubit/add_order_state.dart';

class CartViewBottonNavigationBar extends StatelessWidget {
  const CartViewBottonNavigationBar({
    super.key,
    required this.data,
  });
  final GetCartsEntity data;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderFailure) {
          CustomSnackbar.show(
            context: context,
            title: 'تم بنجاح!',
            message: state.error.message,
            type: ContentType.failure,
          );
        } else if (state is AddOrderSuccess) {
          CustomSnackbar.show(
            context: context,
            title: 'تم بنجاح!',
            message: state.addOrder.message!,
            type: ContentType.success,
          );
          log("PAYPAL_CLIENT_ID: ${Security.PaypalClientId}");
          log("PAYPAL_SECRET_KEY: ${Security.PaypalSecretKey}");
          log("PAYPAL_: ${Security.Cli_token}");
          log("total: ${state.addOrder.data!.total.toString()},");
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: Security.PaypalClientId,
              secretKey: Security.PaypalSecretKey,
              transactions: [
                {
                  "amount": {
                    "total": state.addOrder.data!.total,
                    "currency": "USD",
                    "details": {
                      "subtotal": state.addOrder.data!.total,
                      "shipping": '0',
                      "shipping_discount": 0
                    }
                  },
                  "description": "The payment transaction description.",
                  // "payment_options": {
                  //   "allowed_payment_method":
                  //       "INSTANT_FUNDING_SOURCE"
                  // },
                  "item_list": {
                    "items": [],

                    // Optional
                    //   "shipping_address": {
                    //     "recipient_name": "Tharwat samy",
                    //     "line1": "tharwat",
                    //     "line2": "",
                    //     "city": "tharwat",
                    //     "country_code": "EG",
                    //     "postal_code": "25025",
                    //     "phone": "+00000000",
                    //     "state": "ALex"
                    //  },
                  }
                }
              ],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                log("onSuccess: $params");
                Navigator.pop(context);
              },
              onError: (error) {
                log("onError: $error");
                Navigator.pop(context);
              },
              onCancel: () {
                print('cancelled:');
                Navigator.pop(context);
              },
            ),
          ));
        }
      },
      builder: (context, state) {
        if (state is AddOrderLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () async {
              await context.read<AddOrderCubit>().addOrder();
            }, // Handle checkout
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: Text(
              'إتمام الشراء ${data.subTotal}  L.E',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
