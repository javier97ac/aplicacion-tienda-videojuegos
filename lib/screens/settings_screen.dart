import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/logo_widget.dart';
import '../providers/auth_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Row(children: const [LogoWidget(size: 24), SizedBox(width: 8), Text('Ajustes')])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Usuario: ${auth.user ?? 'No iniciado'}', style: const TextStyle(color: Colors.black)),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: () { auth.logout(); Navigator.of(context).pushReplacementNamed('/login'); }, style: ElevatedButton.styleFrom(backgroundColor: Colors.black), child: const Text('Cerrar sesión')),
        ]),
      ),
    );
  }
}
