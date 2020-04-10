import 'dart:async';

import 'package:flutter/material.dart';

const Duration _snackBarDisplayDuration = Duration(milliseconds: 5000);

class SnackBarMixin {
  void showWarningSnackBar(BuildContext context, String message,
      String actionMessage, VoidCallback action) {
    SnackBarAction snackBarAction = SnackBarAction(
      label: actionMessage,
      onPressed: action,
      textColor: Colors.white,
    );
    SnackBar snackBar = SnackBar(
      duration: _snackBarDisplayDuration,
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: Theme.of(context).textTheme.body1.copyWith(
              color: Colors.white,
            ),
      ),
      action: snackBarAction,
      backgroundColor: Colors.orangeAccent,
    );
    _onWidgetDidBuild(() {
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  void showWarningSnackBarWithoutAction(BuildContext context, String message) {
    SnackBar snackBar = SnackBar(
      duration: _snackBarDisplayDuration,
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: Theme.of(context).textTheme.body1.copyWith(
              color: Colors.white,
            ),
      ),
      backgroundColor: Colors.orangeAccent,
    );
    _onWidgetDidBuild(() {
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  void showSuccessSnackBar(BuildContext context, String message,
      String actionMessage, VoidCallback action) {
    SnackBarAction snackBarAction = SnackBarAction(
      label: actionMessage,
      onPressed: action,
      textColor: Colors.white,
    );
    SnackBar snackBar = SnackBar(
      duration: _snackBarDisplayDuration,
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: Theme.of(context).textTheme.body1.copyWith(
              color: Colors.white,
            ),
      ),
      action: snackBarAction,
      backgroundColor: Colors.green,
    );
    _onWidgetDidBuild(() {
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  Future<SnackBarClosedReason> showSuccessSnackBarWithoutAction(
      BuildContext context, String message) {
    SnackBar snackBar = SnackBar(
      duration: _snackBarDisplayDuration,
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: Theme.of(context).textTheme.body1.copyWith(
              color: Colors.white,
            ),
      ),
      backgroundColor: Colors.green,
    );
    Completer<SnackBarClosedReason> closedComplater = Completer();
    _onWidgetDidBuild(() {
      closedComplater
          .complete(Scaffold.of(context).showSnackBar(snackBar).closed);
    });
    return closedComplater.future;
  }

  Future<SnackBarClosedReason> showFailureSnackBar(BuildContext context,
      String message, String actionMessage, VoidCallback action,
      {bool infinite = false}) {
    SnackBarAction snackBarAction = SnackBarAction(
      label: actionMessage,
      onPressed: action,
      textColor: Colors.white,
    );
    SnackBar snackBar = SnackBar(
      duration: infinite ? Duration(days: 365) : _snackBarDisplayDuration,
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: Theme.of(context).textTheme.body1.copyWith(
              color: Colors.white,
            ),
      ),
      action: snackBarAction,
      backgroundColor: Colors.red,
    );
    Completer<SnackBarClosedReason> closedComplater = Completer();
    _onWidgetDidBuild(() {
      closedComplater
          .complete(Scaffold.of(context).showSnackBar(snackBar).closed);
    });
    return closedComplater.future;
  }

  void showFailureSnackBarWithoutAction(BuildContext context, String message) {
    SnackBar snackBar = _getFailureSnackBar(message, context);
    _onWidgetDidBuild(() {
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  void showFailureSnackBarWithoutActionSync(
      BuildContext context, String message) {
    SnackBar snackBar = _getFailureSnackBar(message, context);
    Scaffold.of(context).showSnackBar(snackBar);
  }

  SnackBar _getFailureSnackBar(String message, BuildContext context) {
    SnackBar snackBar = SnackBar(
      duration: _snackBarDisplayDuration,
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: Theme.of(context).textTheme.body1.copyWith(
              color: Colors.white,
            ),
      ),
      backgroundColor: Colors.red,
    );
    return snackBar;
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}
