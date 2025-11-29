import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();
  final passController = TextEditingController();
  String error = "";

  void login() {
    if (userController.text == "etudiant" && passController.text == "1234") {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() => error = "Identifiants incorrects");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
  child: Container(
    color: const Color(0xFFF4EFFF), 
    child: Image.asset(
      "assets/images/background.jpg",
      fit: BoxFit.contain, 
    ),
  ),
),


          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: 320,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 10),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Study",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        TextSpan(
                          text: "Buddy",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller: userController,
                    decoration: const InputDecoration(
                      label: Text("Utilisateur"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),

                  TextField(
                    controller: passController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text("Mot de passe"),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  if (error.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Text(error, style: const TextStyle(color: Colors.red)),
                  ],

                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                    ),
                    child: const Text("Se connecter"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}  

