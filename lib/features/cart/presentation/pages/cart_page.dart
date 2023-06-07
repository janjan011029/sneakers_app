import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_app/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:sneakers_app/features/cart/presentation/widgets/item_cart_card.dart';

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
            listener: (context, state) {},
            builder: (context, state) {
              return BlocBuilder<CartCubit, CartState>(
                builder: (context, cartState) {
                  final items = cartState.cartItems;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            final shoeName = item.shoeName ?? '-';
                            final price = item.retailPrice?.toDouble() ?? 0.00;
                            final img = item.thumbnail ?? '';
                            final qty = item.qty ?? 0;

                            if (items.isEmpty) {
                              return const Center(
                                child: Text('No items found.'),
                              );
                            }

                            return ItemCartCard(
                              itemName: shoeName,
                              price: price,
                              img: img,
                              qty: qty,
                              addQty: () {
                                context.read<CartCubit>().addQty(item);
                              },
                              lessQty: () {
                                context.read<CartCubit>().lessQty(item);
                              },
                              onDelete: (context) {
                                context.read<CartCubit>().removeItem(item);
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
                onPressed: () {},
                title: "Check-out",
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
