import 'package:anaaj/widgets/snackbars/show_successful_snackbar.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CurrentOrder extends StatefulWidget {
  const CurrentOrder({super.key});

  @override
  State<CurrentOrder> createState() => _CurrentOrderState();
}

class _CurrentOrderState extends State<CurrentOrder> {
  DateTime _deliveryTime = DateTime.now();
  String _food = 'Rice and sambar and rasam';
  String _location = 'jayanagar 9th block';
  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse('https://www.google.com/maps');
    return Scaffold(
      body: SizedBox(
        height: 400,
        child: Card(
          elevation: 8.0,
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.access_time),
                      SizedBox(width: 8.0),
                      Text('Time of Order Acceptance:'),
                      SizedBox(width: 8.0),
                      Text('12:34 PM'),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: <Widget>[
                      Icon(Icons.fastfood),
                      SizedBox(width: 8.0),
                      Text('Ordered Food:'),
                      SizedBox(width: 8.0),
                      Text("food"),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: <Widget>[
                      Icon(Icons.location_on),
                      SizedBox(width: 8.0),
                      Text('Location of Drop:'),
                      SizedBox(width: 8.0),
                      Text('Jayanafar.'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ElevatedButton.icon(
                        icon: Icon(Icons.check),
                        label: Text('Confirm Drop'),
                        onPressed: () {
                          showSuccessSnackbar(
                            context,
                            title: 'Order Drop Confirmed',
                            message: 'Thank You for doing such a great job!',
                            height: 0,
                          );
                          // Confirm drop action
                        },
                      ),
                      SizedBox(width: 8.0),
                      ElevatedButton.icon(
                        icon: Icon(Icons.phone),
                        label: Text('Call the Customer'),
                        onPressed: () async {
                          final Uri phone = Uri.parse('tel:1234567890');
                          await launchUrl(phone);
                        },
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
