class Product {
  final int id , price ;
  final String  title ,subTitle , description , image ;

  Product(
    {
    required this.id,
    required this.price,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.image,
  });
}
//liste of products
List<Product> products = [
    Product( 
    id: 1,
    price : 20 ,
    title: 'nom du produit',
    subTitle: 'subTitle  bla bla',
    image:'icons/shop.png' ,
    description: 'description description description description description ' , 
  ),
    Product(
    id: 2,
    price : 700 ,
    title: 'nom du produit',
    subTitle: 'sous-titre du produit',
    image:'images/p1.png',
    description: 'description description description description description ' , 
  ),
    Product(
    id: 3,
    price : 99 ,
    title: 'nom du produit ',
    subTitle: 'sous-titre du produit',
    image:'images/p2.png' ,
    description: 'description description description description description ' , 
  ),
    Product( 
    id: 4,
    price : 10,
    title: 'nom du produit ',
    subTitle: 'sous-titre du produit',
    image:'images/c.png' ,
    description: 'description description description description description ' , 
  ),
    Product(
    id: 5,
    price : 590 ,
    title: 'nom du produit  ',
    subTitle: ' sous-titre du produit ',
    image:'images/p3.png' ,
    description: 'description description description description description ' , 
  ),
    Product(
    id: 6,
    price : 19 ,
    title: 'nom du produit ',
    subTitle: 'sous-titre du produit',
    image:'images/hive.png' ,
    description: 'description description description description description ' , 
  ),
    Product(
    id: 7,
    price : 21 ,
    title: 'nom du produit ',
    subTitle: 'sous-titre du produit',
    image:'images/p6.png' ,
    description: 'description description description description description ' , 
  ),
  
  

];