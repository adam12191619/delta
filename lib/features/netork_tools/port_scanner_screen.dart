import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:ui';

class PortScannerScreen extends StatefulWidget {
  @override
  _PortScannerScreenState createState() => _PortScannerScreenState();
}

class _PortScannerScreenState extends State<PortScannerScreen> {
  final TextEditingController _ipController = TextEditingController(text: "127.0.0.1");
  List<int> openPorts = [];
  bool isScanning = false;
  double progress = 0.0;

  // List port yang umum dicek
  final List<int> commonPorts = [21, 22, 23, 25, 53, 80, 110, 443, 3306, 8080];

  Future<void> startScan() async {
    setState(() {
      openPorts.clear();
      isScanning = true;
      progress = 0.0;
    });

    String target = _ipController.text;
    
    for (int i = 0; i < commonPorts.length; i++) {
      int port = commonPorts[i];
      try {
        final socket = await Socket.connect(target, port, timeout: Duration(milliseconds: 500));
        setState(() {
          openPorts.add(port);
        });
        socket.destroy();
      } catch (e) {
        // Port tertutup
      }
      setState(() {
        progress = (i + 1) / commonPorts.length;
      });
    }

    setState(() {
      isScanning = false;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Scan Complete! Found ${openPorts.length} open ports.")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F0F0F),
      appBar: AppBar(
        title: Text("PORT SCANNER", style: TextStyle(letterSpacing: 2, fontSize: 16)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Input Field Glassmorphism
            _buildGlassInput(),
            SizedBox(height: 20),
            
            // Progress Bar
            if (isScanning)
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.white10,
                color: Colors.cyanAccent,
              ).animate().fadeIn(),
            
            SizedBox(height: 20),
            
            // Button Scan
            ElevatedButton(
              onPressed: isScanning ? null : startScan,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyanAccent,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              child: Text(isScanning ? "SCANNING..." : "START AUDIT", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            
            SizedBox(height: 30),
            
            // Results List
            Expanded(
              child: openPorts.isEmpty && !isScanning
                  ? Center(child: Text("No open ports detected", style: TextStyle(color: Colors.white24)))
                  : ListView.builder(
                      itemCount: openPorts.length,
                      itemBuilder: (context, index) {
                        return _buildResultTile(openPorts[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlassInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white10),
      ),
      child: TextField(
        controller: _ipController,
        decoration: InputDecoration(
          hintText: "Enter Target IP (e.g. 192.168.1.1)",
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.white24),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildResultTile(int port) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.greenAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.greenAccent.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.check_circle, color: Colors.greenAccent, size: 18),
              SizedBox(width: 10),
              Text("Port $port", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          Text("OPEN", style: TextStyle(color: Colors.greenAccent, fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    ).animate().slideX(begin: 1, duration: 300.ms);
  }
}
