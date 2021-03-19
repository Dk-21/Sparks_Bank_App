import 'package:basic_bank_app/model/customer.dart';
import 'package:basic_bank_app/screens/adminDetails.dart';
import 'package:basic_bank_app/screens/customers_list.dart';
import 'package:basic_bank_app/screens/insertCustomer.dart';
import 'package:basic_bank_app/widgets/customcard.dart';
import 'package:flutter/material.dart';
import '../dbHelper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Customer> query = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Sparks Foundation Bank'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info),
              onPressed: () async {
                DBHelper db = DBHelper();
                query = await db.getCustomer();
                Navigator.of(context).pushNamed(AdminDetailsScreen.routeNamed,
                    arguments: query[0]);
              })
        ],
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/banking-business-banner-finance-savings-abstract-silhouette-city-background-vector-illustration-84498253.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                elevation: 10,
                margin: EdgeInsets.all(3),
                color: Colors.indigo[100],
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                    child: Image(
                      image: AssetImage("assets/images/logo.png"),
                      height: 250,
                      width: 250,
                      fit: BoxFit.fill,
                    )),
              ),
              const Divider(
                color: Colors.black,
                height: 30,
                thickness: 5,
                endIndent: 2,
              ),
              Text(
                "Welcome to the Bank  !",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),


              const Divider(
                color: Colors.black,
                height: 30,
                thickness: 5,
                endIndent: 2,
              ),


              SizedBox(height: 50),
              CustomCard(
                icon: Icons.account_circle,
                title: 'Customers List',
                navpage: () async {
                  DBHelper db = DBHelper();
                  query = await db.getCustomer();
                  Navigator.of(context)
                      .pushNamed(CustomersList.routeNamed, arguments: query);
                },
              ),
              CustomCard(
                icon: Icons.account_balance,
                title: 'Add Customer',
                navpage: () {
                  Navigator.of(context).pushNamed(
                    InsertCustomer.routeNamed,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
