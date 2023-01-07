import 'package:stock_record_app/ShoppingApp/model/product.dart';

class CartItem {
  final int count;
  final Product product;

  const CartItem(this.count, this.product);

  @override
  String toString() => "${product.name} x $count";
}