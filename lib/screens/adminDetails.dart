import 'package:basic_bank_app/model/customer.dart';
import 'package:basic_bank_app/widgets/customcard.dart';
import 'package:flutter/material.dart';

class AdminDetailsScreen extends StatefulWidget {
  static const routeNamed = '/AdminDetails';

  @override
  _AdminDetailsScreenState createState() => _AdminDetailsScreenState();
}

class _AdminDetailsScreenState extends State<AdminDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var query = ModalRoute.of(context).settings.arguments as Customer;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Denish Kalariya'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/profilepic1.jpeg"),
            ),
            Text(
              'Denish Kalariya',
              style: TextStyle(
                fontSize: 25,
                color: Colors.blueGrey[700],
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 20,
              thickness: 3,
              endIndent: 10,
            ),
            CustomCard(
              icon: Icons.account_box,
              title: 'Account No: ${query.id}',
            ),
            CustomCard(
              icon: Icons.account_balance_wallet,
              title: 'Balance: Rs.${query.balance}',
            ),
          ],
        ),
      ),
    );
  }
}
