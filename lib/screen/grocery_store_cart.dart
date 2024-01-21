import 'package:flutter/material.dart';
import 'package:flutter_challenge_grocery_store_animation/provider/grocery_store_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroceryStoreCart extends StatelessWidget {
  const GroceryStoreCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Cart',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: Consumer(
                        builder: (context, ref, child) {
                          final store = ref.watch(groceryStoreProvider);
                          return ListView.builder(
                              itemCount: store.cart.length,
                              itemBuilder: (context, index) {
                                final item = store.cart[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        backgroundImage: AssetImage(item.product.image),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        item.quantity.toString(),
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text('x', style: TextStyle(color: Colors.white)),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(item.product.name, style: const TextStyle(color: Colors.white)),
                                      const Spacer(),
                                      Text('\$${(item.product.price * item.quantity).toStringAsFixed(2)}',
                                          style: const TextStyle(color: Colors.white)),
                                      IconButton(
                                          onPressed: () {
                                            store.deleteProduct(item);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                );
                              });
                        }
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const Text(
                  'Total',
                  style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Consumer(
                  builder: (context, ref, child) {
                    final store = ref.watch(groceryStoreProvider);
                    return Text(
                      '\$${store.totalPriceElement()}',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    );
                  }
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                // setState((){});
              },
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(30),
              // ),
              // color: const Color(0xFFF4C459),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      )
    ;
  }
}
