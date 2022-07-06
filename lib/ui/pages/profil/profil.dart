import 'package:flutter/material.dart';

import '../../../data/entities/user/user.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key, TriviaUser? user}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  TriviaUser user = TriviaUser(
    id: 1,
    score: 2,
    pseudo: "pseudo",
    avatar: "avatar",
    games: 3,
  );

  TextStyle styleLabel = const TextStyle(
      color: Color.fromRGBO(187, 203, 236, 1),
      fontSize: 16,
      fontWeight: FontWeight.bold);

/*   final ButtonStyle flatButtonStyle = TextButton(
    style: (
      primary: Colors.black87,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      )),
  );
 */
  final TextEditingController _pseudoController = TextEditingController();

  void handleChangePseudo(pseudo) {
    setState(() {
      user.pseudo = pseudo;
    });

    user.setPseudo(pseudo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profil',
              style: TextStyle(
                  color: Color.fromRGBO(187, 203, 236, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.edit,
                color: Color.fromRGBO(187, 203, 236, 1),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) => SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Column(
                        children: [
                          const Text(
                            'Modifier mon profil',
                            style: TextStyle(
                                color: Color.fromRGBO(187, 203, 236, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Pseudo',
                              ),
                              controller: _pseudoController),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              handleChangePseudo(_pseudoController.text);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith((states) {
                                // If the button is pressed, return green, otherwise blue
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.green;
                                }
                                return Colors.black;
                              }),
                            ),
                            child: const Text('Valider'),
                          ),
                        ]
                            .map((e) => Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: e,
                                ))
                            .toList(),
                      )),
                );
              },
            ),
          ],
        ),
        body: Center(
            child: Column(children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.brown.shade800,
            radius: 24,
            child: const Text('AH'),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text("Nom d'utilisateur : ${user.pseudo}",
                  style: styleLabel)),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text("Best Score : ${user.score}", style: styleLabel)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text("Nombre de parties : ${user.games}", style: styleLabel),
          )
        ])));
  }
}
