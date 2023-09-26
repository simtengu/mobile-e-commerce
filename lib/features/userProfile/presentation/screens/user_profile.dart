import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/userProfile/presentation/screens/edit_details.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.49,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("${AppConstants.imgPath}dpcover.PNG"),
                        fit: BoxFit.cover),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.35,
                    color: Colors.black.withOpacity(0.7),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 45,
                            backgroundImage: AssetImage(
                              "${AppConstants.imgPath}dp.png",
                            ),
                          ),
                          vSpacing(20),
                          heading4("Albert Simtengu",
                              customStyle:
                                  const TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0.0,
                  right: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Card(
                      color: Colors.white,
                      shadowColor: Colors.grey.shade200,
                      elevation: 12,
                      child: Ink(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0)
                                    .copyWith(left: 14),
                                iconColor: Pallete.primary,
                                leading: Image.asset(
                                  "${AppConstants.iconPath}order.png",
                                  color: Pallete.primary,
                                ),
                                title: body1(
                                  "My Orders",
                                  customStyle: TextStyle(
                                    color: Pallete.primaryDark,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Pallete.textPrimary,
                                ),
                              ),
                              Divider(
                                color: Pallete.textPrimary,
                              ),
                              ListTile(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const EditDetailsScreen(),
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0)
                                    .copyWith(left: 14),
                                iconColor: Pallete.primary,
                                leading:
                                    const Icon(Icons.contact_page_outlined),
                                title: body1(
                                  "My Details",
                                  customStyle: TextStyle(
                                    color: Pallete.primaryDark,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Pallete.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          vSpacing(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Card(
              color: Colors.white,
              shadowColor: Colors.grey.shade200,
              elevation: 12,
              child: Ink(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0)
                            .copyWith(left: 14),
                        iconColor: Pallete.primary,
                        leading: const Icon(Icons.favorite_outline),
                        title: body1(
                          "My Wishlist",
                          customStyle: TextStyle(
                            color: Pallete.primaryDark,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Pallete.textPrimary,
                        ),
                      ),
                      Divider(
                        color: Pallete.textPrimary,
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0)
                            .copyWith(left: 14),
                        iconColor: Pallete.primary,
                        leading: const Icon(Icons.password),
                        title: body1(
                          "Change Password",
                          customStyle: TextStyle(
                            color: Pallete.primaryDark,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Pallete.textPrimary,
                        ),
                      ),
                      Divider(
                        color: Pallete.textPrimary,
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0)
                            .copyWith(left: 14),
                        iconColor: Pallete.primary,
                        leading: const Icon(Icons.logout_outlined),
                        title: body1(
                          "Log Out",
                          customStyle: TextStyle(
                            color: Pallete.primaryDark,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Pallete.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
