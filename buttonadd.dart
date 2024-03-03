import 'package:flutter/material.dart';
import 'delect.dart';
import 'employeeadd.dart';
void main() {
  runApp(adminfeture());
}

class adminfeture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Centered Box with Buttons',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CenteredBoxWithButtons(),
    );
  }
}

class CenteredBoxWithButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Remove the title from the app bar
        title: SizedBox.shrink(),
      ),
      body: Padding(
        // Add padding to the body
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Welcome, Admin',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                _buildHoverButton(
                  'Add Employee',
                  Icons.person_add,
                  () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => adminadd()),
                            );
                  },
                ),
                SizedBox(height: 10),
                _buildHoverButton(
                  'Delete The Record',
                  Icons.settings,
                  () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => admindele()),
                            );
                    // Add functionality for the second button
                  },
                ),
                SizedBox(height: 10),
                _buildHoverButton(
                  'Get Details',
                  Icons.details,
                  () {
                    // Add functionality for the third button
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHoverButton(
    String text,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return Container(
      width: 200, // Adjust the width as per your requirement
      margin: EdgeInsets.symmetric(vertical: 5.0), // Add margin
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return Colors.blue.withOpacity(0.8);
              }
              return Colors.blue;
            },
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(vertical: 16.0),
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        icon: Icon(icon),
        label: Text(
          text,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}