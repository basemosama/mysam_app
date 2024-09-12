part of '../imports/register_imports.dart';

class RegisterController extends GetxController {
  final isLoading = false.obs;
  final hidePassword = true.obs;
  final hideConfirmPassword = true.obs;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  /// This needed for text field that has complex ui like hide password button
  /// As using [TextInputAction.next] to move keyboard to next field won't work
  /// as the button will take focus so we need to manually add text field current and next focus node
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();

  final confirmPasswordFormKey = GlobalKey<FormState>();

  final isUsernameValid = false.obs;
  final isEmailValid = false.obs;
  final isPasswordValid = false.obs;
  final isConfirmPasswordValid = false.obs;

  final isFormValid = false.obs;

  final authRepository = AuthRepository();

  final Rxn<LoginMethod> currentLoginMethod = Rxn();
  final loginMethods = <LoginMethod>[
    LoginMethod.google,
    LoginMethod.apple,
  ];

  Worker? _validationWorker;
  @override
  void onInit() {
    super.onInit();
    listenToValidationState();
  }

  void listenToValidationState() {
    _validationWorker = everAll([
      isEmailValid,
      isPasswordValid,
      isConfirmPasswordValid,
    ], (callback) {
      final isValid = isEmailValid.value &&
          isPasswordValid.value &&
          isConfirmPasswordValid.value;
      isFormValid.value = isValid;
    });
  }

  Future<void> registerBy({required LoginMethod method}) async {
    currentLoginMethod.value = method;
    if (method == LoginMethod.email) {
      currentLoginMethod.value = LoginMethod.email;
    } else {
      currentLoginMethod.value = null;
      isLoading.value = true;
      final result = await authRepository.loginViaAuth0(method: method);
      result.when(
        success: (User user) async {
          _navigateToHome();
        },
        error: (NetworkException exception) {
          isLoading.value = false;
          Alert.error(message: exception.message);
        },
      );
    }
  }

  Future<void> register() async {
    if (!isFormValid.value) return;
    isLoading.value = true;

    final result = await authRepository.register(
      username: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    result.when(
      success: (User user) {
        _navigateToHome();
      },
      error: (NetworkException exception) {
        Alert.error(message: exception.message);
      },
    );
    isLoading.value = false;
  }


  void _navigateToHome() {
    isLoading.value = false;
    Get.find<CustomBottomNavigationController>().getUserInfo();

    AppNavigation.navigateFromRegisterToHome();
  }

  void changeHidePasswordState() {
    hidePassword.value = !hidePassword.value;
  }

  void changeHideConfirmPasswordState() {
    hideConfirmPassword.value = !hideConfirmPassword.value;
  }

  void navigateToLogin() {
    AppNavigation.navigateFromRegisterToLogin();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    usernameController.dispose();
    _validationWorker?.dispose();
    _validationWorker = null;
  }
}
