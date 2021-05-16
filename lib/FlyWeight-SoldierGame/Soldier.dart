import 'package:my_demo_flutter_app/FlyWeight-SoldierGame/ISoldier.dart';
import 'package:my_demo_flutter_app/FlyWeight-SoldierGame/SoldierFactory.dart';
import 'package:my_demo_flutter_app/FlyWeight-SoldierGame/SoldierState.dart';

class Soldier implements ISoldier {
  final SoldierType soliderType;

  // Many other properties function, and take long time to init
  Soldier(this.soliderType) {
    print("Soldier is created! - " + soliderType.toString());
  }

  @override
  void setExtrinsic(SoldierState state) {
    print("SoliderState id: ${state.id} - star: ${state.star}");
  }
}