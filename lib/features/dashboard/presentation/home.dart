import 'package:flutter/material.dart';

import '../../../core/routes/index.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Implement logout logic here
            },
          ),
        ],
      ),
      drawer: const NavigationDrawer(),
      body: const DashboardContent(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Admin Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              RouteUtils.go('home');
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              RouteUtils.go('settings');
            },
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              RouteUtils.go('login');
            },
          ),
          ListTile(
            title: const Text('Sample Feature'),
            onTap: () {
              RouteUtils.go('sampleFeature');
            },
          ),
        ],
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to the Admin Dashboard',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Select an option from the menu to get started.',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
