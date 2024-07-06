import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatelessWidget {
  const CreateReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    resizeToAvoidBottomInset: false,
     appBar: AppBar(
     title: const Text('Create Review'),
     leading: IconButton(onPressed: () {
       Get.back();
     }, icon: const Icon(Icons.arrow_back_ios_new_rounded)
     ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
         children: [
          TextFormField(
           decoration: const InputDecoration(
            hintText: 'First Name'
           ),
          ),
          const SizedBox(
           height: 20,
          ),
            TextFormField(
           decoration: const InputDecoration(
            hintText: 'Last Name'
           ),
          ),
          const SizedBox(
           height: 20,
          ),
            TextFormField(
            maxLines: 8,
           decoration: const InputDecoration(
            hintText: 'Write Review'
          
           ),
          ),
          const SizedBox(
           height: 15,
          ),
        
          SizedBox(
          width: double.infinity,
            child: ElevatedButton(
            style: const ButtonStyle(
             elevation: WidgetStatePropertyAll(0)
            ),
            onPressed: () {
              
            }, child: const Text('Submit')),
          )
         ],
        ),
      ),
    );
  }
}