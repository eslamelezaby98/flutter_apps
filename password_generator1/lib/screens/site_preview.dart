import 'package:flutter/material.dart';
import 'package:password_generator/models/site.dart';

class SitePreview extends StatelessWidget{

  final Site site ;

  const SitePreview({ this.site});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(site.siteName),
      ),
    );
  }
}