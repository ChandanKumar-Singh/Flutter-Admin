import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  final String? pageName; // Optional page name for better context

  const NotFoundPage({Key? key, this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(pageName != null ? '$pageName Not Found' : 'Page Not Found'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 100,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            Text(
              'Oops! This page is not available.',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Please check back later or contact support.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Home or another default page
                Navigator.of(context).pushNamed('/');
              },
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
