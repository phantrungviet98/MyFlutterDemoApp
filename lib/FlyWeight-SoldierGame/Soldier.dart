import 'package:my_demo_flutter_app/FlyWeight-SoldierGame/Context.dart';
import 'package:my_demo_flutter_app/FlyWeight-SoldierGame/ISoldier.dart';
import 'package:my_demo_flutter_app/FlyWeight-SoldierGame/SoldierFactory.dart';

class Soldier implements ISoldier {
  final SoldierType soliderType;

  // Many other properties function, and take long time to init
  Soldier(this.soliderType) {
    print("Soldier is created! - " + soliderType.toString());
  }
}