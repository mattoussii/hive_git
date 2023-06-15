// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, prefer_const_constructors_in_immutables
import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/models/product.dart';
import 'package:firebase_auth_app/screens/shop/shop_screens_body/shop_details_screen.dart';
import 'package:firebase_auth_app/screens/shop/shopWidgets/product_card.dart';
import 'package:flutter/material.dart';


class homeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return SafeArea( 
      bottom: false,
      child: Column(children: [
        SizedBox(height: kDefaultPadding / 2,),


        Expanded(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top : 70),
                decoration:BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )
                ),
              ),


          ListView.builder(
            itemCount: products.length,
            itemBuilder :(context , index) => productCard(
              itemIndex: index,
              product: products[index], 

              
              press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:(context) => DetailsScreen(
                      product:products[index] ,
                    ),
                  ),
                );
              },
            ),
          ),
        ],

        ),
        ),

       ],
       ),  
    );
  }
}

