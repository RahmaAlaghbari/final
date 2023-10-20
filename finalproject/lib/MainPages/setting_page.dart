import 'package:flutter/material.dart';
import 'contact_us.dart';

import 'login_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _selectedIndex = 0;
  bool isNotificationEnabled = true;

  void _selectItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Settings'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[

            ListTile(
              leading: Icon(
                isNotificationEnabled
                    ? Icons.notifications
                    : Icons.notifications_off,
                color: _selectedIndex == 1 ? Colors.blueGrey : Colors.grey,
              ),
              title: Text('Notifications'),
              subtitle: Text(isNotificationEnabled ? 'Enabled' : 'Disabled'),
              onTap: () {
                _selectItem(1);
                setState(() {
                  isNotificationEnabled = !isNotificationEnabled;
                });
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.border_color_outlined,
                color: _selectedIndex == 2 ? Colors.blueGrey : Colors.grey,
              ),
              title: Text('Complaints'),
              onTap: () {
                _selectItem(2);
                // TODO: Navigate to complaints page
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.language,
                color: _selectedIndex == 3 ? Colors.blueGrey : Colors.grey,
              ),
              title: Text('Language'),
              onTap: () {
                _selectItem(3);
                // TODO: Add language selection functionality
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.contact_phone,
                color: _selectedIndex == 4 ? Colors.blueGrey : Colors.grey,
              ),
              title: Text('Contact us'),
              onTap: () {
                _selectItem(4);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUsPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.help,
                color: _selectedIndex == 5 ? Colors.blueGrey : Colors.grey,
              ),
              title: Text('Help & Support'),
              onTap: () {
                _selectItem(5);
                // TODO: Add help and support functionality
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                      (route) => false,
                );
                showLogoutSnackbar(context);
              },
            ),
          ],

        ),
      ),
    );
  }
}
void showLogoutSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor:Colors. blueGrey,
      content: Text('Logged out successfully.'),
      duration: Duration(seconds: 2),
    ),
  );
  // Perform logout action here if needed
}
