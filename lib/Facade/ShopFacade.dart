import 'package:my_demo_flutter_app/Facade/services/AccountService.dart';
import 'package:my_demo_flutter_app/Facade/services/EmailServices.dart';
import 'package:my_demo_flutter_app/Facade/services/PaymentService.dart';
import 'package:my_demo_flutter_app/Facade/services/ShippingService.dart';
import 'package:my_demo_flutter_app/Facade/services/SmsService.dart';

class ShopFacade {

  static final ShopFacade _uniqueInstance = new ShopFacade();

  AccountService accountService = new AccountService();
  PaymentService paymentService = new PaymentService();
  ShippingService shippingService = new ShippingService();
  EmailService emailService = new EmailService();
  SmsService smsService = new SmsService();

  static ShopFacade getInstance() {
    return _uniqueInstance;
  }

  void buyProductByCashWithFreeShipping(String email) {
    print('------------------buyProductByCashWithFreeShipping--------------------');
    String result1 = accountService.getAccount(email);
    print(result1);
    String result2 = paymentService.paymentByCash();
    print(result2);
    String result3 = shippingService.freeShipping();
    print(result3);
    String result4 = emailService.sendMail(email);
    print(result4);
    print('----------------------------------------------------------------------');
  }

  void buyProductByPaypalWithStandardShipping(String email, String mobilePhone) {
    print('------------------buyProductByPaypalWithStandardShipping--------------------');
    String result1 = accountService.getAccount(email);
    print(result1);
    String result2 = paymentService.paymentByPaypal();
    print(result2);
    String result3 = shippingService.standardShipping();
    print(result3);
    String result4 = emailService.sendMail(email);
    print(result4);
    String result5 = smsService.sendSMS(mobilePhone);
    print(result5);
    print('----------------------------------------------------------------------');
  }
}