import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_coffee_shop/components/coffee_tile.dart';
import 'package:simple_coffee_shop/models/coffee.dart';
import 'package:simple_coffee_shop/models/coffee_shop.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add coffee to cart
  void addToCart(Coffee coffee) {
    // add to cart
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
    // let user know it add been successfully added
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Successfully added!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              // heading message
              const Text(
                "How would you like your coffee?",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              // list of coffee to buy
              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeShop.length,
                  itemBuilder: (context, index) {
                    // get individual coffee
                    Coffee eachCoffee = value.coffeeShop[index];
                    // return the tile for this coffee
                    return CoffeeTile(
                      coffee: eachCoffee,
                      icon: const Icon(Icons.add),
                      onPressed: () => addToCart(eachCoffee),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
