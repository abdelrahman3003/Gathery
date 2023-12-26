import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  const Note({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      padding: EdgeInsets.only(top: 24, bottom: 20, left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: const Text(
                "Flutter Tips",
                style: TextStyle(color: Colors.black),
              ),
            ),
            subtitle: Text(
              "abdelrahman temsah  qena dishna  23  : mobile developer",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(.5),
              ),
            ),
            trailing: const Icon(
              Icons.delete,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("may 28 ,2000",
                style: TextStyle(
                  color: Colors.black.withOpacity(.3),
                )),
          )
        ],
      ),
    );
  }
}
