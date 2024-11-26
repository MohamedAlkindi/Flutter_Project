import 'package:flutter/material.dart';
import 'package:flutter_application_5/ManagementCats.dart';

class AddProfile extends StatefulWidget {
  final Map<String, dynamic>? cat;
  const AddProfile({super.key, this.cat});

  @override
  State<AddProfile> createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  String? imagePath;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController wedithController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  Future<void> _pickImageFromAssets(BuildContext context) async {
    // قائمة الصور المتوفرة في مجلد assets
    final List<String> assetImages = [
      'images/16(1).jpg',
      'images/16(1).jpg',
      'images/16(1).jpg',
      // أضف المزيد من الصور هنا
    ];

    // عرض Dialog لاختيار الصورة
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Choose a Photo'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: assetImages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading:
                      Image.asset(assetImages[index], width: 50, height: 50),
                  title: Text(assetImages[index].split('/').last),
                  onTap: () {
                    setState(() {
                      imagePath = assetImages[index];
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EDE2),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5EDE2),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () => _pickImageFromAssets(context),
                      child: CircleAvatar(
                        radius: 90,
                        backgroundColor: Color.fromARGB(255, 230, 100, 49),
                        backgroundImage: imagePath != null
                            ? AssetImage(imagePath!) // عرض الصورة من assets
                            : null,
                      ),
                    ),
                    Positioned(
                      right: 30,
                      bottom: 80,
                      child: IconButton(
                        icon: imagePath == null
                            ? const Icon(Icons.add,
                                size: 20, color: Colors.white)
                            : const Text(''),
                        onPressed: () => _pickImageFromAssets(
                            context), // اختيار الصورة من assets
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: 50,
                      child: imagePath == null
                          ? Text('Photo',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 26))
                          : Text(''),
                    )
                  ],
                ),
                SizedBox(height: 60),
                _buildInputField('Cat Name:', nameController),
                SizedBox(height: 16),
                _buildInputField('Type:', typeController),
                SizedBox(height: 16),
                _buildInputField('Age:', ageController),
                SizedBox(height: 16),
                _buildInputField('Weight:', wedithController),
                SizedBox(height: 16),
                _buildInputField('Description:', aboutController),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (imagePath != null) {
                        final newCat = {
                          'name': nameController.text,
                          'age': int.parse(ageController.text),
                          'description': aboutController.text,
                          'image': imagePath ??
                              "", // Ensure the image path is correct
                          'type': typeController.text,
                          'weight': wedithController.text,
                        };
                        Navigator.pop(context, newCat);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please select an image')),
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
                  child: Text('Add Pet',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String hint, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color.fromARGB(255, 246, 246, 246),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color.fromARGB(255, 230, 100, 49)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 230, 100, 49)),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field cannot be empty';
        }
        return null;
      },
    );
  }
}
