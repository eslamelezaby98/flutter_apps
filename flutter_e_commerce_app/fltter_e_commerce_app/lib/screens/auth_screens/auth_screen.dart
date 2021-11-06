import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late TabController _tabController;
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('E-Commerce'),
          bottom: TabBar(
            indicatorPadding: EdgeInsets.all(20),
            tabs: [
              Text(
                'Register',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'Login',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        // TabBarView
        // body: TabBarView(
        //   controller: _tabController,
        // ),
      ),
    );
  }
}
