import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'dart:ui' show Color;

import 'product.dart';

final Catalog catalog = fetchCatalogSync();

Future<Catalog> fetchCatalog() {
  return Future.delayed(const Duration(milliseconds: 200), fetchCatalogSync);
}

Catalog fetchCatalogSync() {
  return Catalog._sample();
}

Future<Null> updateCatalog(Catalog newCatalog) {
  return Future.delayed(const Duration(milliseconds: 200), () {
    catalog._products.clear();
    catalog._products.addAll(Catalog._sampleProducts);
  });
}

class Catalog {
  static const List<Product> _sampleProducts = <Product>[
    Product(42, "Sweater", const Color(0xFF536DFE)),
    Product(1024, "Socks", const Color(0xFFFFD500)),
    Product(1337, "Shawl", const Color(0xFF1CE8B5)),
    Product(123, "Jacket", const Color(0xFFFF6C00)),
    Product(201805, "Hat", const Color(0xFF574DDD)),
    Product(128, "Hoodie", const Color(0xFFABD0F2)),
    Product(321, "Tuxedo", const Color(0xFF8DA0FC)),
    Product(1003, "Shirt", const Color(0xFF1CE8B5)),
  ];

  final List<Product> _products;

  Catalog.empty() : _products = [];
  
  Catalog._sample() : _products = _sampleProducts;

  bool get isEmpty => _products.isEmpty;
  
  UnmodifiableListView<Product> get products =>
      UnmodifiableListView<Product>(_products);
}