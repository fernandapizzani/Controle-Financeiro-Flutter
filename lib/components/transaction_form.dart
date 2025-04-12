import 'package:flutter/material.dart';
//import '../main.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;
  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade900,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
              //onChanged: (newValue) => titleController = newValue,
              decoration: InputDecoration(
                labelText: 'Título',
                filled: true,
                fillColor: Colors.grey.shade800,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                labelStyle: TextStyle(color: Colors.white70),
              ),
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 10),
            TextField(
              controller: valueController,
              onSubmitted:
                  (_) =>
                      _submitForm(), // usamos o _ para ficar claro q n usaremos a var
              //onChanged: (newValue) => valueController = newValue,
              decoration: InputDecoration(
                labelText: 'Valor',
                filled: true,
                fillColor: Colors.grey.shade800,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                labelStyle: TextStyle(color: Colors.white70),
              ),
              style: TextStyle(color: Colors.white70),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _submitForm,
                  child: Text('Nova transação'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.lightGreenAccent,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
