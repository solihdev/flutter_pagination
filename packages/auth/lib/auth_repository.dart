import 'package:telephony/telephony.dart';

class AuthRepo {
  Future<void> sendSms(
      {required String number, required String signature}) async {
    await Telephony.instance.sendSms(
        to: number, message: "<#> Confirmation Code: 112233 $signature");
  }
}
