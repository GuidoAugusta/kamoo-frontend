import 'package:flutter/material.dart';
import 'package:kamoo/models/product_model.dart';

class WishlistProvider with ChangeNotifier {
  List<ProductModel> _wishlish = [];

  List<ProductModel> get wishlist => _wishlish;

  set wishlist(List<ProductModel> wishlist) {
    _wishlish = wishlist;
    notifyListeners();
  }

  setProduct(ProductModel product) {
    if (!isWishlist(product)) {
      _wishlish.add(product);
    } else {
      _wishlish.removeWhere((element) => element.id == product.id);
    }

    notifyListeners();
  }

  isWishlist(ProductModel product) {
    if (wishlist.indexWhere((element) => element.id == product.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
