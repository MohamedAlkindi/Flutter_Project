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
  File? _selectedImage ;
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
    // اختيار الصورة من المعرض
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // حفظ الصورة في مجلد دائم أو مؤقت
      final newPath = await _saveImageToLocalDirectory(image);
      setState(() {
        _selectedImage = File(newPath); // تحديث الحالة لعرض الصورة
      });
    }
  } catch (e) {
    print("Error picking image: $e");
  }
}

Future<String> _saveImageToLocalDirectory(XFile image) async {
  try {
    // تحديد المجلد لحفظ الصورة
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = '${directory.path}/${basename(image.path)}';

    // نسخ الصورة إلى المجلد
    await File(image.path).copy(imagePath);
    return imagePath; // إعادة المسار الكامل للصورة
  } catch (e) {
    print("Error saving image: $e");
    return '';
  }
}

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: 
       Scaffold(
      backgroundColor: Color(0xFFF5EDE2),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5EDE2),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 4,
            child: 
          
          IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black,size: 17,),
            onPressed: () {
                Navigator.pop(context);
            },
          ),),
        )
        
        ),
        
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
             key: _formKey,
            child: Column(
              children: [
                // صورة للدائرة مع زر الإضافة
               Stack(
                  children: [CircleAvatar(
                    radius: 90,
                    
                    backgroundColor:Color.fromARGB(255, 230, 100, 49),
                    backgroundImage: _selectedImage != null
                    ? FileImage(_selectedImage!)
                    : null,
                    
                  ),
                  Positioned(
                        right: 30,
                        bottom: 80,
                        child: IconButton(
                        icon: _selectedImage==null?Icon(Icons.add, size: 20, color: Colors.white):Text(''),
                        onPressed:_pickImage,
                                          ),),
                Positioned(
                  top: 70,
                 left: 50,
                  child: _selectedImage==null?Text('Photo',style: TextStyle(color: Colors.white,fontSize: 26),):Text(''),)
                  ]
                ),
                SizedBox(height: 60),
              
                _buildInputField('Cat Name:',nameController),
                SizedBox(height: 16),
               
                _buildInputField('type:',TypeController,),
                SizedBox(height: 16),
            
                _buildInputField('Age:',ageController),
                SizedBox(height: 16),
              
                _buildInputField('Weight:',WedithController),
                SizedBox(height: 16),
               
                _buildInputField('Descrptions:',aboutController),
                SizedBox(height: 16),
               
               
                SizedBox(height: 40),
                  
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
                    padding: EdgeInsets.symmetric(horizontal: 150, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: const Color.fromARGB(255, 237, 106, 6),
                  ),
                  child: Text(
                    'Add Pet',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
    );
  }
}
Widget _buildInputField(String hint,TextEditingController controller) {
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
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field cannot be empty';
        }
        return null;
      },
    );
  }



