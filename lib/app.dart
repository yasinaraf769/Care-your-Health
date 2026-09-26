import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/appointments/presentation/providers/appointment_provider.dart';
import 'features/auth/presentation/providers/auth_provider.dart';
import 'features/billing/presentation/providers/billing_provider.dart';
import 'features/doctors/presentation/providers/doctor_provider.dart';
import 'features/patients/presentation/providers/patient_provider.dart';
import 'features/dashboard/presentation/providers/dashboard_provider.dart';

class HospitalManagementApp extends StatelessWidget {
  const HospitalManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => PatientProvider()),
        ChangeNotifierProvider(create: (_) => DoctorProvider()),
        ChangeNotifierProvider(create: (_) => AppointmentProvider()),
        ChangeNotifierProvider(create: (_) => BillingProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Hospital Management System',
        theme: AppTheme.light,
        routerConfig: appRouter,
      ),
    );
  }
}
