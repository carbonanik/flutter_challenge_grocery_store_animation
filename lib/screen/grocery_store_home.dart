import 'package:flutter/material.dart';
import 'package:flutter_challenge_grocery_store_animation/model/grocery_state.dart';
import 'package:flutter_challenge_grocery_store_animation/provider/grocery_state_provider.dart';
import 'package:flutter_challenge_grocery_store_animation/provider/grocery_store_provider.dart';
import 'package:flutter_challenge_grocery_store_animation/screen/grocery_store_cart.dart';
import 'package:flutter_challenge_grocery_store_animation/screen/grocery_store_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const backgroundColor = Color(0xfff6f5f2);
const cartBarHeight = 100.0;
const _panelTransition = Duration(milliseconds: 900);

class GroceryStoreHome extends ConsumerWidget {
  const GroceryStoreHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    void _onVerticalGesture(DragUpdateDetails details) {
      if (details.primaryDelta! < -7) {
        ref.read(groceryStateProvider.notifier).state = GroceryState.cart;
      } else if (details.primaryDelta! > 12) {
        ref.read(groceryStateProvider.notifier).state = GroceryState.normal;
      }
    }

    double _getTopForWhitePanel(GroceryState state, Size size) {
      if (state == GroceryState.normal) {
        return -cartBarHeight + kToolbarHeight;
      } else if (state == GroceryState.cart) {
        return -(size.height - kToolbarHeight - cartBarHeight / 2);
      }
      return 0.0;
    }

    double _getTopForBlackPanel(GroceryState state, Size size) {
      if (state == GroceryState.normal) {
        return size.height - cartBarHeight;
      } else if (state == GroceryState.cart) {
        return cartBarHeight / 2;
      }
      return 0.0;
    }

    double _getTopForAppBar(GroceryState state) {
      if (state == GroceryState.normal) {
        return 0.0;
      } else if (state == GroceryState.cart) {
        return -cartBarHeight;
      }
      return 0.0;
    }

    final store = ref.watch(groceryStoreProvider);
    final groceryState = ref.watch(groceryStateProvider);

    return AnimatedBuilder(
        animation: store,
        builder: (context, _) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Stack(
                children: [
                  // ? Products Grid
                  AnimatedPositioned(
                    duration: _panelTransition,
                    curve: Curves.decelerate,
                    left: 0,
                    right: 0,
                    top: _getTopForWhitePanel(groceryState, size),
                    height: size.height - kToolbarHeight,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
                        child: const GroceryStoreList(),
                      ),
                    ),
                  ),

                  // ? Cart List
                  AnimatedPositioned(
                    duration: _panelTransition,
                    curve: Curves.decelerate,
                    left: 0,
                    right: 0,
                    top: _getTopForBlackPanel(groceryState, size),
                    height: size.height - cartBarHeight,
                    child: GestureDetector(
                      onVerticalDragUpdate: _onVerticalGesture,
                      child: Container(
                        color: Colors.black,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: AnimatedSwitcher(
                                duration: _panelTransition,
                                child: groceryState == GroceryState.normal
                                    ? SizedBox(
                                        key: const Key("1"),
                                        height: kToolbarHeight,
                                        child: Row(
                                          children: [
                                            const Text(
                                              'Cart +',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Expanded(
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Row(
                                                  children: List.generate(
                                                    store.cart.length,
                                                    (index) => Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                      child: Stack(
                                                        children: [
                                                          Hero(
                                                            tag: 'list_${store.cart[index].product.name}details',
                                                            child: CircleAvatar(
                                                              backgroundColor: Colors.white,
                                                              backgroundImage:
                                                                  AssetImage(store.cart[index].product.image),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: 0,
                                                            child: CircleAvatar(
                                                              radius: 10,
                                                              backgroundColor: Colors.red,
                                                              child: Text(
                                                                store.cart[index].quantity.toString(),
                                                                style: const TextStyle(color: Colors.white),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            CircleAvatar(
                                              backgroundColor: const Color(0xFFF4C459),
                                              child: Text(store.totalCartElement().toString()),
                                            )
                                          ],
                                        ),
                                      )
                                    : const SizedBox(
                                        key: Key('2'),
                                        height: kToolbarHeight,
                                      ),
                                // ),
                              ),
                            ),
                            Expanded(
                              child: AnimatedSwitcher(
                                duration: _panelTransition,
                                child: groceryState == GroceryState.cart
                                    ? const GroceryStoreCart()
                                    : const SizedBox(
                                        key: Key('4539845'),
                                      ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    curve: Curves.decelerate,
                    duration: _panelTransition,
                    left: 0,
                    right: 0,
                    top: _getTopForAppBar(groceryState),
                    child: const _AppBarGrocery(),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class _AppBarGrocery extends StatelessWidget {
  const _AppBarGrocery();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: backgroundColor,
      child: const Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              "Fruits and veritable",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.settings),
          )
        ],
      ),
    );
  }
}
