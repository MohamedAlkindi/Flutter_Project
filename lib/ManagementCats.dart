import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_5/addaprofile.dart';
import 'package:flutter_application_5/editProfile.dart';

class Management extends StatefulWidget {
  @override
  State<Management> createState() => _ManagementState();
}

class _ManagementState extends State<Management> {
  String searchQuery = '';
  static List<Cat> cats = [
    Cat(
        name: 'Fluffy',
        age: '2 years',
        about: 'Fluffy is a cute cat.',
        Type: 'a',
        wedith: '30',
        image: 'images/2.jpg'),
    Cat(
        name: 'Whiskers',
        age: '4 years',
        Type: 'a',
        wedith: '30',
        about: 'Whiskers loves to play.',
        image: 'images/3.jpg'),
    Cat(
        name: 'Mittens',
        age: '3 years',
        Type: 'a',
        wedith: '30',
        about: 'Mittens is very friendly.',
        image: 'images/4.jpg'),
  ];
  TextEditingController info = TextEditingController();

  List<Cat> get filteredCats {
    return cats.where((cat) {
      final name = cat.name.toLowerCase();
      return name.contains(searchQuery.toLowerCase());
    }).toList();
  }

  void deleteCat(int index) {
    setState(() {
      cats.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5ede2),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFf5ede2),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Confirm logout'),
                    content: const Text(
                      'Are you sure you want to logout?',
                      style: TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 11, 2, 2),
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: const Text(
                          'No',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 11, 2, 2),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, 'sign_in_view'); // Close the dialog
                        },
                        child: const Text(
                          'Yes',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 11, 2, 2),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search cats...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
            ),
          ),
        ),
      ),
      //drawer: const NavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
        child: CatListView(cats: filteredCats, deleteCat: deleteCat),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 135.0),
        child: BottomAppBar(
          color: const Color(0xFFf5ede2),
          child: ElevatedButton(
            onPressed: () async {
              final newCat = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddProfile(),
                ),
              );

              if (newCat != null && newCat is Cat) {
                setState(() {
                  cats.add(newCat);
                });
              }
            },
            //direct to add cat page

            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFFed7a4d)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  'Add Cat',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CatListView extends StatefulWidget {
  final List<Cat> cats;
  final Function(int) deleteCat;

  CatListView({required this.cats, required this.deleteCat});

  @override
  _CatListViewState createState() => _CatListViewState();
}

class _CatListViewState extends State<CatListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.cats.length,
      itemBuilder: (context, index) {
        final cat = widget.cats[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
          child: Card(
            child: ListTile(
              title: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      cat.image,
                      fit: BoxFit.fitHeight,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(width: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cat.name,
                        style: const TextStyle(
                          color: Color(0xFF090a09),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cat.age,
                        style: TextStyle(color: Color(0xFF090a09)),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.update),
                    onPressed: () async {
                      final updatedCat = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EditProfile(cat: widget.cats[index]),
                        ),
                      );

                      if (updatedCat != null && updatedCat is Cat) {
                        setState(() {
                          widget.cats[index] = updatedCat;
                        });
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      widget.deleteCat(index);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Cat {
  final String name;
  final String age;
  final String about;
  final String image;
  final String Type;

  final String wedith;

  Cat({
    required this.name,
    required this.age,
    required this.about,
    required this.image,
    required this.Type,
    required this.wedith,
  });
}
