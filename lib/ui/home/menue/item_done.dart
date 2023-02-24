import 'package:flutter/material.dart';

import '../../item_list_model.dart';

class ItemDone extends StatelessWidget {
  ItemModel item;
  ItemDone(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.13,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 10,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8)),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.green
                  ),
                ),
                Text(
                  item.description,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.green
                  ),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          const Text(
            'Done!',
            style: TextStyle(fontSize: 22,
              color: Colors.green,),
          ),
        ],
      ),
    );;
  }
}
