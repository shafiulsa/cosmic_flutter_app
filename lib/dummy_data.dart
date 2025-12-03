
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/utils/constans/images.dart';

class SDummyData {

  /// List of all Categories
  static final List<CategoryModel> categories = [
    /// Parent Categories
    CategoryModel(id: '1', name: 'Clothes', image: SImages.clothesIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Shoes', image: SImages.shoesIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Cosmetics', image: SImages.cosmeticsIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Electronics', image: SImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Furniture', image: SImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Sports', image: SImages.sportsIcon, isFeatured: true),

    /// Clothes
    CategoryModel(id: '7', name: 'Shirts', image: SImages.shirtIcon, parentId: '1'),
    CategoryModel(id: '8', name: 'Jackets', image: SImages.jacketsIcon, parentId: '1'),
    CategoryModel(id: '9', name: 'Shorts', image: SImages.shortsIcon, parentId: '1'),

    /// Shoes
    CategoryModel(id: '10', name: 'Formal Shoes', image: SImages.formalShoesIcon, parentId: '2'),
    CategoryModel(id: '11', name: 'Sports Shoes', image: SImages.sportsShoesIcon, parentId: '2'),

    /// Cosmetics
    CategoryModel(id: '12', name: 'Face', image: SImages.faceIcon, parentId: '3'),
    CategoryModel(id: '13', name: 'Hair Oils', image: SImages.hairOilIcon, parentId: '3'),
    CategoryModel(id: '14', name: 'Bags', image: SImages.bagsIcon, parentId: '3'),
    CategoryModel(id: '15', name: 'Perfumes', image: SImages.perfumeIcon, parentId: '3'),
    CategoryModel(id: '16', name: 'Watches', image: SImages.watchIcon, parentId: '3'),

    /// Electronics
    CategoryModel(id: '17', name: 'Gadgets', image: SImages.gadgetsIcon, parentId: '4', isFeatured: false),
    CategoryModel(id: '18', name: 'Laptops', image: SImages.laptopsIcon, parentId: '4', isFeatured: false),
    CategoryModel(id: '19', name: 'Mobiles', image: SImages.mobileIcon, parentId: '4', isFeatured: false),

    /// Furniture
    CategoryModel(id: '20', name: 'Bed', image: SImages.bedIcon, parentId: '5', isFeatured: false),
    CategoryModel(id: '21', name: 'Lamps', image: SImages.lampIcon, parentId: '5', isFeatured: false),

    /// Sports
    CategoryModel(id: '22', name: 'Cricket', image: SImages.cricketIcon, parentId: '6', isFeatured: false),
    CategoryModel(id: '23', name: 'Soccer', image: SImages.soccerIcon, parentId: '6', isFeatured: false),
  ];

}
