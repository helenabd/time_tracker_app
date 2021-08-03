import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:time_tracker_app/services/services.dart';

class AddJobPage extends StatefulWidget {
  final Database database;
  const AddJobPage({
    Key key,
    @required this.database,
  }) : super(key: key);

  static Future<void> show(BuildContext context) async {
    final database = Provider.of<Database>(context, listen: false);
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AddJobPage(database: database),
      fullscreenDialog: true,
    ));
  }

  @override
  _AddJobPageState createState() => _AddJobPageState();
}

class _AddJobPageState extends State<AddJobPage> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  int _ratePerHour;

  bool _validadeteAndSaveForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _submit() {
    if (_validadeteAndSaveForm()) {
      print('form saved, name: $_name, ratePerHour: $_ratePerHour');
      final database = Provider.of<Database>(context, listen: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text('New Job'),
        centerTitle: true,
        actions: [
          TextButton(
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onPressed: _submit,
          )
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Job name'),
                      validator: (value) =>
                          value.isNotEmpty ? null : 'Name can\'t be empty',
                      onSaved: (newValue) => _name = newValue,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Rate per hour'),
                      onSaved: (newValue) =>
                          _ratePerHour = int.parse(newValue) ?? 0,
                      keyboardType: TextInputType.numberWithOptions(
                        signed: false,
                        decimal: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
