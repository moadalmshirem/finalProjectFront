import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget({
    super.key,
    required this.title,
    required this.trailing,
    required this.oniconTapped,
  });

  final String title;
  final Widget? trailing;
  final Function oniconTapped;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Card(
          color: Colors.grey.shade100,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, right: 6, left: 6),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(
                      title,
                      style: TextStyle(fontFamily: "Cairo"),
                      textDirection: TextDirection.rtl,
                    ),
                    trailing: InkWell(
                      child: trailing,
                      onTap: () => oniconTapped(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
