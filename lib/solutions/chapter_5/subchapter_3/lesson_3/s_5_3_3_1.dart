import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';

class S5331 extends StatelessWidget {
  const S5331({super.key});
  @override
  Widget build(BuildContext context) {
    return const UserInfoPage();
  }
}

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key, this.profileImageUrl});

  final String? profileImageUrl;

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  File? imageCamera;
  Uint8List? imageGallery;

  imagePickerTypeBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: [
              const ShortHBar(),
              Row(
                children: [
                  const SizedBox(width: 20),
                  const Text(
                    ' Bild auswählen',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      CustomIconButton(
                        onTap: () => Navigator.pop(context),
                        icon: Icons.close,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  )
                ],
              ),
              Divider(
                color: Colors.grey.withOpacity(0.3),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  imagePickerIcon(
                    onTap: pickImageFromCamera,
                    icon: Icons.camera_alt_rounded,
                    text: 'Kamera',
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  imagePickerIcon(
                    onTap: () async {
                      Navigator.pop(context);
                      final image = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ImagePickerPage(),
                        ),
                      );
                      if (image == null) return;
                      setState(() {
                        imageGallery = image;
                        imageCamera = null;
                      });
                    },
                    icon: Icons.photo_camera_back_rounded,
                    text: 'Galerie',
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          );
        });
  }

  pickImageFromCamera() async {
    Navigator.of(context).pop();
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      setState(() {
        imageCamera = File(image!.path);
        imageGallery = null;
      });
    } catch (e) {
      if (!context.mounted) return;
    }
  }

  imagePickerIcon({
    required VoidCallback onTap,
    required IconData icon,
    required String text,
  }) {
    return Column(
      children: [
        CustomIconButton(
          onTap: onTap,
          icon: icon,
          iconColor: Colors.white,
          minWidth: 50,
          border: Border.all(
            color: Colors.grey.withOpacity(.2),
            width: 1,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: imagePickerTypeBottomSheet,
            child: Container(
              padding: const EdgeInsets.all(26),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
                border: Border.all(
                  color: imageCamera == null && imageGallery == null
                      ? Colors.transparent
                      : Colors.grey.withOpacity(0.4),
                ),
                image: imageCamera != null ||
                        imageGallery != null ||
                        widget.profileImageUrl != null
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: imageGallery != null
                            ? MemoryImage(imageGallery!)
                            : widget.profileImageUrl != null
                                ? NetworkImage(widget.profileImageUrl!)
                                : FileImage(imageCamera!) as ImageProvider,
                      )
                    : null,
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 3, right: 3),
                child: Icon(
                  Icons.add_a_photo_rounded,
                  size: 48,
                  color: imageCamera == null &&
                          imageGallery == null &&
                          widget.profileImageUrl == null
                      ? Colors.black
                      : Colors.transparent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  List<Widget> imageList = [];
  int currentPage = 0;
  int? lastPage;

  handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent < .33) return;
    if (currentPage == lastPage) return;
    fetchAllImages();
  }

  fetchAllImages() async {
    lastPage = currentPage;

    final permission = await PhotoManager.requestPermissionExtend();
    if (permission.isAuth) {
      // Granted
      // You can to get assets here.
    } else if (permission.hasAccess) {
      // Access will continue, but the amount visible depends on the user's selection.
    } else {
      (!permission.isAuth);
      return PhotoManager.openSetting();
    }

    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      onlyAll: true,
    );
    List<AssetEntity> photos = await albums[0].getAssetListPaged(
      page: currentPage,
      size: 24,
    );
    List<Widget> temp = [];

    for (var asset in photos) {
      temp.add(
        FutureBuilder(
          future: asset.thumbnailDataWithSize(
            const ThumbnailSize(
              200,
              200,
            ),
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: InkWell(
                  onTap: () => Navigator.pop(context, snapshot.data),
                  borderRadius: BorderRadius.circular(5),
                  splashFactory: NoSplash.splashFactory,
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.4),
                        width: 1,
                      ),
                      image: DecorationImage(
                        image: MemoryImage(snapshot.data as Uint8List),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      );
    }
    setState(() {
      imageList.addAll(temp);
      currentPage++;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAllImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scroll) {
            handleScrollEvent(scroll);
            return true;
          },
          child: GridView.builder(
            itemCount: imageList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (_, index) {
              return imageList[index];
            },
          ),
        ),
      ),
    );
  }
}

class ShortHBar extends StatelessWidget {
  const ShortHBar({super.key, this.height, this.width, this.color});

  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 4,
      width: width ?? 25,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: color ?? Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color? iconColor;
  final double? iconSize;
  final double? minWidth;
  final Color? background;
  final BoxBorder? border;
  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.iconColor,
    this.iconSize,
    this.minWidth,
    this.background,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        shape: BoxShape.circle,
        border: border,
      ),
      child: IconButton(
        onPressed: onTap,
        splashColor: Colors.transparent,
        splashRadius: (minWidth ?? 45) - 25,
        iconSize: iconSize ?? 22,
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minWidth: minWidth ?? 45,
          minHeight: minWidth ?? 45,
        ),
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
