import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_demo_flutter_app/FlyWeight-SoldierGame/AllSoldierDisplayWidget.dart';
import 'package:my_demo_flutter_app/FlyWeight-SoldierGame/Context.dart';
import 'package:my_demo_flutter_app/FlyWeight-SoldierGame/ISoldier.dart';
import 'package:my_demo_flutter_app/FlyWeight-SoldierGame/Soldier.dart';
import 'package:my_demo_flutter_app/FlyWeight-SoldierGame/SoldierFactory.dart';
import 'package:my_demo_flutter_app/FlyWeight-SoldierGame/SoldierState.dart';
import 'package:my_demo_flutter_app/FlyWeight-SoldierGame/utils/number.dart';

class SoldierGameScreen extends StatefulWidget {
  static const routeName = '/soliderGameScreen';

  @override
  State<StatefulWidget> createState() {
    return _SoldierGameScreenState();
  }
}

class _SoldierGameScreenState extends State<SoldierGameScreen> {
  int _numberSoldierInFactory = 0;
  List<SoldierWithState> _soldierWithContexts = [];

  SoldierType _randomSoldierType() {
    var randomNumber = getRandomNumber(1, 3);
    if (randomNumber == 1) {
      return SoldierType.sniper;
    }
    if (randomNumber == 2) {
      return SoldierType.marines;
    }

    return SoldierType.others;
  }

  _createSoldier(int numberOfSoldier) {
    List<SoldierWithState> soldiers = [];
    for (int i = 1; i <= numberOfSoldier; i++) {
      var soldierType = _randomSoldierType();
      DateTime startTime = DateTime.now();
      print('start create ' + DateTime.now().toString());
      ISoldier soldier = SoldierFactory.createSoldier(soldierType);
      DateTime endTime = DateTime.now();
      print('create done ' + DateTime.now().toString());
      SoldierState context = SoldierState(soldierType.toString() + i.toString(),
          star: getRandomNumber(1, 10),
          startTime: startTime,
          createdTime: endTime);
      soldier.setExtrinsic(context);
      soldiers.add(SoldierWithState(soldier: soldier, context: context));
    }
    setState(() {
      _soldierWithContexts = [..._soldierWithContexts, ...soldiers];
      _numberSoldierInFactory = SoldierFactory.getTotalOfSoldiers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soldier'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: ElevatedButton(
                  onPressed: () {
                    _createSoldier(10);
                  },
                  child: Padding(
                      padding: EdgeInsets.all(0), child: Text('Create Random')),
                ),
              ),
              Text(
                  'Number soldier in factory: ${_numberSoldierInFactory.toString()}'),
              Text(
                  'Number soldier with context: ${_soldierWithContexts.length}'),
              AllSoldierDisplayWidget(
                soldierWithContexts: _soldierWithContexts,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SoldierWithState {
  final SoldierState context;
  final Soldier soldier;

  const SoldierWithState({this.context, this.soldier});
}
