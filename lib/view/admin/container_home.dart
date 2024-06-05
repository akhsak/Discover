import 'package:discover/controller/admin_provider.dart';
import 'package:discover/model/admin_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllPlaceContainer extends StatelessWidget {
  final Size size;
  final bool isAdmin;
  final AdminModel travelpackages;
  final AdminProvider value;
  final double circleAvatarRadius;

  const AllPlaceContainer({
    Key? key,
    required this.size,
    required this.isAdmin,
    required this.travelpackages,
    required this.value,
    required this.circleAvatarRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adminProvider = Provider.of<AdminProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: circleAvatarRadius,
                backgroundImage: NetworkImage(travelpackages.image.toString()),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      travelpackages.fullName!,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      travelpackages.aboutTrip.toString(),
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              if (isAdmin)
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    adminProvider.deleteTravelPackage(travelpackages.id!);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
