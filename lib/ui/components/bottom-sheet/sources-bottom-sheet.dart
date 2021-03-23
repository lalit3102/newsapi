import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squareboatlalit/model/item-model.dart';

class SourcesBottomSheet extends StatefulWidget {
  final List<ItemModel> initialModel;

  const SourcesBottomSheet({Key key, this.initialModel}) : super(key: key);

  @override
  _SourcesBottomSheetState createState() => _SourcesBottomSheetState();
}

class _SourcesBottomSheetState extends State<SourcesBottomSheet> {
  List<ItemModel> model = [
    ItemModel("BBC NEWS", "bbc-news", isSelected: false),
    ItemModel("Google News", "google-news", isSelected: false),
    ItemModel("RTL Nieuws", "rtl-nieuws", isSelected: false),
    ItemModel("Times of India", "the-times-of-india", isSelected: false),
    ItemModel("Reuters", "reuters", isSelected: false),
    ItemModel("RT", "rt", isSelected: false),
    ItemModel("News24", "news24", isSelected: false)
  ];

  List<String> sources = [];

  @override
  void initState() {
    super.initState();
    if (widget.initialModel != null) {
      model = widget.initialModel;
    }
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
                .map((e) => CheckboxListTile(
                    title: Text(e.name),
                    value: e.isSelected,
                    onChanged: (val) {
                      setState(() {
                        e.isSelected = val;
                      });
                      if (val) {
                        sources.add(e.val);
                      } else {
                        sources.remove(e.val);
                      }
                    }))
                .toList(),
          ),
          SizedBox(height: 16),
          FlatButton(
            onPressed: () {
              String val;
              if (sources.isNotEmpty) {
                for (var i in sources) {
                  if (val != null) {
                    val = "$val,$i";
                  } else {
                    val = "$i";
                  }
                }
              }
              Map<String, dynamic> map = {
                "val": val,
                "model": model,
              };
              Get.back(result: map);
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
