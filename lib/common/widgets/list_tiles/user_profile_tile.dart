import 'package:flutter/material.dart';
import 'package:shinex/features/personalization/controllers/user_controller.dart';

import '../../../utils/constants/colors.dart';
import '../images/s_circular_image.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: TCircularImage(image: controller.user.value.profilePicture, width: 80, height: 80, padding: 0),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.edit, color: TColors.white),
      ),
    );
  }
}
