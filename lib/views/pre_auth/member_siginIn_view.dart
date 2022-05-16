import 'package:flutter/material.dart';
import 'package:upc_app/views/base_view.dart';
import 'package:upc_app/viewmodels/member_sigin_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';

class MemeberSigIn extends StatelessWidget {
  const MemeberSigIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MemeberSigInViewModel>(builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/assets/images/SignInImage.jpg"),
                  opacity: .5,
                  fit: BoxFit.fitHeight),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "UPC Gather App",
                    style: TextStyle(
                      fontFamily: "WaterBrush",
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height.toDouble() * .3),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    width: MediaQuery.of(context).size.width.toDouble() * .75,
                    decoration: BoxDecoration(border: Border.all()),
                    child: TextButton(
                      style: TextButton.styleFrom(primary: Colors.grey),
                      child: Text(
                        "Member Sign In",
                        style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () => model.signIn(),
                    ),
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
