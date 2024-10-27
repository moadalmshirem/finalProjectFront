import 'package:flutter/material.dart';

class Reservation extends StatelessWidget {
  const Reservation({super.key});

  @override
  Widget build(BuildContext context) {
    void _showMessage(BuildContext context, String message) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    return Container(
      height: 250,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'خيارات الحجز',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w300,
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close))
            ],
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text(
              'تأكيد الحجز ',
              style: TextStyle(fontFamily: "Cairo"),
            ),
            onTap: () {
              Navigator.pop(context);
              _showMessage(context, 'تم تأكيد الحجز بنجاح ');
            },
          ),
        ],
      ),
    );
  }
}
