import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Initializes Supabase and starts the application.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://retuujyjqylsyioargmh.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJldHV1anlqcXlsc3lpb2FyZ21oIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1MDI3MzIyOCwiZXhwIjoyMDY1ODQ5MjI4fQ._gXWfexTRD_Clwps3aXPtGCTv_e10pZQpsOFIQQPMds',
  );
  final prefs = await SharedPreferences.getInstance();
  final loggedIn = prefs.containsKey('logged_user_pk');
  runApp(MyApp(loggedIn: loggedIn));
}

class MyApp extends StatelessWidget {
  final bool loggedIn;
  const MyApp({super.key, required this.loggedIn});

  @override
  /// Builds the root widget and sets up the app theme and initial screen.
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ERP Mobile',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: loggedIn ? const HomeScreen() : const LoginScreen(),
    );
  }
}
