
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_example/controller/starter_controller.dart';

import '../../../../../controller/home_controller.dart';
import '../../../../../model/post_model.dart';


Widget starterItem(BuildContext context, PostModel post) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // TextFormField(
      //   controller: controller.bodyCtr.value,
      // ),
      Text(
        post.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            fontWeight: FontWeight.w700, fontSize: 24, color: Colors.black),
      ),
      const SizedBox(
        height: 5,
      ),
      Row(
        children: [
          Expanded(
            child: Text(
              post.body,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.black38),
            ),
          ),
          Column(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
              const SizedBox(
                height: 10,
              ),
              IconButton(
                  onPressed: () async {
                    Get.find<StarterController>().deletePost(context, post);
                  },
                  icon: const Icon(Icons.delete)),
            ],
          )
        ],
      ),
      const Divider(
        thickness: 3,
      )
    ],
  );
}
