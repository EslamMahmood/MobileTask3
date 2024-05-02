import 'dart:developer';
import 'dart:typed_data';

class ProductModel {
  String? name, desc;
  int? favourite , cart , id , availableQuantity , quantity;
  Uint8List? image;

  ProductModel.fromJson(Map m) {
    log(m.toString());
    name = m['name'];
    desc = m['description'];
    image = m['image'];
    quantity = m['quantity'];
    availableQuantity = m['availableQuantity'];
    cart = m['cart'];
    favourite = m['favourite'];
    id = m['id'];
  }
}