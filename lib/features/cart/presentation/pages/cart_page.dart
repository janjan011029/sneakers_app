import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:sneakers_app/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:sneakers_app/features/cart/presentation/widgets/item_cart_card.dart';

import '../../../../utils/constant/app_enums.dart';
import '../../../../utils/constant/app_style.dart';
import '../../../../widgets/rounded_button.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
    required this.cartCubit,
  });

  final CartCubit cartCubit;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartCubit = widget.cartCubit;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Cart'),
          elevation: 0,
        ),
        body: BlocProvider.value(
          value: cartCubit,
          child: BlocConsumer<CartCubit, CartState>(
            listener: (context, state) async {
              final status = state.stripePaymentStatus;

              if (status == Status.success) {
                final isError = await _displayPaymentSheet();
                if (!isError) {
                  cartCubit.resetState();
                }
              }

              if (status == Status.failure) {
                _snackbarError();
              }
            },
            builder: (context, state) {
              return BlocBuilder<CartCubit, CartState>(
                builder: (context, cartState) {
                  final items = cartState.cartItems;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      items.isEmpty
                          ? const Expanded(
                              child: Center(
                                child: Text('No items found.'),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  final item = items[index];
                                  final shoeName = item.shoeName ?? '-';
                                  final price =
                                      item.retailPrice?.toDouble() ?? 0.00;
                                  final img = item.thumbnail ?? '';
                                  final qty = item.qty ?? 0;

                                  return ItemCartCard(
                                    itemName: shoeName,
                                    price: price,
                                    img: img,
                                    qty: qty,
                                    addQty: () {
                                      cartCubit.addQty(item);
                                    },
                                    lessQty: () {
                                      cartCubit.lessQty(item);
                                    },
                                    onDelete: (context) {
                                      cartCubit.removeItem(item);
                                    },
                                  );
                                },
                              ),
                            ),
                      _renderTotal(context),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Padding _renderTotal(BuildContext context) {
    final total = context.read<CartCubit>().state.totalAmount.toString();
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Total', style: Theme.of(context).textTheme.bodyMedium),
              Text(
                '\$$total',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: RoundedButton(
                onPressed: total == "0"
                    ? null
                    : () {
                        context.read<CartCubit>().makePayment(
                              amount: total,
                              currency: 'USD',
                            );
                      },
                title: const Text(
                  'Checkout',
                  style: AppStyle.defaultTitle,
                ),
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(_snackbarSuccess());
        Navigator.pop(context);
      }).onError((error, stackTrace) {
        print('Error is:--->$error $stackTrace');
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(_snackbarError());
      });
      return true;
    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
      return false;
    } catch (e) {
      print('$e');
      return false;
    }
  }

  SnackBar _snackbarSuccess() {
    return SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      showCloseIcon: false,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        color: Colors.green,
        title: 'Success Payment!',
        message: 'Thank you, Come again.',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.success,
      ),
    );
  }

  SnackBar _snackbarError() {
    return SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      showCloseIcon: false,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        color: Colors.red,
        title: 'Error!',
        message: 'Error in payment please try again.',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.success,
      ),
    );
  }
}
