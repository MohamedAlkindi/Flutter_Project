import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_5/ManagementCats.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class AddProfile extends StatefulWidget {
  final Cat? cat;
  const AddProfile({super.key, this.cat});

  @override
  State<AddProfile> createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  File? _selectedImage;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController WedithController = TextEditingController();
  final TextEditingController TypeController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    if (widget.cat != null) {
      nameController.text = widget.cat!.name;
      ageController.text = widget.cat!.age;
      aboutController.text = widget.cat!.about;
      WedithController.text = widget.cat!.wedith;
      TypeController.text = widget.cat!.Type;
      _selectedImage = File(widget.cat!.image);
    }
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final newPath = await _saveImageToLocalDirectory(image);
        setState(() {
          _selectedImage = File(newPath);
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Future<String> _saveImageToLocalDirectory(XFile image) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = '${directory.path}/${basename(image.path)}';

      await File(image.path).copy(imagePath);
      return imagePath;
    } catch (e) {
      print("Error saving image: $e");
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xFFF5EDE2),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5EDE2),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundColor: Color(0xFFF5EDE2),
            radius: 4,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 17,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 245, 119, 81),
                            Color(0xFFFF7043)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: _selectedImage == null
                          ? const Center(
                              child: Text(
                                'Photo+',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : ClipOval(
                              child: Image.file(
                                _selectedImage!,
                                fit: BoxFit.cover,
                                width: 150,
                                height: 150,
                              ),
                            ),
                    ),
                  ),
                  // CircleAvatar(
                  //   radius: 90,
                  //   backgroundColor: Color.fromARGB(255, 230, 100, 49),
                  //   backgroundImage: _selectedImage != null
                  //       ? FileImage(_selectedImage!)
                  //       : null,
                  // ),
                  // Positioned(
                  //   right: 30,
                  //   bottom: 80,
                  //   child: IconButton(
                  //     icon: _selectedImage == null
                  //         ? Icon(Icons.add, size: 20, color: Colors.white)
                  //         : Text(''),
                  //     onPressed: _pickImage,
                  //   ),
                  // ),
                  // Positioned(
                  //   top: 70,
                  //   left: 50,
                  //   child: _selectedImage == null
                  //       ? Text(
                  //           'Photo',
                  //           style: TextStyle(color: Colors.white, fontSize: 26),
                  //         )
                  //       : Text(''),
                  // )
                ]),
                const SizedBox(height: 60),
                _buildInputField('Cat Name:', nameController, Icons.pets),
                const SizedBox(height: 16),
                _buildInputField('Type:', TypeController, Icons.female),
                const SizedBox(height: 16),
                _buildInputField('Age:', ageController, Icons.calendar_today),
                const SizedBox(height: 16),
                _buildInputField(
                    'Weight:', WedithController, Icons.monitor_weight_rounded),
                const SizedBox(height: 16),
                _buildInputField(
                    'Descrptions:', aboutController, Icons.description),
                const SizedBox(height: 16),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_selectedImage != null) {
                        final newCat = Cat(
                          name: nameController.text,
                          age: ageController.text,
                          about: aboutController.text,
                          image: _selectedImage!.path,
                          Type: TypeController.text,
                          wedith: WedithController.text,
                        );
                        Navigator.pop(context, newCat);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please select an image'),
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 150, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: const Color.fromARGB(255, 237, 106, 6),
                  ),
                  child: Text(
                    'Add Cat',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

Widget _buildInputField(
    String hint, TextEditingController controller, IconData icon) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey),
      filled: true,
      fillColor: const Color.fromARGB(255, 246, 246, 246),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color.fromARGB(255, 230, 100, 49),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 230, 100, 49)),
        borderRadius: BorderRadius.circular(30),
      ),
      suffixIcon: Icon(icon),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'This field cannot be empty';
      }
      return null;
    },
  );
}
