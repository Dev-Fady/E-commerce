import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../manger/sign_up/register_using_api_riverpod.dart';

class PickImageWidget extends ConsumerWidget {
  const PickImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profilePic = ref.watch(profilePicProvider);

    return profilePic == null
        ? const DefaultImage()
        : InkWell(
            onTap: () async {
              final pickedImage =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (pickedImage != null) {
                ref.read(profilePicProvider.notifier).state = File(pickedImage.path);
              }
            },
            child: CircleAvatar(
              radius: 50,
              backgroundImage: FileImage(profilePic),
            ),
          );
  }
}

class DefaultImage extends ConsumerWidget {
  const DefaultImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 130,
      height: 130,
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        backgroundImage: const AssetImage("assets/images/customer/avatar.png"),
        child: Stack(
          children: [
            Positioned(
              bottom: 5,
              right: 5,
              child: GestureDetector(
                onTap: () async {
                  final pickedImage = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    ref.read(profilePicProvider.notifier).state = File(pickedImage.path);
                  }
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    border: Border.all(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.camera_alt_sharp,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}