import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

TextEditingController userController = TextEditingController();
TextEditingController passController = TextEditingController();
String user = "Kris";
String pass = "banana";
String message = "Inicie sesión."; 

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
                ),
                const Text(
                 "$message",  style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                 )),
              TextField(
                controller: userController,
                decoration: const InputDecoration(
                  hintText: 'Nombre de usuario',
                  icon: Icon(Icons.person)
                  ),
              ),
              TextField(
                controller: passController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Contraseña',
                  icon: Icon(Icons.key)
                  ),
              ),
              const SizedBox(height: 22),
              ElevatedButton(
                onPressed: (){
                  if(userController.text == user && passController.text == pass){
                    context.go('/home/${userController.text}');
                  }
                  else if(userController.text == '' && passController.text == ''){
                    String message = 'Usuario y Contraseña sin completar';
                  }
                  else if(userController.text == ''){
                    String message = 'Usuario sin completar';
                  }
                  else if(passController.text == ''){
                    String message = 'Contraseña sin completar';
                  }
                  else if(userController.text != user){
                    String message = 'Usuario o Contraseña incorrecto';
                  }
                  else if(passController.text != pass){
                    String message = 'Usuario o Contraseña incorrecto';
                  }
                }, 
                child: const Text("Login")
              ),
            ],
          )
        )
    );
  }
}