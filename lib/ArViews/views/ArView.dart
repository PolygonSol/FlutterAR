import 'dart:io';

import 'package:arcgis_ar/ArViews/controllers/ar_controller.dart';
import 'package:arcgis_ar/ArViews/views/ARLocationScreen.dart';
import 'package:arcgis_ar/ArViews/views/ArLocationIosScreen.dart';
import 'package:arcgis_ar/ArViews/views/EnableLocationScreen.dart';
import 'package:arcgis_ar/data/colors.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ArView extends GetView<ArController> {
  ArView({Key? key}) : super(key: key);

  //SearchController airportsController = Get.find<SearchController>();
  TextEditingController textEditingController =  TextEditingController();
  TextEditingController emailController =  TextEditingController();


  @override
  Widget build(BuildContext context) {


    return Obx(() {
      return   Scaffold(
          body: controller.isPermissionGranted.value? Platform.isIOS?const ArLocationIosScreen(): controller.arCoreAvailability.compareTo("ARCore is available and services are installed.")==0? const ARLocationScreen(): Center(child: Text(controller.arCoreAvailability.value,style:  TextStyle(color: AppColors.primary,fontFamily: 'margarine',fontSize: 17),)) :const EnableLocationScreen()
      );
    });
  }
}
