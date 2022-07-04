import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  Leaderboard({Key? key}) : super(key: key);

  final List list = List.generate(1000, (index) {
    return {
      "id": index + 1,
      "title": "This is the title $index",
      "subtitle": "This is the subtitle $index"
    };
  });

  handleColorCircle(position) {
    switch (position) {
      case 1:
        return const Color.fromRGBO(255, 207, 77, 1);
      case 2:
        return const Color.fromRGBO(170, 174, 170, 1);
      case 3:
        return const Color.fromRGBO(176, 145, 91, 1);
      default:
        return Colors.white;
    }
  }

  handleTextColor(position) {
    return position < 2
        ? const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
        : const TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => Card(
            semanticContainer: true,
            elevation: 6,
            color: const Color.fromRGBO(14, 25, 43, 1),
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: handleColorCircle(list[index]["id"]),
                child: Text(
                  list[index]["id"].toString(),
                  style: handleTextColor(
                    list[index]["id"],
                  ),
                ),
              ),
              title: Text(list[index]["title"],
                  style: const TextStyle(
                      color: Color.fromRGBO(171, 191, 236, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              subtitle: Text(list[index]["subtitle"],
                  style: const TextStyle(
                      color: Color.fromRGBO(171, 191, 236, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
              /*    trailing: const Icon(Icons.add_a_photo), */
            )),
      ),
    );
  }
}
