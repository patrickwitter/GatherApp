import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upc_app/viewmodels/notificationAdminView_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';

class NotificationAdminPage extends StatelessWidget {
  const NotificationAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<NotificationAdminView_ViewModel>(
        builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color(0xFFf8f8f8),
          title: Text(
            "Notifcations",
            style: GoogleFonts.lato(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            model.getnotifcations(),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black.withOpacity(0.8),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: model.notiCtrlr,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "type a message",
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.6)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        model.sendNoti();
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
