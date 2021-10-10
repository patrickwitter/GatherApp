import 'package:flutter/material.dart';
import 'package:upc_app/views/base_view.dart';
import 'package:upc_app/viewmodels/member_sigin_viewmodel.dart';

class MemeberSigIn extends StatelessWidget {
  const MemeberSigIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MemeberSigInViewModel>(builder: (context, model, child) {
      return Scaffold();
    });
  }
}
