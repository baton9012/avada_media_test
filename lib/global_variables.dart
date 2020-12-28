import 'package:firebase_auth/firebase_auth.dart';

import 'models/dress.dart';

bool isLogin = false;
UserCredential user;
List<Dress> dressInCard;
enum BottomNavigation { home, search, cart, profile }
