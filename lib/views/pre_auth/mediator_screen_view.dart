import 'package:flutter/material.dart';
import 'package:upc_app/viewmodels/mediatorscrenn_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';

class MediatorScreen extends StatelessWidget {
  const MediatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MediatorScreenViewModel>(builder: (context, model, child) {
      return Scaffold(
        body: model.routeUser(context),
      );
    });
  }
}
