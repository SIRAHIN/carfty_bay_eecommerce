import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Fragments%20Controller/Cart%20Fragment%20Controller/cart_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Review%20Screen/review_list_screen.dart';
import 'package:crafty_bay/utils/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        elevation: 1,
        title: const Text("Cart"),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: GetBuilder<CartListController>(
      builder: (cartController) => 
         Visibility(
         visible: cartController.isLoading == false,
         replacement: const Center(child: CircularProgressIndicator()),
         // first Checking null then checking empty or not //
           child: cartController.cartModelClass.cartDataList == null || 
           cartController.cartModelClass.cartDataList!.isEmpty 
           ? const Center(child: Text("Not Product Added Yet")) :
            Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.all(5.0),
                   child: ListView.separated(
                         itemCount: cartController.cartModelClass.cartDataList?.length ?? 0,
                         shrinkWrap: true,
                         primary: false,
                         itemBuilder: (context, index) {
                        var cartProductDetails = cartController.cartModelClass.cartDataList![index]; 
                           return Card(
                           color: Colors.white,
                           elevation: 1,
                           shape: Border.all(
                           width: .1,
                           color: Colors.grey,
                           ),
                             child: ListTile(
                             leading: Image.network(cartProductDetails.product?.image ?? 'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp'),
                             title:  Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisSize: MainAxisSize.min,
                             children: [
                              Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   
                                children: [
                                  Column(
                 
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Text(cartProductDetails.email ?? '', style: const TextStyle(
                                       fontSize: 15,
                                       fontWeight: FontWeight.w600
                                      ),),
                                      Text('color:${cartProductDetails.color}, Size: ${cartProductDetails.size}', style: Theme.of(context).textTheme.titleSmall,),
                                    ],
                                  ),
                                
                                // Delete Btn Section 
                                  InkWell(
                                 onTap: () {
                                   cartController.deleteItemFromCartById(cartProductDetails.productId.toString());
                                 },
                                 child: const Icon(Icons.delete_outline_rounded),
                                 )
                                ],
                              )
                             ],
                             ),
                             subtitle: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                 children: [
                                   const SizedBox(height: 10,),
                                   Text('\$${cartProductDetails.product?.price ??'0.0'}', style: Theme.of(context).textTheme.labelSmall,),
                                 ],
                               ),
                             
                  
                             //Add and Remove Btn Section //
                               Row(
                                 children: [
                                   InkWell(
                                   onTap: () {
                                     
                                   },
                                     child: Container(
                                     alignment: Alignment.center,
                                     height: 20,
                                     width: 20,
                                     decoration: BoxDecoration(
                                     color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(5)
                                     ),
                                       child: const Icon(Icons.remove,
                                       color: Colors.white, size: 12,
                                       ),
                                     ),
                                   ),
                                    const Padding(
                                     padding: EdgeInsets.symmetric(horizontal: 4),
                                     child: Text('01'),
                                   ),
                                   InkWell(
                                   onTap: () {
                                     
                                   },
                                     child: Container(
                                     alignment: Alignment.center,
                                     height: 20,
                                     width: 20,
                                     decoration: BoxDecoration(
                                     color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(5)
                                     ),
                                       child: const Icon(Icons.add,
                                       color: Colors.white, size: 12,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             
                              ],
                             ),
                             ),
                           );
                         },
                         separatorBuilder: (context, index) {
                           return const SizedBox(
                             height: 2,
                           );
                         },
                         ),
                 ),
               ),
               
               // Bottom Section //
               Container(
                 height: 80,
                 width: double.infinity,
                 decoration: BoxDecoration(
                     borderRadius: const BorderRadius.only(
                         topLeft: Radius.circular(30),
                         topRight: Radius.circular(30)),
                     color: AppColors.primaryColor.withOpacity(0.2)),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 30),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       const Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Total Price'),
                           Text(
                             '\$100,000.00',
                             style: TextStyle(
                                 fontSize: 15,
                                 fontWeight: FontWeight.w600,
                                 color: AppColors.primaryColor),
                           ),
                         ],
                       ),
                       ClipRRect(
                         borderRadius: BorderRadius.circular(10),
                         child: SizedBox(
                           width: 130,
                           child: ElevatedButton(
                               style: const ButtonStyle(
                                   elevation: WidgetStatePropertyAll(0)),
                               onPressed: () {
                               Get.to(const ReviewListScreen());
                               },
                               child: const Text("Checkout")),
                         ),
                       )
                     ],
                   ),
                 ),
               )
             ],
           ),
         ),
      ),
    );
  }
}
