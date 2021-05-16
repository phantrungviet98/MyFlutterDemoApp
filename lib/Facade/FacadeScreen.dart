import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_demo_flutter_app/Facade/ShopFacade.dart';

class FacadeScreen extends StatefulWidget {
  static const routeName = '/facade';

  @override
  State<StatefulWidget> createState() {
    return _FacadeScreenState();
  }
}

class _FacadeScreenState extends State<FacadeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facade'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('By Cash'),
              onPressed: () {
                ShopFacade.getInstance()
                    .buyProductByCashWithFreeShipping('myemail@gmail.com');
              },
            ),
            ElevatedButton(
              child: Text('By Paypal'),
              onPressed: () {
                ShopFacade.getInstance().buyProductByPaypalWithStandardShipping(
                    'myemail@gmail.com', '0918123456');
              },
            )
          ],
        ),
      ),
    );
  }
}
