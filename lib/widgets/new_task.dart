// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:task_tracker/models/task_model.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key, required this.onAddTask}) : super(key: key);
  final void Function(TaskModal tsk) onAddTask;

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitTaskData() {
    widget.onAddTask(
      TaskModal(
        title: _titleController.text,
        description: _descriptionController.text,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                maxLength: 50,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                controller: _descriptionController,
                maxLength: 100,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _submitTaskData,
                    child: const Text('Add Task'),
                  ),
                  const SizedBox(width: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(
                          context); // Navigate back when cancel button is pressed
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
