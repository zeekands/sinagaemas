import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinagaemas/register.dart';
import 'package:sinagaemas/services/di_service.dart';
import 'package:sinagaemas/services/network_services.dart';

import 'dashboard_page.dart';

void main() => runApp(const LoginApp());

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  Future<void> login(String email, String password) async {
    const apiUrl = 'http://sinagaemas.primasoft.co.id/api/login';

    final response = await http.post(Uri.parse(apiUrl), body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      //mengambil data token
      final token = json.decode(response.body)['authorisation']['token'];

      //mengambil data user
      final user = json.decode(response.body)['user'];

      //menyimpan data token
      prefs.setString('token', token);
      prefs.setInt('idUser', user['id']);
      httpService.setBearer(token);

      //berpindah halaman
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardPage(
            id: user['id'],
            tanggal: user['tanggal'],
            fullname: user['fullname'],
            email: user['email'],
            username: user['username'],
            role: user['role'],
            // gambar: user['gambar'],
            // gambar_asli: user['gambar_asli'],
            status: user['status'],
            token: token,
          ),
        ),
        (route) => false,
      );
    } else {
      // Notifikasi Quick Alert
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Login Gagal!',
        text: 'Silahkan Coba Lagi!',
        confirmBtnText: 'Ok',
        confirmBtnColor: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Column(
        children: [
          // Center(
          //   child: Image.asset('assets/images/logo-kota-mojokerto.png'),
          // ),
          // Center(
          //   child: Text(""),
          // ),
          // Container(
          //   width: double.infinity,
          //   height: MediaQuery.of(context).size.height * 0.20,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: NetworkImage(
          //           'https://cdn.pixabay.com/photo/2022/01/11/17/04/city-6931092_1280.jpg'), // Ganti dengan URL gambar Anda
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   'Welcome back to \nSi Naga Emas 👏',
                      //   style: TextStyle(
                      //     fontSize: 30,
                      //     fontWeight: FontWeight.bold,
                      //     // color: Colors.white,
                      //   ),
                      // ),
                      // SizedBox(height: 10),
                      Text(
                        'Sign in to continue Si Naga Emas.',
                        style: TextStyle(
                          fontSize: 18,
                          // color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        vertical:
                            16, // Ubah ukuran vertikal sesuai keinginan Anda
                        horizontal:
                            10, // Ubah ukuran horizontal sesuai keinginan Anda
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        vertical:
                            16, // Ubah ukuran vertikal sesuai keinginan Anda
                        horizontal:
                            10, // Ubah ukuran horizontal sesuai keinginan Anda
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Text(
                  //       'Forgot Password',
                  //       style: TextStyle(
                  //         fontSize: 14,
                  //         color: Colors.blue,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // SizedBox(height: 20),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        login(emailController.text, passwordController.text);
                      },
                      child: const Text('Login'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FractionallySizedBox(
                      widthFactor: 0.9,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Belum punya akun?',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Register()));
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
