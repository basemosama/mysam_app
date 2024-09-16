part of '../imports/login_imports.dart';

///Login controller to setup data to the ui.
class LoginController extends GetxController {
  final authRepository = AuthRepository();

  final isLoading = false.obs;
  final hidePassword = true.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isEmailValid = false.obs;
  final isPasswordValid = false.obs;

  final isFormValid = false.obs;
  Worker? _validationWorker;

  final RxBool saveLoginInfo = false.obs;

  final Rxn<LoginMethod> currentLoginMethod = Rxn();
  final loginMethods = <LoginMethod>[
    LoginMethod.email,
    LoginMethod.google,
    LoginMethod.apple,
  ];

  @override
  void onInit() {
    if (kDebugMode) {
      // emailController.text = 'bbbb@mail.com';
      // passwordController.text = '123456';
      // isEmailValid.value = true;
      // isPasswordValid.value = true;
      // isFormValid.value = true;
    }
    super.onInit();
    listenToValidationState();
    checkLoginInfo();
  }

  Future<void> checkLoginInfo() async {
    final loginInfo = await authRepository.getLoginInfo();
    emailController.text = loginInfo.email ?? '';
    passwordController.text = loginInfo.password ?? '';
    saveLoginInfo.value = loginInfo.email != null && loginInfo.password != null;
  }

  void listenToValidationState() {
    _validationWorker = everAll([
      isEmailValid,
      isPasswordValid,
    ], (callback) {
      final isValid = isEmailValid.value && isPasswordValid.value;
      isFormValid.value = isValid;
    });
  }

  Future<void> loginBy({required LoginMethod method}) async {
    currentLoginMethod.value = method;
    if (method == LoginMethod.email) {
      currentLoginMethod.value = LoginMethod.email;
    } else {
      currentLoginMethod.value = null;
      isLoading.value = true;
      final result = await authRepository.loginViaAuth0(method: method);
      result.when(
        success: (User user) async {
          isLoading.value = false;

          _navigateToHome();
        },
        error: (NetworkException exception) {
          isLoading.value = false;
          Alert.error(message: exception.message);
        },
      );
    }
  }

  Future<void> login() async {
    if (!isFormValid()) return;
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    final result = await authRepository.loginViaEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    result.when(
      success: (User user) async {
        isLoading.value = false;
        if (saveLoginInfo.value) {
          await authRepository.saveLoginInfo(
            email: emailController.text,
            password: passwordController.text,
          );
        }
        _navigateToHome();
      },
      error: (NetworkException exception) {
        isLoading.value = false;
        Alert.error(message: exception.message);
      },
    );
  }

  void _navigateToHome() {
    Get.find<CustomBottomNavigationController>().getUserInfo();
    AppNavigation.navigateFromLoginToHome();
  }

  void navigateToRegister() {
    AppNavigation.navigateFromLoginToRegister();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    _validationWorker?.dispose();
    super.onClose();
  }
}
