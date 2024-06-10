import 'package:cryptocurrency/model/crypto.dart';
import 'package:flutter/cupertino.dart';

class CartModel extends ChangeNotifier {
  bool onclick = false;

  final List<Coin> _shopitem = [];
  final List<Coin> _cartitems = [];
  final List<Coin> _favorites = [];

  List<Coin> get shopitem => _shopitem;
  List<Coin> get cartitems => _cartitems;

  void addtocart(Coin coin) {
    _cartitems.add(coin);
    notifyListeners();
  }

  void removetocart() {
    _cartitems.remove(0);
    notifyListeners();
  }

  bool isInFavorites(Coin coin) {
    return _favorites.contains(coin);
  }

 void toggleFavorite(Coin coin) {
  if (isInFavorites(coin)) {
    _favorites.remove(coin);
  } else {
    _favorites.add(coin);
  }
  notifyListeners();
}
}
