part of '../../imports/roots_imports.dart';

class BuildHomeSearchWidget extends GetView<RootsController> {
  const BuildHomeSearchWidget();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 12.r),
        child: CustomTextField(
          hint: AppTrans.searchRootsHint,
          controller: controller.searchController,
          borderColor: context.colors.onSurface,
          borderRadius: BorderRadius.circular(24.r),
          onChanged: (value) {
            controller._searchText.value = value;
          },
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.r,
            vertical: 20.r,
          ),
          prefix: Icon(
            Icons.search,
            color: context.colors.primary,
          ),
          suffix: Obx(
            () => controller._searchText.value.isEmpty
                ? const SizedBox()
                : IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      controller._searchText.value = '';
                      controller.searchController.clear();
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
