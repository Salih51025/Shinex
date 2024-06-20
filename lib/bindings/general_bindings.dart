import 'package:get/get.dart';
import 'package:shinex/utils/helpers/network_menager.dart';

class GeneralBindigs extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkMenager());
  }
}
