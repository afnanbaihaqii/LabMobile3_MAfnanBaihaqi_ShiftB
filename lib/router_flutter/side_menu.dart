import 'package:flutter/material.dart';
import 'package:afnan/router_flutter/home_page.dart';
import 'about_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class Sidemenu extends StatelessWidget {
  const Sidemenu({Key? key}) : super(key: key);

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Mebelku', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            accountEmail: const Text('mebel.ku@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('mabel_banner.jpg'),
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.blueGrey],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.blue),
            title: const Text('Home', style: TextStyle(fontWeight: FontWeight.w500)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.orange),
            title: const Text('About', style: TextStyle(fontWeight: FontWeight.w500)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
          const Divider(thickness: 1, color: Colors.grey),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(fontWeight: FontWeight.w500)),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                  '/'
              );
            },
          ),
        ],
      ),
    );
  }
}
