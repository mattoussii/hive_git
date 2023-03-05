 // ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

 import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/models/product.dart';
import 'package:firebase_auth_app/widgets/details/color_dot.dart';
import 'package:firebase_auth_app/widgets/details/product_image.dart';
import 'package:flutter/material.dart';



 class DetailsBody extends StatelessWidget {
  final Product product ;
  const DetailsBody({super.key, required this.product});




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding*1.5),
          
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
              ), 
            ),

 


            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Center(
                child: productImage(
                  size: size, 
                  image: product.image,
                   ),
              ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      colorDot(
                        fillColor: kTextLightColor,
                        isSelected: true,
                      ),
                       colorDot(
                        fillColor: Colors.blue,
                        isSelected: false,
                      ),
                       colorDot(
                        fillColor: Colors.red,
                        isSelected: false,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Text(
                    product.title,
                    style: Theme.of(context).textTheme.titleLarge,
                    ),
                ),
                Text('price :\$${product.price}', 
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color:kSecondaryColor,
                ),
                ),
                SizedBox(height: kDefaultPadding,)
            ]),
        ),

        Container(
          margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          padding:EdgeInsets.symmetric(
            horizontal: kDefaultPadding*1.5,
            vertical: kDefaultPadding / 2,
            ) ,
          child: Text(
            product.description,
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 19),
          

        ),)
      ],
    );
  }
}




