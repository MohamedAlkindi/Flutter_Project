import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_5/Petprofile.dart';
import 'package:image_picker/image_picker.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Map<String, dynamic>> cats = [
  { 
    'name': 'Leo',
    'age': 3,
    'type': "Turkish Van",
    'image': 'images/9.jpg',
    'description': '''
      Leo is a playful and energetic cat who loves to swim and play with water. 
      He needs plenty of space to play and daily activity to stay healthy.
    '''   
    ,'wedith':'23kg'
  },
  
  { 
    'name': 'Minnie',
    'age': 1,
    'type': "Himalayan Cat",
    'image': 'images/14.jpg',
    'description': '''
      Minnie is a sweet and gentle cat who enjoys lounging around and being pampered. 
      She requires regular grooming to maintain her beautiful fur.
    '''
  },

  { 
    'name': 'Mocha',
    'age': 2,
    'type': "American Shorthair",
    'image': 'images/4.jpg',
    'description': '''
      Mocha is a friendly and sociable cat, always ready to greet visitors with a purr. 
      She needs daily interaction and playtime to thrive.
    
    '''
   ,'wedith':'20kg'
  },

  { 
    'name': 'Kali',
    'age': 5,
    'type': "Persian Cat",
    'image': 'images/6.jpg',
    'description': '''
      Kali has a calm demeanor and prefers quiet environments, making her the perfect lap cat. 
      She requires regular grooming to keep her coat in good condition.
    '''
   ,'wedith':'20kg'
  },


  { 
    'name': 'Milo',
    'age': 6,
    'type': "Himalayan Cat",
    'image': 'images/13.jpg',
    'description': '''
      Milo loves attention and is very affectionate, often following his owner around the house. 
      He needs special care for his fur to keep it looking great.
      
    '''
   ,'wedith':'21kg'
  },

  { 
    'name': 'Luna',
    'age': 2,
    'type': "Persian Cat",
    'image': 'images/11.jpg',
    'description': '''
      Luna is playful and enjoys interactive toys, though she also appreciates quiet time. 
      Regular grooming is important to maintain her beautiful coat.
    '''
   ,'wedith':'20kg'
  },

  { 
    'name': 'Coco',
    'age': 12,
    'type': "Turkish Van",
    'image': 'images/12.jpg',
    'description': '''
      Coco is wise and loving, often acting as the matriarch of the household. 
      She needs daily love and attention to feel happy and secure.
    '''
   ,'wedith':'30kg'
  },

  { 
    'name': 'Pixel',
    'age': 8,
    'type': "Himalayan Cat",
    'image': 'images/10.jpg',
    'description': '''
      Pixel is known for his stunning blue eyes and is very affectionate with children. 
      He requires regular interaction and playtime to keep him happy.
    '''
   ,'wedith':'40kg'
  },

  { 
    'name': 'Rocky',
    'age': 4,
    'type': "Oriental Shorthair",
    'image': 'images/15.jpg',
    'description': '''
      Rocky is intelligent and curious, often exploring every nook and cranny of the house. 
      He needs mental and physical stimulation to stay engaged.
    '''
   ,'wedith':'20kg'
  },

  { 
    'name': 'Finn',
    'age': 9,
    'type': "Turkish Van",
    'image': 'images/8.jpg',
    'description': '''
      Finn is laid-back and enjoys sunbathing, often found lounging in warm spots. 
      He requires minimal care but appreciates gentle affection.
    '''
   ,'wedith':'23kg'
  },

  { 
    'name': 'Daisy',
    'age': 3,
    'type': "Oriental Shorthair",
    'image': 'images/2.jpg',
    'description': '''
      Daisy is a social butterfly, getting along well with other pets and people alike. 
      She needs regular social interaction to stay happy.
    '''
  },

  { 
    'name': 'Mia',
    'age': 2,
    'type': "American Shorthair",
    'image': 'images/5.jpg',
    'description': '''
      Mia is playful and loves to chase after toys, keeping her owners entertained. 
      She requires daily playtime to channel her energy.
    '''
   ,'wedith':'20kg'
  },

  { 
    'name': 'Ruby',
    'age': 5,
    'type': "Persian Cat",
    'image': 'images/3.jpg',
    'description': '''
      Ruby is affectionate and enjoys cuddling, making her a favorite among family members. 
      She needs regular grooming to keep her coat looking beautiful.
    '''
   ,'wedith':'34kg'
  },
];
  
 
   List<Map<String,dynamic>> FilteredCats=[];
  //  TextEditingController  t=TextEditingController();

  String SearcWord='';

   @override
  void initState(){
    super.initState();
    FilteredCats=cats;
  }

  void UpdteSearch(String value){
    setState(() {
   
     FilteredCats=cats.where((cat)=>cat['name'].toLowerCase().contains(value.toLowerCase()) ||
     cat['age'].toString() .contains(value.toLowerCase()) ||
     cat['type'].toLowerCase().contains(value.toLowerCase())).toList();

    }
    );
    
  }
  @override
  Widget build(BuildContext context) {

  
  double ScreenWidth=MediaQuery.of(context).size.width;

    
 Widget KindWidget(String imagePath,String text,[Color color = const  Color(0xFFF5EDE2)]){
  
     return   Container(
                width: 135,
                height: 65,
                decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                style:BorderStyle.solid,
                color: const Color.fromARGB(255, 145, 150, 139),
               )
             ),
              
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 2, 1, 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                    backgroundImage: AssetImage(imagePath,
                    ),
                   
                    ),
                     
                  const SizedBox(width: 5), 
                  Text(text,
                    style: const TextStyle(fontSize: 14 ),),
                  ],
                ),
              ),

              
            ) ;}

    Widget Card(Map<String,dynamic>cats){

     
                return GestureDetector( 
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PetProfile(name:cats['name'] ,type: cats['type'],age: cats['age'],Descrptions:cats['description'],wedith: cats['wedith'],)));
                  },child:  Container(
                                  width: 176,
                                  height: 225,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    border:Border.all(
                                      width: 0.1
                                    )
                                   
                                  ),
                          
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    
                                          ClipRRect(
                                           borderRadius:BorderRadius.circular(20),
                                           
                                          child: Image.asset(
                                                  cats['image'],
                                                   width: 180,
                                                   height: 125,
                                                 fit: BoxFit.cover,
                                                    ),
                                               ),
                                            
                                              
                                      Padding(
                                        padding:  const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text( cats['name'],
                                            style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),),
                                            
                                             const SizedBox(width:28,),
                                            Text( '${cats['age']} years',
                                            style: const TextStyle(
                                              fontSize: 15,
                                             
                                              color: Colors.black,
                                            ),),

                                        
                                          ],
                                        ),
                                      ),
                          
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(13, 8, 2, 2),
                                        
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          
                                          children: [
                                              Text( cats['type'],
                                            style: const TextStyle(
                                              fontSize: 15,
                                             
                                              color: Colors.black,
                                            ),),
                          
                                          ],),
                                      )
                          
                                    ]
                                  ),
                          
                                ));
                      
                             
                    
                  
                    
              
        
         
    }

   

    return 
     Scaffold(
       appBar: AppBar(backgroundColor: const Color(0xFFF5EDE2),
      ),
       drawer: const Drawer(
        surfaceTintColor: Colors.white, 
       ),

      body: Padding(
        padding:  EdgeInsets.all(ScreenWidth*0.05),

        child:SingleChildScrollView(   
          scrollDirection: Axis.vertical,
          child:
          Column(
          children: [
            TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon( Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Find Cat ",
                  hintStyle: const TextStyle(color: Colors.grey),
                 
                  enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white,
                  width: 2.0 ), borderRadius: BorderRadius.circular(30),),
                  focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color(0xFFF5EDE2),
                   width: 2.0), borderRadius: BorderRadius.circular(30))
                ),
                onChanged:(value)=>UpdteSearch(value)
                ),
               
             
             const SizedBox(height: 25,),
              
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:  Row(children: [
                 KindWidget("images/1.jpg","All",const Color(0xFFF9C971)) ,       
                 SizedBox(width: ScreenWidth*0.07,),  
                 KindWidget("images/15.jpg","American" ),
                 SizedBox(width: ScreenWidth*0.07,), 
                 KindWidget("images/12.jpg","Persian") ,
                 SizedBox(width: ScreenWidth*0.07,),
                 KindWidget("images/5.jpg","Turkish ") , 
                 SizedBox(width: ScreenWidth*0.07,),
                 KindWidget("images/9.jpg","Himalayan") ,
              ],),),
                const SizedBox(height: 25,),

              Padding(
                padding:const EdgeInsets.all(8.0),
                child: GridView.builder(shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 23,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9),
                  itemCount:FilteredCats.length,
                  itemBuilder: (context, index) {
                  
                    return Card(FilteredCats[index]);
                  },
                
                )),     
          ]
        
          ),

        ),
        ),


      

         
       );

         
   
  
  }
}

