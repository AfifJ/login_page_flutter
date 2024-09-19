import 'package:flutter/material.dart';
import 'package:login_page/components/custom_button.dart';
import 'package:login_page/login_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  static const List<String> fitur = ["Login", "Logout"];

  void _logout(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          title: const Text("Konfirmasi Logout",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center),
          content: const Text(
            "Apakah anda yakin akan logout? Anda harus login lagi nanti.",
            textAlign: TextAlign.center,
          ),
          actions: [
            Row(
              children: [
                CustomButton(
                  isOutlined: true,
                  text: "Batal",
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
                const SizedBox(width: 12),
                CustomButton(
                  text: "Logout",
                  backgroundColor: Colors.red.shade900,
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    _logout(context); // Proceed with logout
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                margin: const EdgeInsets.all(16),
                constraints: const BoxConstraints(maxWidth: 500),
                child: Scaffold(
                  body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Text("Dashboard",
                            style: TextStyle(
                                fontSize: 36, fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 60,
                        ),
                        Text(
                          "Selamat datang di menu kita",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              height: 1),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: const Text(
                            "List Fitur:",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: fitur.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Text(
                                ((index + 1).toString() + ' ' + fitur[index]),
                                style: const TextStyle(fontSize: 16),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        const Row(children: [
                          Expanded(child: Divider()),
                          SizedBox(width: 10),
                          Text("atau"),
                          SizedBox(width: 10),
                          Expanded(child: Divider()),
                        ]),
                        const SizedBox(height: 20),
                        CustomButton(
                            text: "Logout",
                            backgroundColor: Colors.red[900],
                            icon: Icons.logout,
                            onPressed: () => _confirmLogout(context)),
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                color: Colors.red,
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                color: Colors.green,
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ),
                      ]),
                ))));
  }
}
