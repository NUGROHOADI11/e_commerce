class AppWriteConstant {
  static const String databaseId = "656bd280d265e89759a4";
  static const String projectId = "65694635ef35f1a85243";
  static const String endPoint = "https://cloud.appwrite.io/v1";

  static const String usersCollection = "656bd294b68402ddd05f";
  static const String productsCollection = "656be72f34e9854c4d09";

  static const String imagesBucket = "656c59a446175de1c80e";

  static String imageUrl(String imageId) =>
      "$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId";
}
