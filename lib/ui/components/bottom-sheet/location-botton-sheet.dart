import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squareboatlalit/model/item-model.dart';

class LocationBottomSheet extends StatefulWidget {
  final ItemModel initalModel;

  const LocationBottomSheet({Key key, this.initalModel}) : super(key: key);

  @override
  _LocationBottomSheetState createState() => _LocationBottomSheetState();
}

class _LocationBottomSheetState extends State<LocationBottomSheet> {
  final List<ItemModel> model = [
    ItemModel("Argentina", "ar"),
    ItemModel("Greece", "gr"),
    ItemModel("Netherlands", "nl"),
    ItemModel("India", "in"),
    ItemModel("Australia", "au"),
    ItemModel("UAE", "ae"),
    ItemModel("South Africa", "za")
  ];

  String groupValue = "India";
  ItemModel selected = ItemModel("India", "in");

  @override
  void initState() {
    super.initState();
    selected = widget.initalModel;
    groupValue = selected.name;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: model
                .map((e) => RadioListTile(
                    title: Text(e.name),
                    value: e.name,
                    groupValue: groupValue,
                    onChanged: (val) {
                      setState(() {
                        groupValue = val;
                        selected = e;
                      });
                    }))
                .toList(),
          ),
          SizedBox(height: 16),
          FlatButton(
            onPressed: () {
              Get.back(result: selected);
            },
            child: Text(
              "APPLY",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          )
        ],
      ),
    );
  }
}
