import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:omega_evaluation_project/ui/widgets/error_util.dart';

class LoadingView extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback onReset;
  final Object error;

  const LoadingView(
      {Key key, @required this.onPressed, this.error, this.onReset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String msg = ErrorUtil.errorToMessage(error, context);
    IconData iconData =
        (error is SocketException) ? Icons.signal_wifi_off : Icons.warning;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            size: 32,
            color: Theme.of(context).accentColor,
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            msg, //
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subhead,
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: onReset != null
                    ? RaisedButton.icon(
                        onPressed: () {
                          onReset();
                        },
                        icon: Icon(Icons.settings),
                        label: Text("تنظیم مجدد"),
                      )
                    : Container(),
              ),
              RaisedButton.icon(
                onPressed: onPressed,
                icon: Icon(Icons.refresh),
                label: Text('تلاش مجدد'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
