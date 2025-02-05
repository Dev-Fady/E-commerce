import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/features/favorites/domain/entites/get_favorites_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteItemCard extends StatelessWidget {
  const FavoriteItemCard(
      {super.key, required this.data, required this.onRemove});
  final GetFavoritesEntity data;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            child: Hero(
              tag: data.name,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150.h,
                imageUrl: data.image,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.asset(
                    'assets/images/customer/avatar.png',
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text("L.E ${data.price}",
                style: const TextStyle(color: Colors.grey)),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: onRemove,
                ),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue,
                    side: const BorderSide(color: Colors.blue),
                  ),
                  onPressed: () {
                    // Handle add to cart
                  },
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text("Add"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
