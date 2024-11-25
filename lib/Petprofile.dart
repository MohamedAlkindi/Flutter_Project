import 'package:flutter/material.dart';
class PetProfile extends StatelessWidget {
  final String name;

  final int age ;
  final String type;
  final String Descrptions;
  final String wedith;
  const PetProfile({super.key, required this.name, required this.age, required this.type, required this.Descrptions, required this.wedith});

  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        backgroundColor: Color(0xFFF5EDE2),
       appBar: AppBar(
        backgroundColor: Color(0xFFF5EDE2),
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: Text('cat profile',style: TextStyle(color: Colors.black,),)
        
        ,
        ),
        
     
       body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Stack(
                children:[ CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 230, 100, 49),
                  radius: 180,
                  child: CircleAvatar(
                    backgroundColor:Color.fromARGB(255, 218, 131, 97),
                  radius: 160,
                
                  ),
                  
                ),
                Positioned(child: 
                
                
                Image.asset('images/s.png',width:450 ,height:450,),
                left: -50,
                bottom: -40,
                )
                
                ]
              ),
              SizedBox(
                height: 16,
              ),
              Text(name,style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),)
              ,
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 8,
              ),
             
             
              SizedBox(height: 16,),
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            bulidinfoCard('${age}', 'Puppy',Icons.pets),
            
            bulidinfoCard(wedith, 'wedih',Icons.monitor_weight_rounded),
            bulidinfoCard(type, 'type',Icons.female),
            
          ],

              ),
              SizedBox(height: 24),
              // العنوان والوصف
              Align(
                alignment: Alignment.center,
                child: Text(
                  'About ${name}',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  Descrptions,
                  style: TextStyle(fontSize: 17, color: const Color.fromARGB(255, 11, 2, 2)),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 90, vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(300),
                  ),
                  backgroundColor:Color.fromARGB(255, 230, 100, 49),
                ),
                child: Text(
                  'Adopt Me',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),

            ],

          ),
        ),
       ),
      );
    
  }
}
Widget bulidinfoCard(String value,String label,IconData i){
  return Column(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundColor: Color.fromARGB(255, 230, 100, 49),
        child: Icon(i,color: const Color.fromARGB(255, 253, 253, 253),size: 30,),
      ),
       SizedBox(
        height: 6,
      ),
      Text(value,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
      SizedBox(
        height: 8,
      ),
      Text(label,style: TextStyle(fontSize: 16,color: const Color.fromARGB(255, 237, 106, 6)),)
    ],
  );
}