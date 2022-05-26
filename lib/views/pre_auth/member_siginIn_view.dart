import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:upc_app/views/base_view.dart';
import 'package:upc_app/viewmodels/member_sigin_viewmodel.dart';

class MemeberSigIn extends StatelessWidget {
  const MemeberSigIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MemeberSigInViewModel>(builder: (context, model, child) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("lib/assets/images/SignInImage.jpg"),
                opacity: .5,
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "UPC Gather App",
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 30.h,
                    bottom: 10,
                  ),
                  child: MainButton(
                    action: () => model.signIn(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.action,
  }) : super(key: key);

  final Function() action;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 30,
      ),
      width: 75.w,
      decoration: BoxDecoration(
          border: Border.all(
        color: Theme.of(context).colorScheme.outline,
      )),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Theme.of(context).colorScheme.secondary,
        ),
        child: Text(
          "Member Sign In",
          style: Theme.of(context).textTheme.headline3,
        ),
        onPressed: action,
      ),
    );
  }
}
