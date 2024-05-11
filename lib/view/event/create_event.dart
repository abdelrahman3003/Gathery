
import 'package:flutter/material.dart';
import 'package:note_app/controller/event_controller.dart';
import 'package:note_app/core/constatnt/data_handilng.dart';
import 'package:get/get.dart';
import 'package:note_app/view/event/widget/create_event/create_event_view_body.dart';


class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CeateEventControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Create Event",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<CeateEventControllerImp>(builder: (controller) {
          return DataHandlingState(
              statusRequest: controller.statusRequest,
              widget: CreateEventViewBody());
        }));
  }
}
