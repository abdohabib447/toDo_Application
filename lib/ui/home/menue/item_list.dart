import 'package:flutter/material.dart';
import 'package:to_do_app/ui/item_list_model.dart';

class Item extends StatelessWidget {
  ItemModel item;
  Item(this.item);
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
                color: Theme.of(context).primaryColor,
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
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  item.description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          ElevatedButton(
            style: const ButtonStyle(
              shape: MaterialStatePropertyAll(StadiumBorder(
                  side: BorderSide(width: 4, color: Colors.transparent))),
            ),
            onPressed: () {},
            child: const Icon(
              Icons.check,
              size: 50,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
