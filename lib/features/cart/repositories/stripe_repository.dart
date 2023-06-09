import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:sneakers_app/api/client.dart';
import 'package:sneakers_app/features/cart/repositories/istripe_repository.dart';
import 'package:http/http.dart' as http;

import '../presentation/pages/constant.dart';

class StripeRepository implements IStripeRepository {
  late DioClient _dioClient;
  @override
  Future<bool> makePayment(
      {required String amount, required String currency}) async {
    try {
      Map<String, dynamic>? paymentIntent =
          await createPaymentIntent(amount: amount, currency: currency);
      //Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent['client_secret'],
                  // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
                  // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Adnan'))
          .then((value) {});

      ///now finally display payment sheeet
      // displayPaymentSheet();

      return true;
    } catch (e) {
      // print('exception:$e$s');
      return false;
    }
  }

  @override
  Future<Map<String, dynamic>> createPaymentIntent(
      {required String amount, required String currency}) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': 'USD',
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $SECRET_KEY',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );

      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
    return {};
  }

  String calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }
}
