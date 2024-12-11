import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/providerss/list_view_provider.dart';

class UpdateData extends StatefulWidget {
  final int index;
  const UpdateData({super.key, required this.index});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  // Controllers for the text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();

  // Key for the form
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Dispose the controllers to free up resources
    _nameController.dispose();
    _surnameController.dispose();
    super.dispose();
  }

  // Method to handle form submission
  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // Access the values from controllers
      final name = _nameController.text.trim();
      final surname = _surnameController.text.trim();

      // Do something with the values (e.g., print them or save them)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Name: $name, Surname: $surname")),
      );

      // Clear the fields after submission
      _nameController.clear();
      _surnameController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Center(
    //     // child: IconButton(
    //     //   onPressed: () {

    //     //   },
    //     //   icon: Icon(Icons.update),
    //     // ),
    //     child: Consumer<ListViewProvider>(
    //   builder: (context, value, child) => IconButton(
    //     onPressed: () {
    //       value.updateData({'name': "satara", "surname": "city"}, widget.index);
    //     },
    //     icon: Icon(Icons.update),
    //   ),
    // ));
    return Scaffold(
      appBar: AppBar(title: const Text("Name and Surname Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Name field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              // Surname field
              TextFormField(
                controller: _surnameController,
                decoration: const InputDecoration(
                  labelText: "Surname",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your surname";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              // Submit button
              // ElevatedButton(
              //   onPressed: _handleSubmit,
              //   child: const Text("Submit"),
              // ),
              Consumer<ListViewProvider>(
                builder: (context, pro, child) => ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Access the values from controllers
                      final name = _nameController.text.trim();
                      final surname = _surnameController.text.trim();
                      pro.updateData(
                          {"name": name, "surname": surname}, widget.index);

                      // Do something with the values (e.g., print them or save them)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text("Name: $name, Surname: $surname")),
                      );

                      // Clear the fields after submission
                      _nameController.clear();
                      _surnameController.clear();
                    }

                    // _handleSubmit();
                  },
                  child: const Text("Submit"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
