import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pixbit/models/users.dart';
import 'package:pixbit/resource/styles_manager.dart';

import '../resource/asset_manger.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          child: Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back)),
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.more_vert))
                  ],
                )
              ],
            ),
          ),
          preferredSize: Size(size.width, 50)),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                height: size.height * .3,
                width: size.width,
                child: CachedNetworkImage(
                  imageUrl: widget.user.profilePicture!,
                  errorWidget: (ctx, _, __) => Image.asset(AssetManager.admin),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 20,
                child: Text(
                  widget.user.firstName! + widget.user.lastName!,
                  style: getMediumtStyle(color: Colors.black, fontSize: 26),
                ),
              ),
              Positioned(
                  bottom: -15,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFav != isFav;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 250, 33, 106),
                      radius: 25,
                      child: IconButton(
                        onPressed: () {
                          // setState(() {
                          //   isFav != isFav;
                          // });
                        },
                        icon: const Icon(
                          Icons.star,
                          size: 25,
                        ),
                      ),
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(
                Icons.phone,
                color: Colors.blue,
              ),
              title: Text(
                widget.user.mobile.toString(),
                style: getMediumtStyle(color: Colors.black, fontSize: 16),
              ),
              subtitle: const Text('Mobile'),
              trailing: const Icon(Icons.message),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(
                Icons.mail,
                color: Colors.blue,
              ),
              title: Text(
                widget.user.email.toString(),
                style: getMediumtStyle(color: Colors.black, fontSize: 16),
              ),
              subtitle: const Text('Mobile'),
              trailing: const Icon(Icons.message),
            ),
          )
        ],
      ),
    );
  }
}
