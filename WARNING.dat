import 'package:flutter/material.dart';

class DisclaimerPage extends StatefulWidget {
  @override
  _DisclaimerPageState createState() => _DisclaimerPageState();
}

class _DisclaimerPageState extends State<DisclaimerPage> {
  bool _isEighteen = false;
  bool _hasReadToS = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Logic: Tombol baru aktif kalau sudah scroll ke bawah
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        setState(() => _hasReadToS = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212), // Deep Charcoal
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF1A1A2E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Text("LEGAL MANDATE", style: TextStyle(color: Colors.cyan, fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: 2)),
              Text("Read carefully before proceeding.", style: TextStyle(color: Colors.white70, fontSize: 14)),
              SizedBox(height: 30),
              
              // Age Verification Card
              _buildModernCard(
                child: Row(
                  children: [
                    Checkbox(
                      value: _isEighteen,
                      onChanged: (val) => setState(() => _isEighteen = val!),
                      activeColor: Colors.cyan,
                    ),
                    Text("I confirm that I am 18 years of age or older", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              
              SizedBox(height: 20),

              // ToS Box
              Expanded(
                child: _buildModernCard(
                  child: Scrollbar(
                    controller: _scrollController,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Text(
                        "TERMS OF SERVICE\n\n"
                        "1. Ethical Use Only: This application is designed for educational purposes, security auditing, and authorized system testing.\n\n"
                        "2. No Liability: The developer is NOT responsible for any misuse, data loss, or legal consequences arising from the use of this tool.\n\n"
                        "3. User Responsibility: You agree not to use this tool for illegal activities, including but not limited to unauthorized access to private networks.\n\n"
                        "4. Local Laws: You are responsible for complying with the cyber laws in your jurisdiction.\n\n"
                        "[SCROLL TO THE END TO ACCEPT]",
                        style: TextStyle(color: Colors.white60, fontSize: 13, height: 1.5),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Action Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: (_isEighteen && _hasReadToS) ? Colors.cyan : Colors.grey[800],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: (_isEighteen && _hasReadToS) ? () {
                    // Masuk ke Dashboard Utama
                  } : null,
                  child: Text("I UNDERSTAND & AGREE", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModernCard({required Widget child}) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: child,
    );
  }
}
