import 'package:crafty_bay/presentation/ui/screens/Review%20Screen/Controller/create_review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatelessWidget {
  final String productId;

  CreateReviewScreen({super.key, required this.productId});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Create Review'),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Give Your Review Descripton first';
                  }
                  return null;
                },
                maxLines: 3,
                controller: Get.find<CreateReviewController>()
                    .productDesriptionController,
                decoration: const InputDecoration(hintText: 'Description'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Give Your Rating first';
                  }
                  return null;
                },
                controller: Get.find<CreateReviewController>().ratingController,
                decoration: const InputDecoration(hintText: 'Rating'),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: GetBuilder<CreateReviewController>(
                  builder: (controller) => Visibility(
                    replacement:
                        const Center(child: CircularProgressIndicator()),
                    visible: controller.isLoading == false,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            elevation: WidgetStatePropertyAll(0)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            bool isSuccess = await controller
                                .createReviewByProdcutId(productId);
                            if (isSuccess) {
                              Get.snackbar(
                                  "Success", "Your Review Added Successfully");
                            } else {
                              Get.snackbar("O0ps",
                                  "Your Review Can't Added Successfully");
                            }
                          }
                        },
                        child: const Text('Submit')),
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
