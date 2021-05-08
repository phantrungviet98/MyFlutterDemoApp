import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_demo_flutter_app/FlyWeight-SoldierGame/SoldierGameScreen.dart';

class AllSoldierDisplayWidget extends StatefulWidget {
  final List<SoldierWithContext> soldierWithContexts;

  const AllSoldierDisplayWidget({this.soldierWithContexts});

  @override
  State<StatefulWidget> createState() {
    return _AllSoliderDisplayWidgetState();
  }
}

class _AllSoliderDisplayWidgetState extends State<AllSoldierDisplayWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(color: Colors.orangeAccent),
      child: ListView.builder(
          itemCount: widget.soldierWithContexts.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(children: [
                Text(
                    'Type: ${describeEnum(widget.soldierWithContexts[index].soldier.soliderType).toUpperCase()}         Star: ${widget.soldierWithContexts[index].context.star.toString()}'),
                Text(
                    'Start time: ${widget.soldierWithContexts[index].context.startTime.toString()}'),
                Text(
                    'End time: ${widget.soldierWithContexts[index].context.createdTime.toString()}')
              ]),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Colors.blueGrey))),
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(bottom: 4),
            );
            // return ListTile(
            //   title: Text(describeEnum(widget.soldierWithContexts[index].soldier.soliderType) +
            //       ' ' +
            //       widget.soldierWithContexts[index].context.star.toString() +
            //       ' ' +
            //       widget.soldierWithContexts[index].context.startTime
            //           .toString() +
            //       ' ' +
            //       widget.soldierWithContexts[index].context.createdTime
            //           .toString()),
            // );
          }),
    ));
  }
}
