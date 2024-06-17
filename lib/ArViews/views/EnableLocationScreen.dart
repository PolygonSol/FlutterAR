import 'dart:io';

import 'package:arcgis_ar/ArViews/controllers/ar_controller.dart';
import 'package:arcgis_ar/data/colors.dart';
import 'package:arcgis_ar/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';


class EnableLocationScreen extends StatefulWidget {
  const EnableLocationScreen({Key? key}) : super(key: key);

  @override
  State<EnableLocationScreen> createState() => _EnableLocationScreenState();
}

class _EnableLocationScreenState extends State<EnableLocationScreen> {

  var controller  = Get.find<ArController>();

  @override
  Widget build(BuildContext context) {
    return  Obx(() {
      return Scaffold(
        appBar: AppBar(backgroundColor: AppColors.primary,centerTitle: true,title: const Text("Enable permissions to ensure smooth operation.",style: TextStyle(color: Colors.white,fontFamily: 'margarine',fontSize: 17),),),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: controller.isDataLoading.value?controller.loader():Center(child: PrimaryButton(text: "Let's Start",onPressed: () async{

            controller.checkPermissions();


          },),),
        ),
      );
    });
  }

   }
