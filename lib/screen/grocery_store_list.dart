import 'package:flutter/material.dart';
import 'package:flutter_challenge_grocery_store_animation/provider/grocery_product_provider.dart';
import 'package:flutter_challenge_grocery_store_animation/provider/grocery_store_provider.dart';
import 'package:flutter_challenge_grocery_store_animation/screen/grocery_store_detail.dart';
import 'package:flutter_challenge_grocery_store_animation/screen/grocery_store_home.dart';
import 'package:flutter_challenge_grocery_store_animation/widget/staggered_dual_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroceryStoreList extends StatelessWidget {
  const GroceryStoreList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.only(top: cartBarHeight),
      child: Consumer(builder: (context, ref, child) {
        final products = ref.watch(groceryProductProvider);
        return StaggeredDualView(
          aspectRatio: 0.7,
          offsetPercent: 0.3,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 400),
                    reverseTransitionDuration: const Duration(milliseconds: 400),
                    pageBuilder: (context, animation, _) {
                      return FadeTransition(
                        opacity: animation,
                        child: GroceryStoreDetail(
                            product: product,
                            onProductAdded: () {
                              ref.read(groceryStoreProvider.notifier).addProduct(product);
                            }),
                      );
                    },
                  ),
                );
              },
              child: Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Hero(
                          tag: 'list_${product!.name}',
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.contain,
                            height: 100,
                          ),
                        ),
                      ),
                      Text(
                        "\$${product.price}",
                        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
                      ),
                      Text(
                        product.weight,
                        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: products.length,
        );
      }),
    );
    // return ListView.builder(
    //   padding: EdgeInsets.only(top: cartBarHeight),
    //   itemCount: bloc?.catalog.length,
    //     itemBuilder: (context, index) {
    //       return Container(
    //         height: 100,
    //         width: 100,
    //         color: Colors.primaries[index % Colors.primaries.length],
    //       );
    //     });
  }
}
