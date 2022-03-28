import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pixbit/APIs/apis.dart';
import 'package:pixbit/providers/app_provider.dart';
import 'package:pixbit/resource/asset_manger.dart';
import 'package:pixbit/resource/color_manager.dart';
import 'package:pixbit/resource/string_manager.dart';
import 'package:pixbit/resource/styles_manager.dart';
import 'package:pixbit/screens/user_detail_screen.dart';
import 'package:provider/provider.dart';

import '../models/users.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AppProvider>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: ColorManager.primary,
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text(AppStrings.allContact),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.tune),
            ),
          ],
        ),
        drawer: const Drawer(),
        body: FutureBuilder<List<User>?>(
            future: APIs().getUserData(authProvider.token!),
            builder: (context, snap) {
              return ListView(
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      padding: const EdgeInsets.all(3),
                      child: TextField(
                        enabled: false,
                        style: getRegularStyle(color: Colors.black),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Search Contact',
                            hintStyle: getRegularStyle(color: Colors.grey)),
                      )),
                  if (snap.connectionState == ConnectionState.waiting)
                    const Center(child: CircularProgressIndicator()),
                  if (snap.hasData)
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (ctx, i) => const Divider(),
                      itemCount: snap.data!.length,
                      itemBuilder: ((context, index) => InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => UserDetailsScreen(
                                          user: snap.data![index])));
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                child: CachedNetworkImage(
                                  imageUrl: snap.data![index].profilePicture!,
                                  errorWidget: (ctx, _, __) =>
                                      Image.asset(AssetManager.admin),
                                ),
                              ),
                              title: Text(
                                snap.data![index].firstName! +
                                    snap.data![index].lastName!,
                                style: getMediumtStyle(color: Colors.black),
                              ),
                            ),
                          )),
                    ),
                  if ((!snap.hasData || snap.hasError) &&
                      snap.connectionState != ConnectionState.waiting)
                    const Text('No iTems Found')
                ],
              );
            }));
  }
}
