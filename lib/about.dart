import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5ede2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf5ede2),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Cat Adoption System',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Our Team',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              const ContributorTile(
                  name: 'Ameera Hussain Al-Attas.',
                  profilePicPath: 'images/Ameera.png'),
              const ContributorTile(
                  name: 'Kafia Mahdi Bahkam.',
                  profilePicPath: 'images/Kafia.jpeg'),
              const ContributorTile(
                  name: 'Mohamed Sami Bakir.',
                  profilePicPath: 'images/Mohamed.png'),
              const ContributorTile(
                  name: 'Tammam Abdulrahman Belkhair.',
                  profilePicPath: 'images/Tammam.jpeg'),
              const SizedBox(height: 20),
              const Text(
                'Our project, the Cat Adoption System, aims to connect loving homes with cats in need. We are dedicated to making the process of adopting a pet as seamless and joyful as possible. We believe every cat deserves a warm and loving home.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.pets,
                      size: 50,
                      color: Colors.orangeAccent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContributorTile extends StatelessWidget {
  final String name;
  final String profilePicPath;
  const ContributorTile({required this.name, required this.profilePicPath});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              profilePicPath,
              width: 50,
              height: 50,
            ),
          ),
          const SizedBox(width: 15),
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
