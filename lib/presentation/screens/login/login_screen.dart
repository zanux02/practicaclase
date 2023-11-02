import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practicaclase/config/widgets/custom_button.dart';
import 'package:practicaclase/presentation/provider/provider.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {

   

  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

   

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesion'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(125.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: usuarioController,
                  decoration: const InputDecoration(labelText: 'Usuario'),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Contraseña'),
                ),
                const SizedBox(height: 25),
                CustomButton(
                  onPressed: () {
                      
                    if (provider.login(usuarioController.text, passwordController.text)) {
                      context.goNamed("home");
                    } else{
                      Widget okButton = TextButton(
                          child:const  Text("OK"),
                          onPressed: () { },
                          );
                      AlertDialog alert = AlertDialog(
                        title:const  Text("ERROR"),
                        content:const Text("usuario y contraseña incorrecta"),
                        actions: [
                          okButton,
                        ],
                      );
                      showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return alert;
                      },
                      );
                    }
                  },
                  text: 'Login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

