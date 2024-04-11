import 'package:flutter/material.dart';

import '../../data/api.dart';

// Assuming you have the Vacation and ApiService classes defined as before

class AddVacationScreen extends StatefulWidget {
  const AddVacationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddVacationScreenState createState() => _AddVacationScreenState();
}

class _AddVacationScreenState extends State<AddVacationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _vacationNameController = TextEditingController();
  final _fromDateController = TextEditingController();
  final _toDateController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _created_atController = TextEditingController();


  final _apiService = ApiService();

  @override
  void dispose() {
    _vacationNameController.dispose();
    _fromDateController.dispose();
    _toDateController.dispose();
    _descriptionController.dispose();
    _created_atController.dispose();
    super.dispose();
  }

  Future<void> _addVacation() async {
    if (_formKey.currentState!.validate()) {
      final vacation = Vacation(
        vacationName: _vacationNameController.text,
        fromDate: _fromDateController.text,
        toDate: _toDateController.text,
        description: _descriptionController.text,
        created_at: _created_atController.text,
      );

      try {
        final createdVacation = await _apiService.postVacation(vacation);
        // Handle the successful creation of the vacation
        print('Vacation created: $createdVacation');
      } catch (e) {
        // Handle the error when creating the vacation
        print('Error creating vacation: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Vacation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _vacationNameController,
                decoration: const InputDecoration(labelText: 'Vacation Name'),
                
              ),
              TextFormField(
                controller: _fromDateController,
                decoration: const InputDecoration(labelText: 'From Date'),
                
              ),
              TextFormField(
                controller: _toDateController,
                decoration: const InputDecoration(labelText: 'To Date'),
                
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _addVacation,
                child: const Text('Add Vacation'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}