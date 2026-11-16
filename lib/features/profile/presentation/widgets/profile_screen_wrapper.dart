import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/presentation/widgets/app_message.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class ProfileScreenWrapper extends StatelessWidget {
  const ProfileScreenWrapper({
    super.key,
    required this.successMessage,
    required this.buildBody,
    required this.onJobDone,
    required this.onSuccess,
  });

  final String successMessage;
  final Widget Function(BuildContext, ProfileState) buildBody;
  final VoidCallback onJobDone;
  final VoidCallback onSuccess;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      builder: buildBody,
      listener: (context, state) {
        if (state.error?.isNotEmpty == true) {
          AppMessage.error(
            context,
            message: state.error!,
            onClose: () {
              context.read<ProfileCubit>().disableError();
            },
          );
        }
        if (state.success) {
          onJobDone.call();
          AppMessage.success(
            context,
            message: successMessage,
            onClose: () {
              context.read<ProfileCubit>().disableSuccess();
              onSuccess.call();
            },
          );
        }
      },
    );
  }
}
