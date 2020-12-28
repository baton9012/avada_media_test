import 'package:avada_test/models/dress.dart';
import 'package:firebase_database/firebase_database.dart';

final DatabaseReference databaseReference =
    FirebaseDatabase.instance.reference();
DatabaseReference saveToCart(Dress dress) {
  var id = databaseReference.child('posts/').push();
  id.set(dress.toJson());
  return id;
}

void updateDress(Dress dress, DatabaseReference id) {
  id.update(dress.toJson());
}
