
import 'package:e_commerce_app/features/shop/models/banners_model.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/constans/images.dart';

class SDummyData {
  /// List of all Banners

  static final List<BannerModel> banner = [
    BannerModel(imageUrl: SImages.homeBanner1, targetScreen: SRoutes.order, active: true),
    BannerModel(imageUrl: SImages.homeBanner2, targetScreen: SRoutes.cart, active: true),
    BannerModel(imageUrl: SImages.homeBanner3, targetScreen: SRoutes.wishlist, active: true),
    BannerModel(imageUrl: SImages.homeBanner4, targetScreen: SRoutes.productDetail, active: true),
    BannerModel(imageUrl: SImages.homeBanner5, targetScreen: SRoutes.profile, active: true),
  ];
  
  
  
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


  /// List of all Brands
  static final List<BrandModel> brands = [
    BrandModel(
        id: '1',
        image: SImages.nikeLogo,
        name: 'Nike',
        productsCount: 2,
        isFeatured: true),
    BrandModel(
        id: '2',
        image: SImages.adidasLogo,
        name: 'Adidas',
        productsCount: 2,
        isFeatured: true),
    BrandModel(
        id: '3',
        image: SImages.appleLogo,
        name: 'Apple',
        productsCount: 8,
        isFeatured: true),
    BrandModel(
        id: '4',
        image: SImages.bataLogo,
        name: 'Bata',
        productsCount: 4,
        isFeatured: true),
    BrandModel(
        id: '5',
        image: SImages.bloodyLogo,
        name: 'Bloody',
        productsCount: 9,
        isFeatured: false),
    BrandModel(
        id: '6',
        image: SImages.breakoutLogo,
        name: 'Breakout',
        productsCount: 7,
        isFeatured: true),
    BrandModel(
        id: '7',
        image: SImages.dariMoochLogo,
        name: 'Dari Mooch',
        productsCount: 4,
        isFeatured: true),
    BrandModel(
        id: '8',
        image: SImages.interWoodLogo,
        name: 'Interwood',
        productsCount: 9,
        isFeatured: false),
    BrandModel(
        id: '9',
        image: SImages.hpLogo,
        name: 'HP',
        productsCount: 4,
        isFeatured: false),
    BrandModel(
        id: '10',
        image: SImages.jLogo,
        name: 'J.',
        productsCount: 8,
        isFeatured: true),
    BrandModel(
        id: '11',
        image: SImages.nDURELogo,
        name: 'NDURE',
        productsCount: 4,
        isFeatured: true),
    BrandModel(
        id: '12',
        image: SImages.northStarLogo,
        name: 'NorthStar',
        productsCount: 2,
        isFeatured: true),
    BrandModel(
        id: '13',
        image: SImages.poloLogo,
        name: 'Polo',
        productsCount: 2,
        isFeatured: true),
  ];
}
