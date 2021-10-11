import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      appBar: AppBar(
        backgroundColor: Color(0xffF7F7F7),
        title: Text(
          'Profile',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          // user image
          children: [
            Container(
              height: 250,
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg'),
                  ),
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(height: 20),
            AccountScreenCard(
                title: 'Account', icon: Icons.account_circle_outlined),
            AccountScreenCard(
                title: 'My Address', icon: Icons.location_searching_outlined),
            AccountScreenCard(title: 'My Order', icon: Icons.note_alt_outlined),
            AccountScreenCard(title: 'Payments', icon: Icons.local_activity),
            AccountScreenCard(
                title: 'My Favorites', icon: Icons.favorite_border_outlined),
            AccountScreenCard(title: 'Setting', icon: Icons.settings),
          ],
        ),
      ),
    );
  }
}

class AccountScreenCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const AccountScreenCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO: Move to account info
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            border: Border.all(color: Colors.black12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              SizedBox(width: 10),
              Text(
                title,
                style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
