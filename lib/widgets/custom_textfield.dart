import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.ctrlr,
    this.validateFunc,
    required this.hintString,
    required this.labelString,
  }) : super(key: key);

  final TextEditingController? ctrlr;
  final String? Function(String? p1)? validateFunc;
  final String hintString;
  final String labelString;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor: Theme.of(context).colorScheme.tertiary,
        style: Theme.of(context).textTheme.headline5,
        controller: ctrlr,
        decoration: InputDecoration(
          hintText: hintString,
          labelText: labelString,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          labelStyle: Theme.of(context).textTheme.subtitle1,
        ),
        validator: validateFunc,
      ),
    );
  }
}
