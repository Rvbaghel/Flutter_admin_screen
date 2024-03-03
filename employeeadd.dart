import 'package:flutter/material.dart';

void main() {
  runApp(adminadd());
}

class adminadd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: const Color.fromARGB(255, 114, 185, 231),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Add Employees'),
        ),
        body: EmployeeForm(),
      ),
    );
  }
}

class EmployeeForm extends StatefulWidget {
  @override
  _EmployeeFormState createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter $fieldName';
    }
    return null;
  }

  DateTime? _selectedDateOfBirth;
  DateTime? _selectedDateOfJoining;

  Future<void> _selectDate(BuildContext context, bool isDateOfBirth) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        if (isDateOfBirth) {
          _selectedDateOfBirth = picked;
        } else {
          _selectedDateOfJoining = picked;
        }
      });
    }
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (value.length != 10) {
      return 'Phone number must be 10 digits';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9, // Adjusted width
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Employee Detail'),
                    validator: (value) =>
                        _validateEmpty(value, 'Employee Detail'),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Employee Name'),
                    validator: (value) =>
                        _validateEmpty(value, 'Employee Name'),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _selectDate(context, true),
                          child: AbsorbPointer(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Date of Birth'),
                              validator: (value) =>
                                  _validateEmpty(value, 'Date of Birth'),
                              controller: TextEditingController(
                                  text: _selectedDateOfBirth != null
                                      ? _selectedDateOfBirth!
                                          .toString()
                                          .substring(0, 10)
                                      : ''),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _selectDate(context, false),
                          child: AbsorbPointer(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Date of Joining'),
                              validator: (value) =>
                                  _validateEmpty(value, 'Date of Joining'),
                              controller: TextEditingController(
                                  text: _selectedDateOfJoining != null
                                      ? _selectedDateOfJoining!
                                          .toString()
                                          .substring(0, 10)
                                      : ''),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Address'),
                    maxLines: 3,
                    validator: (value) => _validateEmpty(value, 'Address'),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'City'),
                          validator: (value) => _validateEmpty(value, 'City'),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'State'),
                          validator: (value) =>
                              _validateEmpty(value, 'State'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Pincode'),
                          validator: (value) =>
                              _validateEmpty(value, 'Pincode'),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Mobile Number'),
                          keyboardType: TextInputType.phone,
                          validator: _validatePhoneNumber, // Validation for 10-digit phone number
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Email Id'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>
                              _validateEmpty(value, 'Email Id'),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Pan Card Number'),
                          validator: (value) =>
                              _validateEmpty(value, 'Pan Card Number'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState != null &&
                              _formKey.currentState!.validate()) {
                            // Submit the form
                            // Add your form submission logic here
                          }
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                        child: Text('Submit r', style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState != null) {
                            _formKey.currentState!.reset();
                          }
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                        child: Text('Reset ', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}