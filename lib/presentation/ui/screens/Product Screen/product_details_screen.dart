import 'package:crafty_bay/presentation/ui/screens/Product%20Screen/Controller/product_add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Product%20Screen/Controller/product_details_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Product%20Screen/widgets/product_bannerSlider.dart';
import 'package:crafty_bay/routes/routes_name.dart';
import 'package:crafty_bay/utils/utility/Shared%20Preferences/app_stored_data.dart';
import 'package:crafty_bay/utils/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({super.key, required this.productId});

  String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        Get.find<ProductDetailsController>()
            .getProductDetailsByProductId(id: widget.productId);
        // before add to cart check the token for verifying user login status //
       // await AppStoredData().initalCheckUserStoredData();
      },
    );

    super.initState();
  }

  String? selectedcolorName;
  String? selectedsizeValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Details"),
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        body: GetBuilder<ProductDetailsController>(
            builder: (productDetailsController) {
          var porductDetailsData = productDetailsController
              .productDetailsModelClass.productDetailsListData?[0];
          return Visibility(
            visible: Get.find<ProductDetailsController>().isLoading == false,
            replacement: const Center(child: CircularProgressIndicator()),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Banner Slider Section //
                  ProductDetailsBanner(
                    imgUrl: [
                      porductDetailsData?.img1 ?? '',
                      porductDetailsData?.img2 ?? '',
                      porductDetailsData?.img3 ?? '',
                      porductDetailsData?.img4 ?? '',
                    ],
                  ),

                  // Main Body Section //
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Product Title //
                            Expanded(
                                child: Text(
                              // TODO : Change this formate //
                              porductDetailsData?.product?.title.toString() ??
                                  '',

                              style: Theme.of(context).textTheme.titleMedium,
                              maxLines: 2,
                            )),

                            // Add and Remove Btn Section //
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  child: Text('01'),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        // Rating and Reviews Section //
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text(
                                    "${porductDetailsData?.product?.star.toString().substring(0, 3)}"),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {},
                                child: Text(
                                  "Reviews",
                                  style: Theme.of(context).textTheme.labelSmall,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            const CircleAvatar(
                              radius: 10,
                              backgroundColor: AppColors.primaryColor,
                              child: Icon(
                                Icons.favorite,
                                size: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        // Color Section //
                        const Text(
                          "Color",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),

                        SizedBox(
                          height: 40,
                          child: GetBuilder<ProductDetailsController>(
                            builder: (productDetailsController) => ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 10,
                              ),
                              itemCount: porductDetailsData?.color
                                      ?.split(',')
                                      .toList()
                                      .length ??
                                  0,
                              shrinkWrap: true,
                              primary: false,
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                // From Color String using Split for making List of Color  //
                                var colorCodeList = porductDetailsData?.color
                                    ?.split(',')
                                    .toList();
                                // assigning the selected color //
                                selectedcolorName = colorCodeList![
                                    productDetailsController.currentColorIndex];

                                // convert the Hex Color into Color object //
                                Color decodedColor = productDetailsController
                                    .hexToColor(colorCodeList[index]);

                                return GestureDetector(
                                  onTap: () {
                                    productDetailsController.changeColorIndex(index);
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: decodedColor,
                                    radius: 16,
                                    child: productDetailsController.currentColorIndex == index
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 18,
                                          )
                                        : const SizedBox(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        // Size Section //
                        const Text(
                          "Size",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),

                        SizedBox(
                          height: 40,
                          child: GetBuilder<ProductDetailsController>(
                            builder: (controller) => ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 10,
                              ),
                              itemCount: porductDetailsData?.size
                                      ?.split(',')
                                      .toList()
                                      .length ??
                                  0,
                              shrinkWrap: true,
                              primary: false,
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                // splitng the string value into list
                                var sizeChartData = porductDetailsData?.size
                                    ?.split(',')
                                    .toList();
                                selectedsizeValue =
                                    sizeChartData![controller.currentSizeIndex];

                                return GestureDetector(
                                  onTap: () {
                                    controller.changeSizeIndex(index);
                                  },
                                  child: CircleAvatar(
                                    backgroundColor:
                                        controller.currentSizeIndex == index
                                            ? AppColors.primaryColor
                                            : Colors.grey.withOpacity(0.2),
                                    radius: 20,
                                    child: Text(
                                      // here access the List of size value //
                                      sizeChartData[index],
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: controller.currentSizeIndex ==
                                                  index
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        // Description Section //
                        const SizedBox(
                          height: 15,
                        ),

                        Text(
                          'Descoption',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),

                        Text(porductDetailsData?.product?.shortDes.toString() ??
                            '')
                      ],
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Price'),
                              Text(
                                '\$${porductDetailsData?.product?.price.toString()}',
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryColor),
                              ),
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              width: 130,
                              child: GetBuilder<ProductAddToCartController>(
                                builder: (addToCartcontroller) => Visibility(
                                  visible:
                                      addToCartcontroller.isProgress == false,
                                  replacement: const Center(
                                      child: CircularProgressIndicator()),
                                  child: ElevatedButton(
                                      style: const ButtonStyle(
                                          elevation: WidgetStatePropertyAll(0)),
                                      onPressed: () async {
                                        if (selectedcolorName != null &&
                                            selectedsizeValue != null) {
                                          if (AppStoredData.token != null) {
                                            bool isSuccess =
                                                await addToCartcontroller
                                                    .addTOcart(
                                              int.parse(widget.productId),
                                              selectedcolorName.toString(),
                                              selectedsizeValue.toString(),
                                            );
                                            if (isSuccess) {
                                              Get.snackbar("Success",
                                                  "Your Product Added Successfully");
                                            } else {
                                              Get.snackbar("Failed",
                                                  "Add to cart Failed");
                                            }
                                          } else {
                                            Get.offAllNamed(
                                                RoutesName.verifyEmailScreen);
                                          }
                                        } else {
                                          Get.snackbar(
                                              'Failed', "Add to cart Failed");
                                        }

                                        // print(selectedcolorName);
                                        // print(selectedsizeValue);
                                        // Get.to(const ReviewListScreen());
                                      },
                                      child: const Text("Add to Cart")),
                                ),
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
          );
        }));
  }
}
