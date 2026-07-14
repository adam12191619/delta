import 'package:flutter/material.dart';
import 'dart:ui'; // Untuk efek Blur/Glassmorphism

class MainDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F0F0F),
      body: Stack(
        children: [
          // 1. Background Animasi (Simple Gradient)
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(-0.8, -0.6),
                colors: [Colors.blueAccent.withOpacity(0.1), Colors.transparent],
                radius: 1.5,
              ),
            ),
          ),
          
          // 2. Main Content
          SafeArea(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                // Header Cantik
                SliverAppBar(
                  expandedHeight: 120,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("SYSTEM ACTIVE", style: TextStyle(color: Colors.greenAccent, fontSize: 10, fontWeight: FontWeight.bold)),
                        Text("GrayPulse Console", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      ],
                    ),
                  ),
                ),

                // Statistik Real-time (Glass Card)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: _buildStatCard(),
                  ),
                ),

                // Grid Fitur Utama
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.1,
                    ),
                    delegate: SliverChildListDelegate([
                      _buildMenuCard("Network Auditor", Icons.radar, Colors.cyan),
                      _buildMenuCard("App Analyzer", Icons.Source, Colors.purpleAccent),
                      _buildMenuCard("Cipher Engine", Icons.lock_outline, Colors.orangeAccent),
                      _buildMenuCard("System Tweak", Icons.settings_input_component, Colors.redAccent),
                      _buildMenuCard("Privacy Shield", Icons.security_rounded, Colors.greenAccent),
                      _buildMenuCard("Cloud Sync", Icons.cloud_done_outlined, Colors.blueAccent),
                    ]),
                  ),
                ),
                
                SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk Card Statistik
  Widget _buildStatCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            border: Border.all(color: Colors.white10),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _statItem("RAM", "42%", Colors.blue),
              _statItem("TEMP", "38°C", Colors.orange),
              _statItem("NET", "12ms", Colors.green),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: Colors.white54, fontSize: 12)),
        SizedBox(height: 5),
        Text(value, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }

  // Widget untuk Tombol Menu
  Widget _buildMenuCard(String title, IconData icon, Color color) {
    return InkWell(
      onTap: () {}, // Masuk ke fitur
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.03),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            SizedBox(height: 12),
            Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
