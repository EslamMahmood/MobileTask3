import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const  CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showAddToCartBottomSheet(context);
          },
          child:const Text('Add to Cart'),
        ),
      ),
    );
  }

  void _showAddToCartBottomSheet(BuildContext context) {
    int selectedAmount = 1; // Default value
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Select Quantity:',
                    style:TextStyle(color: Colors.grey,fontSize: 18.0),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          if (selectedAmount > 1) {
                            setState(() {
                              selectedAmount--;
                            });
                          }
                        },
                      ),
                      Text(
                        '$selectedAmount',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            selectedAmount++;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add product to cart with selectedAmount
                      _addToCart(selectedAmount);
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _addToCart(int amount) {
    // Implement your logic to add the product to the cart with the selected amount
    print('Product added to cart with amount: $amount');
  }
}