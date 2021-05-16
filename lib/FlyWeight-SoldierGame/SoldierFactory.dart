import 'dart:collection';
import 'dart:io';
import 'package:my_demo_flutter_app/FlyWeight-SoldierGame/ISoldier.dart';
import 'package:my_demo_flutter_app/FlyWeight-SoldierGame/Soldier.dart';

enum SoldierType {
  sniper,
  marines,
  others,
}

// Store soldiers with specific id
class SoldierFactory {
  static final _soldiers = HashMap<SoldierType, ISoldier>();

  static ISoldier createSoldier(SoldierType id) {
    // Check id exist in factory or not
    ISoldier soldierInFactory = _soldiers[id];
    if (soldierInFactory == null) {
      // If not then create a new
      print('Create a new');
      waitingForCreateASoldier();
      soldierInFactory = Soldier(id);
      _soldiers[id] = soldierInFactory;
    }
    // return soldier in factory
    return soldierInFactory;
  }

  static int getTotalOfSoldiers() {
    return _soldiers.length;
  }

  static void waitingForCreateASoldier() {
    sleep(Duration(seconds: 3));
  }
}