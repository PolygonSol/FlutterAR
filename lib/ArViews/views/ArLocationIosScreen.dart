import 'dart:async';
import 'dart:math';
import 'package:arcgis_ar/widgets/app_text_field.dart';
import 'package:arcgis_ar/widgets/primary_button.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:text_3d/text_3d.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'dart:ui' as ui;

import '../controllers/ar_controller.dart';

class ArLocationIosScreen extends StatefulWidget {
  const ArLocationIosScreen({super.key});

  @override
  _ArLocationIosScreen createState() => _ArLocationIosScreen();
}

class _ArLocationIosScreen extends State<ArLocationIosScreen> {
  late ARKitController arKitController;
  Position? location;
  ARKitNode? _arNode;
  ARKitNode? _arNode1;
  final LocationSettings  locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.medium,
    distanceFilter: 150,
  );
  StreamSubscription<Position>? positionStream;
  final authController = Get.find<ArController>();
  @override
  void initState() {
    super.initState();

    initLocationService();
  }

  Future<void> initLocationService() async {
    var permission = await Permission.location.request();

    if (permission.isGranted) {
      debugPrint("Location data callback");

      positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
              (Position? position) {
            debugPrint("position stream");
            debugPrint(position == null
                ? 'Unknown'
                : '${position.latitude.toString()}, ${position.longitude.toString()}');
            authController.getData("${position!.latitude}", "${position!.longitude}");
            _onARKitViewCreated(arKitController);
          });
      location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      await authController.getData("${location!.latitude}","${location!.longitude}");
      _onARKitViewCreated(arKitController);



    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: Stack(
        children: [
          ARKitSceneView(
            onARKitViewCreated: _onARKitViewCreated,
            enableTapRecognizer: true,
          ),
          Visibility(
            visible: authController.showBridge.value,
            child: Padding(
              padding: const EdgeInsets.only(top: 50,left: 10,right: 10,bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ThreeDText(
                    text: "Bridge ${authController.structureNumber.value} \n${authController.nearestBridge.value.toStringAsFixed(2)} feet ahead",
                    textStyle: const TextStyle(fontSize: 30, color: Colors.white),
                    style: ThreeDStyle.inset,
                  ),
                  Center(child: Image.asset("assets/images/bridge.png",width: 80,height: 80,))
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
  void onARKitViewCreated(ARKitController arkitController) {
    arKitController = arkitController;
    final node = ARKitNode(
        geometry: ARKitSphere(radius: 0.1), position: vector.Vector3(0, 0, -0.5));
    arkitController.add(node);
  }


  void _onARKitViewCreated(ARKitController controller) async {
    arKitController = controller;

  //  final ByteData earthMap = await rootBundle.load("assets/images/bridge.png");

  /* var currentPosition = await arKitController.cameraPosition();
     ARKitText text = ARKitText(
      text: "Bridge ${authController.structureNumber.value} \n${authController.nearestBridge.value.toStringAsFixed(2)} feet ahead", extrusionDepth: 5
      ,materials: [ARKitMaterial(diffuse: ARKitMaterialProperty.color(Colors.white38))],);
    if (_arNode != null) {
      arKitController.remove(_arNode!.name);
    }if (_arNode1 != null ) {
      arKitController.remove(_arNode1!.name);
    }

    _arNode = ARKitNode(
      geometry: text,
        position: vector.Vector3(currentPosition!.x -40,
            currentPosition.y+30,
            currentPosition.z - 220),
           //scale: vector.Vector3(0.01, 0.01, 0.1),
     );
    _arNode1 = ARKitNode(
      geometry: ARKitPlane(materials: [ARKitMaterial(
          diffuse: ARKitMaterialProperty.image("assets/images/bridge.png")
      )]),
       position: vector.Vector3(currentPosition!.x ,
        currentPosition.y,
        currentPosition.z-10),

   );*/

    if(authController.bridgeDataModel.value.features!.isNotEmpty){

      authController.showBridge(true);

      //arKitController.add(_arNode!,                    parentNodeName: parent.name);
      // arKitController.add(_arNode1!);
    }
    else{
      authController.showBridge(false);
    }
  }

  @override
  void dispose() {
    arKitController.dispose();
    positionStream?.cancel();
    super.dispose();
  }
}

