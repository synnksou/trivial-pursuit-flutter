import 'dart:io';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trivial_pursuit_flutter/data/entities/user/user.dart';
import 'package:trivial_pursuit_flutter/data/repositeries/autb_repository.dart';
import 'package:trivial_pursuit_flutter/data/repositeries/user_repository.dart';
import 'package:trivial_pursuit_flutter/ui/pages/signup/bloc/signup_cubit.dart';
import 'package:uuid/uuid.dart';

import 'bloc/signup_state.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _pseudoController = TextEditingController();
  SignupCubit? cubit;
  XFile? _image;

  ImagePicker picker = ImagePicker();

  Future getImage() async {
    _image = await picker.pickImage(source: ImageSource.gallery);

    _image ??= '' as XFile?;
  }

  Widget? getChild() {
    if (_image != null) {
      return CircleAvatar(
          backgroundImage: Image.file(
        File(_image!.path.toString()),
        fit: BoxFit.cover,
      ).image);
    } else {
      return const CircleAvatar(
        backgroundColor: Colors.black,
      );
    }
  }

  TextStyle styleLabel = const TextStyle(
      color: Color.fromRGBO(187, 203, 236, 1),
      fontSize: 16,
      fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Signup',
              style: TextStyle(
                  color: Color.fromRGBO(187, 203, 236, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        body: MultiRepositoryProvider(
            providers: [
              RepositoryProvider<UserRepository>(
                create: (_) => UserRepository.getInstance(),
              ),
              RepositoryProvider<AuthRepository>(
                create: (_) => AuthRepository.getInstance(),
              ),
            ],
            child: BlocProvider(
                create: (context) {
                  cubit = SignupCubit(
                    authRepository:
                        RepositoryProvider.of<AuthRepository>(context),
                    userRepository:
                        RepositoryProvider.of<UserRepository>(context),
                  );
                  return cubit!;
                },
                child: BlocConsumer<SignupCubit, SignupState>(
                  listener: (context, state) {
                    if (state is Error) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                            const SnackBar(
                              content: Text("error"),
                            ),
                          )
                          .closed
                          .then((value) => {});
                    }

                    if (state is Loading) {
                      //chargement d'ecren de chargement
                      /*     setState(() {
                        displayLoader = true
                      }); */
                    }
                    if (state is Saved) {
                      // Navigator.of(context).pop();
                      //chargement d'ecren de chargement
                      context.beamToNamed('/home', beamBackOnPop: true, popBeamLocationOnPop: true);
                    }
                  },
                  builder: (context, state) {
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: styleLabel,
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              cursorColor: Colors.white),
                          TextField(
                              controller: _pseudoController,
                              decoration: InputDecoration(
                                labelText: 'Pseudo',
                                labelStyle: styleLabel,
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              cursorColor: Colors.white),
                          TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: styleLabel,
                                fillColor: Colors.white,
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              cursorColor: Colors.white),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 50.0,
                            child: InkWell(
                              onTap: getImage,
                              child: getChild(),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              var email = _emailController.text;
                              var password = _passwordController.text;
                              var uuid = const Uuid();
                              var user = TriviaUser(
                                  id: uuid.v1(),
                                  score: 0,
                                  games: 0,
                                  pseudo: _pseudoController.text,
                                  avatar: "");

                              cubit!
                                  .registerUser(email, password, user, _image!);
                            },
                            child: const Text("S'enregistrer"),
                          ),
                        ],
                      ),
                    );
                  },
                ))));
  }
}
