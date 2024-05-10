import 'package:get/get.dart';

abstract class VoteController extends GetxController {
  onVote(int option);
  getTotalVotes();
}

class VoteControllerImp extends VoteController {
  int? totalaVote;
  bool isVote = false;
  int optionLength = 5;
  List<int>? votes;
  @override
  void onInit() {
    votes = [2, 0, 1, 0, 0];
    totalaVote = 0;
    getTotalVotes();
    super.onInit();
  }

  @override
  onVote(int option) {
    votes![option]++;
    isVote = true;
    totalaVote = totalaVote! + 1;
    update();
  }

  @override
  getTotalVotes() {
    for (var i = 0; i < votes!.length; i++) {
      totalaVote = totalaVote! + votes![i];
    }
  }
}
