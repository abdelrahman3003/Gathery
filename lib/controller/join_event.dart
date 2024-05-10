import 'package:get/get.dart';

abstract class JoinEventController extends GetxController {
  changePage();
}

class JoinEventControllerImp extends JoinEventController {
  bool isJoined = true;
  bool test = true;
  @override
  changePage() {
    isJoined = !isJoined;
    update();
  }
}
