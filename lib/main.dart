import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Dashboard App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), 
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  
  final String correctUsername = 'admin';
  final String correctPassword = '1234';

  void _login() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == correctUsername && password == correctPassword) {
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardPage(username: username),
        ),
      );
    } else {
      
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Gagal'),
          content: Text('Username atau Password salah.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  final String username;

  DashboardPage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Text(
          'Hii, Selamat datang, $username!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
