import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isTablet = screenWidth > 600; // Deteksi jika perangkat adalah tablet

    return Scaffold(
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            bool isPortrait = orientation == Orientation.portrait;

            return Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    width: isTablet
                        ? 500
                        : (isPortrait ? screenWidth * 0.85 : screenWidth * 0.6),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: isPortrait
                        ? _buildPortraitUI(isTablet, screenWidth)
                        : _buildLandscapeUI(isTablet, screenWidth),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  // UI untuk mode **Portrait**
  Widget _buildPortraitUI(bool isTablet, double screenWidth) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.lock, size: isTablet ? 80 : 60, color: Colors.blue),
        SizedBox(height: 20),
        Text(
          "Login",
          style: TextStyle(
            fontSize: isTablet ? 28 : 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        _buildLoginFields(),
        SizedBox(height: 20),
        _buildLoginButton(screenWidth, isTablet),
      ],
    );
  }

  // UI untuk mode **Landscape**
  Widget _buildLandscapeUI(bool isTablet, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.lock, size: isTablet ? 80 : 60, color: Colors.blue),
              SizedBox(height: 10),
              Text(
                "Login",
                style: TextStyle(
                  fontSize: isTablet ? 28 : 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLoginFields(),
              SizedBox(height: 10),
              _buildLoginButton(screenWidth, isTablet),
            ],
          ),
        ),
      ],
    );
  }

  // Widget untuk Field Input (Email & Password)
  Widget _buildLoginFields() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: "Email",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.lock),
          ),
        ),
      ],
    );
  }

  // Widget untuk Tombol Login
  Widget _buildLoginButton(double screenWidth, bool isTablet) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text("Login"),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(screenWidth * 0.6, 50),
            textStyle: TextStyle(fontSize: isTablet ? 18 : 16),
          ),
        ),
        SizedBox(height: 10),
        TextButton(
          onPressed: () {},
          child: Text("Lupa Password?"),
        ),
      ],
    );
  }
}
