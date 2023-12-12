import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/models/product_model.dart';
import '../../data/repository/auth_repository.dart';
import '../../routes/app_pages.dart';
import '../utils/snackbar.dart';

class HomeController extends GetxController with StateMixin<List<Product>> {
  AuthRepository authRepository;
  HomeController(this.authRepository);
  late List<Product> productList = [];
  final GetStorage _getStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getProduct();
  }

  @override
  void onClose() {
    super.onClose();
  }

  logout() async {
    try {
      await authRepository.logout(_getStorage.read("sessionId")).then((value) {
        _getStorage.erase();
        Get.offAllNamed(Routes.login);
      });
    } catch (e) {
      CustomSnackBar.showErrorSnackBar(
          context: Get.context, title: "error", message: "Something error");
    }
  }

  getProduct() async {
    try {
      change(null, status: RxStatus.loading());
      await authRepository.getProduct().then((value) {
        Map<String, dynamic> data = value.toMap();
        List d = data['documents'].toList();
        productList = d
            .map(
              (e) => Product.fromMap(e['data']),
            )
            .toList();
        change(productList, status: RxStatus.success());
      }).catchError((error) {
        if (error is AppwriteException) {
          change(null, status: RxStatus.error(error.response['message']));
        } else {
          change(null, status: RxStatus.error("Something error"));
        }
      });
    } catch (e) {
      change(null, status: RxStatus.error("Something error"));
    }
  }
}
