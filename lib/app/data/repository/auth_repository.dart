import 'package:appwrite/models.dart' as models;
import '../provider/appwrite_provider.dart';

class AuthRepository {
  final AppWriteProvider appWriteProvider;
  AuthRepository(this.appWriteProvider);

  Future<models.User> signup(Map map) => appWriteProvider.signup(map);
  Future<models.Session> login(Map map) => appWriteProvider.login(map);
  Future<dynamic> logout(String sessionId) =>
      appWriteProvider.logout(sessionId);
  Future<models.File> uploadProductImage(String imagePath) =>
      appWriteProvider.uploadProductImage(imagePath);
  Future<dynamic> deleteProductImage(String fileId) =>
      appWriteProvider.deleteProductImage(fileId);
  Future<models.Document> createProduct(Map map) =>
      appWriteProvider.createProduct(map);
  Future<models.DocumentList> getProduct() => appWriteProvider.getProduct();
  Future<models.Document> updateProduct(Map map) =>
      appWriteProvider.updateProduct(map);
}
