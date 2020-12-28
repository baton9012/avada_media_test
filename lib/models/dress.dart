import 'package:avada_test/database/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Dress {
  int id;
  String title;
  String pathImg;
  int count; // > 0 if is bought or in cart
  double price;
  double salePrice;
  int size;
  int color;
  Set userLiked = {};
  bool isLiked;
  DatabaseReference _dbId;
  bool isBought;
  bool isInCart;
  bool isSale;

  Dress({
    this.id,
    this.title,
    this.pathImg,
    this.count,
    this.price,
    this.size,
    this.color,
    this.isSale,
    this.isInCart,
    this.isBought,
    this.salePrice,
    this.isLiked,
  });

  void likedDress(UserCredential user) {
    if (this.userLiked.contains(user.user.uid)) {
      this.userLiked.remove(user.user.uid);
    } else {
      this.userLiked.add(user.user.uid);
    }
    this.update();
  }

  void update() {
    updateDress(this, this._dbId);
  }

  void setId(DatabaseReference id) {
    this._dbId = id;
  }

  DatabaseReference get dbId => _dbId;

  Map<String, dynamic> toJson() {
    return {
      'title': this.title,
      'img': this.pathImg,
      'count': this.count,
      'price': this.price,
      'doubleSalePrice': this.salePrice,
      'size': this.size,
      'color': this.color,
      'userLiked': this.userLiked.toList(),
      'isBought': this.isBought,
      'isInCart': this.isInCart,
      'isSale': this.isSale,
    };
  }
}
