import 'package:crafty_bay/presentation/ui/screens/Review%20Screen/Controller/review_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Review%20Screen/create_review_screen.dart';
import 'package:crafty_bay/utils/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewListScreen extends StatefulWidget {
  final String productID;

  const ReviewListScreen({super.key, required this.productID});

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Get.find<ReviewListController>()
        .getReviwListByProductId(productID: widget.productID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text("Reviews"),
      ),
      body: GetBuilder<ReviewListController>(
        builder: (reviewListController) => Visibility(
          replacement: const Center(child: CircularProgressIndicator()),
          visible: reviewListController.isLoading == false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListView.separated(
                itemCount: reviewListController
                        .reviewModelData.reviewDataList?.length ??
                    0,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var itemOfReviewData = reviewListController
                      .reviewModelData.reviewDataList![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                        color: Colors.white,
                        elevation: 1,
                        shape: Border.all(
                          width: .1,
                          color: Colors.grey,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                        radius: 15,
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.2),
                                        child: const Icon(
                                          Icons.person_outline_sharp,
                                          color: Colors.black,
                                          size: 20,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        itemOfReviewData.profile?.cusName ?? "",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  itemOfReviewData.description ?? "",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  itemOfReviewData.rating ?? "",
                                  style: Theme.of(context).textTheme.labelSmall,
                                )
                              ]),
                        )),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 0,
                  );
                },
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reviews (1000)',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                        child: FloatingActionButton(
                          elevation: 2,
                          shape: const CircleBorder(),
                          backgroundColor: AppColors.primaryColor,
                          onPressed: () {
                            Get.to(CreateReviewScreen(
                              productId: widget.productID,
                            ));
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
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
