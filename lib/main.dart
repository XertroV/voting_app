import 'package:flutter/material.dart';
import 'package:voting_app/all_issues.dart';
import 'package:voting_app/settings.dart';
import 'package:voting_app/route_generator.dart';
import 'package:voting_app/all_bills.dart';
import 'package:voting_app/styles.dart';
import 'package:voting_app/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var child;
    var page;

    // for setting the page and the RouteGenerator
    switch (index) {
      // bills
      case 0:
        child = RouteGenerator.generateBillRoute;
        page = AllBillsPage();
        break;
      // issues
      case 1:
        page = AllIssuesPage();
        child = RouteGenerator.generateIssueRoute;
        break;
      // User
      case 2:
        page = ProfilePage();
        child = RouteGenerator.generateSettingsRoute;
        break;
      case 3:
        page = SettingsPage();
        child = RouteGenerator.generateSettingsRoute;
        break;        
    }

    return MaterialApp(
        initialRoute: '/',
        onGenerateRoute: child,
        home: new Scaffold(
          backgroundColor: appColors.background,
          //current page
          body: page,
          // the nav bar at the bottom --> [bills - issues - Settings]
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: appColors.background,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                title: Text('Bills'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment_late),
                title: Text('Issues'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
            unselectedItemColor: appColors.text,
            selectedItemColor: appColors.mainTheme,
            currentIndex: index,
            onTap: (int index) {
              setState(() {
                this.index = index;
              });
            },
          ),
        ));
  }
}
