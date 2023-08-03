import 'package:hive/hive.dart';

import '../models/admin_meal_model.dart';

Future<void> newfn() async {
  dynamic newlist = await Hive.openBox<AdminMealModel>("newbaox");
  newlist.add();
  
}
