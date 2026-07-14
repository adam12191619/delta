import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(DeltaApp());
}

class DeltaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delta Multitool',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.cyan,
        textTheme: GoogleFonts.lexendTextTheme(ThemeData.dark().textTheme),
      ),
      home: DisclaimerScreen(), // Mulai dari peringatan dulu 🗿
    );
  }
}

// --- SCREEN 1: DISCLAIMER ---
class DisclaimerScreen extends StatefulWidget {
  @override
  _DisclaimerScreenState createState() => _DisclaimerScreenState();
}

class _DisclaimerScreenState extends State<DisclaimerScreen> {
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F0F0F), Color(0xFF1A1A2E)],
            begin: Alignment.topLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.gavel_rounded, size: 80, color: Colors.redAccent).animate().shake(),
            SizedBox(height: 30),
            Text("LEGAL NOTICE", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 2, color: Colors.redAccent)),
            SizedBox(height: 20),
            Container(
              height: 200,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(15),
              ),
              child: SingleChildScrollView(
                child: Text(
                  "1. This app is for educational and auditing purposes only.\n"
                  "2. Use it only on networks/devices you own or have permission to test.\n"
                  "3. The developer is not responsible for any misuse or legal issues.\n"
                  "4. You must be 18+ to use these features.\n"
                  "5. Improper use may result in system instability.",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(value: isAgreed, onChanged: (val) => setState(() => isAgreed = val!)),
                Text("I accept all risks and terms", style: TextStyle(fontSize: 12)),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: isAgreed ? () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainDashboard())) : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("ACCESS GRANTED", style: TextStyle(color: Colors.white)),
            ),
          ],
        ).animate().fadeIn(duration: 800.ms),
      ),
    );
  }
}

// --- SCREEN 2: DASHBOARD (UI YANG MEMANJAKAN MATA) ---
class MainDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F0F0F),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome to", style: TextStyle(color: Colors.white54)),
                      Text("DELTA CONSOLE", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.cyanAccent)),
                    ],
                  ),
                  CircleAvatar(backgroundColor: Colors.cyanAccent, child: Icon(Icons.person, color: Colors.black)),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(20),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  _buildToolCard("Port Scanner", Icons.radar, Colors.blue),
                  _buildToolCard("Network Map", Icons.hub_outlined, Colors.purple),
                  _buildToolCard("Device Info", Icons.developer_mode, Colors.green),
                  _buildToolCard("Exif Remover", Icons.no_photography_outlined, Colors.orange),
                  _buildToolCard("Cipher Vault", Icons.enhanced_encryption, Colors.teal),
                  _buildToolCard("App Manager", Icons.apps, Colors.pink),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolCard(String title, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color).animate().scale(delay: 200.ms),
          SizedBox(height: 15),
          Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    ).animate().fadeIn().slideY(begin: 0.2);
  }
}
