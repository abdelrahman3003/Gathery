import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'statuscode.dart';

class DataHandlingState extends StatelessWidget {
  const DataHandlingState(
      {super.key, required this.statusRequest, required this.widget});
  final StatusRequest statusRequest;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: statusRequest == StatusRequest.loading
          ? const CircularProgressIndicator()
          : widget,
    );
  }
}
