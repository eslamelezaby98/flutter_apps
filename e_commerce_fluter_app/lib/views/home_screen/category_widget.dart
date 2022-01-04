import 'package:e_commerce_fluter_app/data/dummy_data.dart/category_dummy_data.dart';
import 'package:e_commerce_fluter_app/helper/color_manager.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 12,
      width: size.width,
      // color: Colors.black,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: CategoryDummyData.categoryList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              //! !# change color of border.
              //! change body to catgory.
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height / 9,
                width: size.width / 3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: ColorManager.secondColor,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Image(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        CategoryDummyData.categoryList[index].image,
                      ),
                    ),
                    Text(
                      CategoryDummyData.categoryList[index].name,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}