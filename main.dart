import 'package:flutter/material.dart';

void main() => runApp(MyFormApp());

class MyFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  String gender = 'Male';
  List<String> interests = [];
  bool termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Page')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(decoration: InputDecoration(labelText: 'First Name')),
              TextFormField(decoration: InputDecoration(labelText: 'Last Name')),
              TextFormField(decoration: InputDecoration(labelText: 'Age'), keyboardType: TextInputType.number),
              TextFormField(decoration: InputDecoration(labelText: 'Email'), keyboardType: TextInputType.emailAddress),
              TextFormField(decoration: InputDecoration(labelText: 'Password'), obscureText: true),
              TextFormField(decoration: InputDecoration(labelText: 'Mobile Number'), keyboardType: TextInputType.phone),

              SizedBox(height: 20),
              Text("Gender", style: TextStyle(fontWeight: FontWeight.bold)),
              RadioListTile(
                title: Text("Male"),
                value: "Male",
                groupValue: gender,
                onChanged: (value) => setState(() => gender = value!),
              ),
              RadioListTile(
                title: Text("Female"),
                value: "Female",
                groupValue: gender,
                onChanged: (value) => setState(() => gender = value!),
              ),
              RadioListTile(
                title: Text("Others"),
                value: "Others",
                groupValue: gender,
                onChanged: (value) => setState(() => gender = value!),
              ),

              SizedBox(height: 20),
              Text("Interest", style: TextStyle(fontWeight: FontWeight.bold)),
              ...['Reading', 'Music', 'Travel', 'Games'].map((interest) => CheckboxListTile(
                title: Text(interest),
                value: interests.contains(interest),
                onChanged: (bool? checked) {
                  setState(() {
                    if (checked!) {
                      interests.add(interest);
                    } else {
                      interests.remove(interest);
                    }
                  });
                },
              )),

              SwitchListTile(
                title: Text("Accept the Terms and Conditions"),
                value: termsAccepted,
                onChanged: (bool value) {
                  setState(() {
                    termsAccepted = value;
                  });
                },
                subtitle: Text('Switch is ${termsAccepted ? "ON" : "OFF"}'),
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && termsAccepted) {
                    // Submit the form
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Form Submitted')),
                      Sized



                    );
                  }
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
