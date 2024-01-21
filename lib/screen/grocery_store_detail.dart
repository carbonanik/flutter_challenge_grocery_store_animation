import 'package:flutter/material.dart';
import 'package:flutter_challenge_grocery_store_animation/model/grocery_product.dart';

class GroceryStoreDetail extends StatefulWidget {
  const GroceryStoreDetail({Key? key, required this.product, required this.onProductAdded}) : super(key: key);

  final GroceryProduct product;

  final VoidCallback onProductAdded;

  @override
  State<GroceryStoreDetail> createState() => _GroceryStoreDetailState();
}

class _GroceryStoreDetailState extends State<GroceryStoreDetail> {
  String heroTag = '';

  void _addToCart(BuildContext context) {
    setState(() {
      heroTag = 'details';
    });
    widget.onProductAdded();
    Navigator.of(context).pop();
  }

  /*,*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Hero(
                      tag: 'list_${widget.product.name}$heroTag',
                      child: Image.asset(
                        widget.product.image,
                        fit: BoxFit.contain,
                        height: MediaQuery.of(context).size.height * 0.36,
                      ),
                    ),
                  ),
                  Text(
                    widget.product.name,
                    style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.product.weight,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        "\$${widget.product.price}",
                        style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'About the product',
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.product.description,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                const Expanded(
                    flex: 2,
                    child: IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        ))),
                Expanded(
                  flex: 4,
                  child: ElevatedButton(
                    onPressed: () => _addToCart(context),
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(30),
                    // ),

                    // color: const Color(0xFFF4C459),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
