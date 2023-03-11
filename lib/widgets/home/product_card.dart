
// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/models/product.dart';
import 'package:flutter/material.dart';






class productCard extends StatelessWidget {
  const productCard({
     super.key,
     required this.itemIndex, 
     required this.product, 
     required this.press,
  });

  final int itemIndex;
  final Product  product ;
  final VoidCallback  press ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      
      height: 190,
      

        child: InkWell(
          onTap: press,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [

            //all container 
            Container(
              height: 166,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0,15),
                    blurRadius: 30, 
                    color:  Colors.black26,
                  ),
                ]
              ),
             
            ),


            //image container 
            Positioned(
              top: 0.0,
              left:0.0,
              child: Container(
                 alignment: Alignment.topRight,
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 160,
              width: 200,
              child: Image.asset(
                product.image,
                 fit: BoxFit.cover,
                 ),
              
            )),
              
              //title container 
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
              height: 136 ,
              width: size.width -200 ,
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children :[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:kDefaultPadding),
                    child: Text(
                      product.title,
                      style: Theme.of(context).textTheme.bodyLarge,
                      ),
                  ),
              
              
              //subtitle container 
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      
                      product.subTitle,
                      style: Theme.of(context).textTheme.bodySmall,
                      ),
                  ),
              
              //price container 
                  Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding*0.8,
                        vertical: kDefaultPadding/5, 
                        ),
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Text('price:\$${product.price}'),
                        
                  
                    ),
                  )
                ]
              ),
              )
            )
            
          ],),
        ),
      
    );
  }
}