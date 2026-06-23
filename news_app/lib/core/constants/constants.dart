import 'package:flutter_dotenv/flutter_dotenv.dart';

const String apiBaseUrl = 'https://newsapi.org/v2';
final String apiKey = dotenv.get('API_KEY');
const String apiCountryQuery = 'us';
const String apiCategoryQuery = 'general';
