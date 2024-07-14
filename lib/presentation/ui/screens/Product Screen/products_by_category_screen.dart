import 'package:crafty_bay/presentation/ui/screens/Product%20Screen/Controller/product_by_category_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_item_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsByCategoryScreen extends StatefulWidget {
  const ProductsByCategoryScreen({super.key});

  @override
  State<ProductsByCategoryScreen> createState() =>
      _ProductsByCategoryScreenState();
}

class _ProductsByCategoryScreenState extends State<ProductsByCategoryScreen> {
  dynamic argumentData = Get.arguments;

  @override
  void initState() {
    // TODO: implement initState
    Get.find<ProductByCategoryController>()
        .getProductByCategory(id: argumentData['categoryId']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${argumentData['categoryTitle']}'),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: GetBuilder<ProductByCategoryController>(
        builder: (productbyCateController) => Visibility(
          visible: productbyCateController.isLoading == false,
          replacement: const Center(child: CircularProgressIndicator()),
          child: GridView.builder(
            itemCount: productbyCateController
                    .productCardViewModelClass.productCardListData?.length ??
                0,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6.5,
                mainAxisSpacing: 10.5),
            itemBuilder: (context, index) {
              return FittedBox(
                  child: ProductItemCard(
                productCardListData: productbyCateController
                    .productCardViewModelClass.productCardListData![index],
              ));
            },
          ),
        ),
      ),
    );
  }
}
