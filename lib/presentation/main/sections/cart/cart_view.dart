import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:e_comerce/presentation/main/sections/cart/cart_view_provider.dart';
import 'package:e_comerce/presentation/main/sections/cart/check_out/check_out_view_arguments.dart';
import 'package:e_comerce/presentation/resources/routes_manager.dart';
import 'package:e_comerce/presentation/widgets/widgets_utils.dart';


class CartPage extends StatelessWidget {

  CartPage({super.key});

  final formatter = NumberFormat();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider()..initData(),
      child: Consumer<CartProvider>(builder: (context, cartProvider, _) {
        return Scaffold(
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: defaultText(
                        'Cart',
                        size: 24,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: cartProvider.carts.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (ctx, index) {
                      final item = cartProvider.carts[index];
                      return Dismissible(
                        key: Key(item.name),
                        onDismissed: (direction) {
                          cartProvider.removeFromCart(item);
                        },
                        background:  Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
                          child:  const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.all(16.0), 
                          title: Row(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(22),
                                child: defaultImageNetwork(
                                  item.imageUrl,
                                  height: 120,
                                  width: 120,
                                ),
                              ),
                              const SizedBox(width: 16.0), 
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.name),
                                    Text('Price: ${formatter.format(item.price)} ฿'),
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: () {
                                            cartProvider.updateCart(index,mode: Mode.decrease);
                                          },
                                        ),
                                        Text(item.amount.toString()),
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed: () {
                                            cartProvider.updateCart(index,mode: Mode.increase);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: defaultText(
                        'Total Price: ${formatter.format(cartProvider.totalPrice)} ฿',
                        size: 13,
                        color: "#000000",
                        weight: FontWeight.bold
                      ),
                    ),
                    Expanded(
                      child: defaultButton(
                        context,
                        title: 'Check out',
                        onPressed: () {
                          Navigator.pushNamed(
                              context,
                              Routes.checkoutPage,
                              arguments: CheckOutViewArguments(
                                  price: cartProvider.totalPrice),
                            );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ],
          ),
        );
      }),
    );
  }
}
