import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  final VoidCallback onTap;

  const EmptyScreen({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.assignment_late_sharp, size: 64, color: Theme.of(context).primaryColor,),
          SizedBox(height: 16),
          Text("There's nothing here right now",
              style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }
}
