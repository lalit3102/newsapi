import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final VoidCallback onTap;

  const ErrorScreen({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 64),
          SizedBox(height: 16),
          Text("Something went wrong",
              style: Theme.of(context).textTheme.headline6),
          SizedBox(height: 16),
          FlatButton(onPressed: onTap, child: Text("TRY AGAIN"))
        ],
      ),
    );
  }
}
