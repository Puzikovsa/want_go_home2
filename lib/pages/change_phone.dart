import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/phone.dart';

class ChangePhone extends StatelessWidget{
  static const route = '/change_phone';
  const ChangePhone({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Изменить телефон доступа'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            maxLength: 11,
            controller: controller,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Phone>(context, listen: false).changePhone(controller.text);
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

}