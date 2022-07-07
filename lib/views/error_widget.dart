import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    this.details,
    this.errordetails = "Unknown Error has Occurred",
    Key? key,
  }) : super(key: key);

  final FlutterErrorDetails? details;
  final String errordetails;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Material(
        child: Container(
          color: theme.scaffoldBackgroundColor,
          child: Padding(
            padding: EdgeInsets.all(2.w),
            child: SizedBox(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          minHeight: 5.w,
                          minWidth: 5.w,
                          maxHeight: 200,
                          maxWidth: 200,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: theme.scaffoldBackgroundColor,
                          image: DecorationImage(
                            image: AssetImage(
                                "lib/assets/images/playstoreImage.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Text(
                        'An error occurred',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headline5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: Text(
                          details == null
                              ? errordetails
                              : details!.exceptionAsString(),
                          textAlign: TextAlign.center,
                          style: theme.textTheme.subtitle1,
                        ),
                      ),
                      Divider(
                        color: theme.primaryColor,
                        thickness: 0.2,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: Text(
                          'Please restart your application and if error still occurs, contact\n\n Patrick Witter by email:\n\nwitter10042001@gmail.com',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headline5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
