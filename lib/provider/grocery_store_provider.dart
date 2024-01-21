import 'package:flutter_challenge_grocery_store_animation/notifier/grocery_store_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final groceryStoreProvider = ChangeNotifierProvider((ref) => GroceryStoreNotifier(ref));
