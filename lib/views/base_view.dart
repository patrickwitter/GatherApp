import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  const BaseView({
    this.onModelReady,
    required this.builder,
  });

  final Function(T)? onModelReady;
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    T model = locator<T>();
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
