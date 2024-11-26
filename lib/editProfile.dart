import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class EditProfile extends StatefulWidget {
  final  Map<String, dynamic> cat;
  const EditProfile({super.key, required this.cat});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController aboutController;
  late TextEditingController TypeController;
  late TextEditingController WedithController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.cat['name']);
    ageController = TextEditingController(text: widget.cat['age'].toString());
    TypeController = TextEditingController(text: widget.cat['type']);
    WedithController = TextEditingController(text: widget.cat['weight']);

    aboutController = TextEditingController(text: widget.cat['description']);
    _selectedImage = File(widget.cat['image']);
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
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDE2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5EDE2),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Stack(
                children: [
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
                      child: ClipOval(
                          child: _selectedImage != null
                              ? Image.asset(
                                  _selectedImage!.path,
                                  fit: BoxFit.cover,
                                  width: 150,
                                  height: 150,
                                )
                              : Container(
                                  child: const Text("BO"),
                                )),
                    ),
                  ),
                  // CircleAvatar(
                  //   radius: 90,
                  //   backgroundColor: const Color.fromARGB(255, 230, 100, 49),
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
                ],
              ),
              const SizedBox(height: 60),
              _buildInputField('Cat Name:', nameController, Icons.pets),
              const SizedBox(height: 16),
              _buildInputField('Age:', ageController, Icons.calendar_today),
              const SizedBox(height: 16),
              _buildInputField('type:', TypeController, Icons.female),
              const SizedBox(height: 16),
              _buildInputField(
                  'Weight:', WedithController, Icons.monitor_weight_rounded),
              const SizedBox(height: 16),
              _buildInputField(
                  'Description:', aboutController, Icons.description),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (_selectedImage != null &&
                      nameController.text.isNotEmpty &&
                      ageController.text.isNotEmpty) {
                    final updatedCat =  {
                       'name': nameController.text,
                        'age':int.parse(ageController.text) ,
                      'type': TypeController.text,
                       'image': _selectedImage!.path,
                       'description': aboutController.text,
                      'weight': '23kg'
                        };
                    Navigator.pop(context, updatedCat);
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color.fromARGB(255, 237, 106, 6),
                ),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
      String hint, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color.fromARGB(255, 246, 246, 246),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 230, 100, 49),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 230, 100, 49)),
          borderRadius: BorderRadius.circular(30),
        ),
        suffix: Icon(icon),
      ),
    );
  }
}