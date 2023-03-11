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
    title: 'product name ',
    subTitle: 'subTitle  bla bla',
    image:'icons/love.png' ,
    description: 'description bla bla bla bla bla bla' , 
  ),
    Product(
    id: 2,
    price : 700 ,
    title: 'product name ',
    subTitle: 'subTitle  bla bla',
    image:'images/p1.png',
    description: 'description bla bla bla bla bla bla' , 
  ),
    Product(
    id: 3,
    price : 99 ,
    title: 'product name ',
    subTitle: 'subTitle  bla bla',
    image:'images/p2.png' ,
    description: 'description bla bla bla bla bla bla' , 
  ),
    Product( 
    id: 4,
    price : 10,
    title: 'ruche ',
    subTitle: 'subTitle  bla bla',
    image:'images/c.png' ,
    description: 'description bla bla bla bla bla bla' , 
  ),
    Product(
    id: 5,
    price : 590 ,
    title: 'product name  ',
    subTitle: ' subTitle  bla bla ',
    image:'images/p3.png' ,
    description: 'description bla bla bla bla bla bla' , 
  ),
    Product(
    id: 6,
    price : 19 ,
    title: 'product name ',
    subTitle: 'subTitle  bla bla',
    image:'images/hive.png' ,
    description: 'description bla bla bla bla bla bla' , 
  ),
    Product(
    id: 7,
    price : 21 ,
    title: 'product name ',
    subTitle: 'subTitle  bla bla',
    image:'images/p6.png' ,
    description: 'description bla bla bla bla bla bla' , 
  ),
  
  

];