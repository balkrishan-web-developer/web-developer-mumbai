class StoreModel {
  final String id;
  final String name;
  final String logoUrl;
  final String category;
  final String cashbackRate;
  final String affiliateBaseUrl;
  final String description;
  final List<String> terms;
  final bool isPopular;

  StoreModel({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.category,
    required this.cashbackRate,
    required this.affiliateBaseUrl,
    required this.description,
    required this.terms,
    this.isPopular = false,
  });

  /// Generates the affiliate URL with user sub-ID for cashback tracking
  String getTrackingUrl(String userId) {
    final Uri uri = Uri.parse(affiliateBaseUrl);
    final Map<String, String> params = Map.from(uri.queryParameters);
    params['subid'] = userId;
    params['utm_source'] = 'shopcash_app';
    return uri.replace(queryParameters: params).toString();
  }
}

final List<StoreModel> sampleStores = [
  StoreModel(
    id: 'amazon',
    name: 'Amazon India',
    logoUrl: 'https://upload.wikimedia.org/wikipedia/commons/a/a9/Amazon_logo.svg',
    category: 'Electronics & All',
    cashbackRate: 'Up to 6.5% Rewards',
    affiliateBaseUrl: 'https://www.amazon.in/?tag=shopcash-21',
    description: 'Earn real cashback on Electronics, Fashion, Home Decor & Daily Essentials.',
    terms: [
      'Cashback tracked within 24-48 hours',
      'No cashback on Amazon Pay Balance recharges',
      'Cashback confirms after 30 days of return window expiry',
    ],
    isPopular: true,
  ),
  StoreModel(
    id: 'flipkart',
    name: 'Flipkart',
    logoUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Flipkart_logo.svg',
    category: 'Fashion & Mobiles',
    cashbackRate: 'Flat 8.0% Cashback',
    affiliateBaseUrl: 'https://www.flipkart.com/?affid=shopcash',
    description: 'Best deals on Smart Mobiles, Laptops, Clothing & Appliances.',
    terms: [
      'Cashback tracked within 24 hours',
      'Applicable on desktop & mobile website orders',
      'Confirmation time: 45 days',
    ],
    isPopular: true,
  ),
  StoreModel(
    id: 'ajio',
    name: 'AJIO',
    logoUrl: 'https://assets.ajio.com/static/img/Ajio-Logo.svg',
    category: 'Fashion & Brands',
    cashbackRate: 'Flat 12.0% Cashback',
    affiliateBaseUrl: 'https://www.ajio.com/?utm_source=cuelinks',
    description: 'Top international brands, clothes, shoes & accessories at discount.',
    terms: [
      'High commission on all fashion categories',
      'Tracking within 12 hours',
      'Confirmation time: 30 days',
    ],
    isPopular: true,
  ),
  StoreModel(
    id: 'myntra',
    name: 'Myntra',
    logoUrl: 'https://upload.wikimedia.org/wikipedia/commons/d/d5/Myntra_logo.png',
    category: 'Lifestyle',
    cashbackRate: 'Up to 9.5% Cashback',
    affiliateBaseUrl: 'https://www.myntra.com/?aff=shopcash',
    description: 'Trending ethnic wear, sneakers, jackets & beauty products.',
    terms: [
      'Cashback tracked within 24 hours',
      'Valid for both new & existing Myntra users',
    ],
    isPopular: true,
  ),
];
