import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class Network {
  Network._();

  // - - - - - - - - - - - - - - - - - - CHECK THE INTERNET CONNECTION - - - - - - - - - - - - - - - - - -  //
  static Future<bool> hasConnection() async {
    final Connectivity connectivity = Get.find();
    final checkTheNetwork = await connectivity.checkConnectivity();
    if (checkTheNetwork == ConnectivityResult.none) {
      return false;
    }
    return true;
  }
}
