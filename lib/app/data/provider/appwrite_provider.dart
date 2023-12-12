import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import '../../modules/utils/appwrite_constant.dart';


class AppWriteProvider {
  Client client = Client();
  Account? account;
  Storage? storage;
  Databases? databases;

  AppWriteProvider() {
    client
        .setEndpoint(AppWriteConstant.endPoint)
        .setProject(AppWriteConstant.projectId)
        .setSelfSigned(
            status:
                true); // For self signed certificates, only use for development
    account = Account(client);
    storage = Storage(client);
    databases = Databases(client);
  }

  Future<models.User> signup(Map map) async {
    final response = account!.create(
        userId: map["userId"],
        email: map["email"],
        password: map["password"],
        name: map["name"]);
    return response;
  }

  Future<models.Session> login(Map map) async {
    final response = account!.createEmailSession(
      email: map["email"],
      password: map["password"],
    );
    return response;
  }

  Future<dynamic> logout(String sessionId) async {
    final response = account!.deleteSession(sessionId: sessionId);
    return response;
  }

  Future<models.File> uploadProductImage(String imagePath) {
    String fileName = "${DateTime.now().millisecondsSinceEpoch}.${imagePath.split(".").last}";
    final response = storage!.createFile(
        bucketId: AppWriteConstant.imagesBucket,
        fileId: ID.unique(),
        file: InputFile.fromPath(path: imagePath, filename: fileName));
    return response;
  }

  Future<dynamic> deleteProductImage(String fileId) {
    final response = storage!
        .deleteFile(bucketId: AppWriteConstant.imagesBucket, fileId: fileId);
    return response;
  }

  Future<models.Document> createProduct(Map map) async {
    final response = databases!.createDocument(
        databaseId: AppWriteConstant.databaseId,
        collectionId: AppWriteConstant.productsCollection,
        documentId: ID.unique(),
        data: {
          "name": map["name"],
          "description": map["description"],
          "image": map["image"],
          "price": map["price"],
        });
    return response;
  }

  Future<models.DocumentList> getProduct() async {
    final response = databases!.listDocuments(
        databaseId: AppWriteConstant.databaseId,
        collectionId: AppWriteConstant.productsCollection);
    return response;
  }

  Future<models.Document> updateProduct(Map map) async {
    final response = databases!.updateDocument(
        databaseId: AppWriteConstant.databaseId,
        collectionId: AppWriteConstant.productsCollection,
        documentId: map["documentId"],
        data: {
          "name": map["name"],
          "description": map["description"],
          "image": map["image"],
          "price": map["price"],
        });
    return response;
  }
}
