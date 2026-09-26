import 'package:flutter/material.dart';

import '../../../../core/widgets/responsive_scaffold.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      // This title is displayed in the header.
      title: 'Dashboard',

      // This is the main dashboard area.
      // We will replace this placeholder with the
      // real Admin Home Page in the next steps.
      body: const Center(
        child: Text(
          'Dashboard Content',
        ),
      ),
    );
  }
}