import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auto_save_provider.dart';

class AutoSaveForm extends StatefulWidget {
  const AutoSaveForm({super.key});

  @override
  State<AutoSaveForm> createState() => _AutoSaveFormState();
}

class _AutoSaveFormState extends State<AutoSaveForm> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load saved data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<AutoSaveProvider>();
      _nameController.text = provider.getFormData('name') ?? '';
      _emailController.text = provider.getFormData('email') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
            onChanged: (value) {
              context.read<AutoSaveProvider>().saveFormData('name', value);
            },
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            onChanged: (value) {
              context.read<AutoSaveProvider>().saveFormData('email', value);
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
