import 'package:flutter/material.dart';
import 'package:mindful/settings.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    // home: settingsPage(),
  ));
}

class settingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<settingsPage> {
  bool _isDarkMode = false;

  void _toggleDarkMode(bool darkMode) {
    setState() {
      _isDarkMode = darkMode;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: _isDarkMode,
            onChanged: _toggleDarkMode,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('General Settings'),
            onTap: () {
              // Navigate to general settings page
            },
          ),
          ListTile(
            leading: const Icon(Icons.bug_report),
            title: const Text('Report a bug'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('Feedback'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
