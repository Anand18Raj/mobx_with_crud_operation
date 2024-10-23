import 'package:flutter/material.dart';

class GroupTypeDialog extends StatefulWidget {
  final Function(Map<String, dynamic>) onSubmit;

  GroupTypeDialog({super.key, required this.onSubmit});

  @override
  _GroupTypeDialogState createState() => _GroupTypeDialogState();
}

class _GroupTypeDialogState extends State<GroupTypeDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Group Type'),
      content: Form(
        key: _formKey,
        child:Column(
          children: [
             TextFormField(
          controller: _nameController,
          decoration: const InputDecoration(labelText: 'Group Type Name'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a name';
            }
            return null;
          },
        ),const SizedBox(height: 24)
,       
 TextFormField(
          controller: _descriptionController,
          decoration: const InputDecoration(labelText: 'Group Type Description'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a Description';
            }
            return null;
          },
        ),
          ],
        )
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              widget.onSubmit({'name': _nameController.text,'description': _descriptionController.text});
              
              Navigator.of(context).pop(); // Close the dialog
            }
          },
          child: const Text('Submit'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(), // Close the dialog
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
