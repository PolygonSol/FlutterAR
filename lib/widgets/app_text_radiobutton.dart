import 'package:flutter/material.dart';
import 'package:arcgis_ar/widgets/app_text_form_field.dart';

import '../data/colors.dart';
typedef MyCallback = void Function(String gen);
class AppRadioButtonsFormField extends StatefulWidget {

  final MyCallback? callback;
  const AppRadioButtonsFormField({
    Key? key,
    required this.text,
    this.callback
  }) : super(key: key);

  final String? text;
  @override
  State<AppRadioButtonsFormField> createState()=> _RadioButtons();
}

class _RadioButtons extends State<AppRadioButtonsFormField>
{
  Color getColor(Set<MaterialState> states) {
    return const Color(0xFF344054);
  }
  String? gender = "male";
  String? othergender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
           Text(widget.text!,style: const TextStyle(color: Colors.black,fontFamily: 'outfit' ,fontSize: 20,fontWeight: FontWeight.w600),),
          Container(
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(border: Border.all(width: 1.5,color: Colors.black12),borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: RadioListTile(
              fillColor: MaterialStateProperty.resolveWith(getColor),
              title:  const Text("Male",style: TextStyle(fontSize: 16,color: Color(0xFF344054),fontFamily: 'inter',fontWeight: FontWeight.w500,),),
              value: "male",
                activeColor: AppColors.primary,
              groupValue: gender,
              onChanged: (value){
                setState(() {
                  gender = value.toString();
                  widget.callback!(gender!);
                  
                });
              },
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(border: Border.all(width: 1.5,color: Colors.black12),borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: RadioListTile(
              fillColor: MaterialStateProperty.resolveWith(getColor),
              title: const Text("Female",style: TextStyle(fontSize: 16,color: Color(0xFF344054),fontFamily: 'inter',fontWeight: FontWeight.w500,),),
              value: "female",
              activeColor: AppColors.primary,
              groupValue: gender,
              onChanged: (value){
                setState(() {
                  gender = value.toString();
                  widget.callback!(gender!);
                });
              },
            ),
          ),

          Container(
            decoration: BoxDecoration(border: Border.all(width: 1.5,color: Colors.black12),borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: RadioListTile(
              fillColor: MaterialStateProperty.resolveWith(getColor),
              title: const Text("Non-binary",style: TextStyle(fontSize: 16,color: Color(0xFF344054),fontFamily: 'inter',fontWeight: FontWeight.w500,),),
              value: "other",
              groupValue: gender,
              activeColor: AppColors.primary,
              onChanged: (value){
                setState(() {
                  gender = value.toString();
                  widget.callback!(gender!);

                  showModalBottomSheet(
                    isScrollControlled: true,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                      context: context,
                      builder: (BuildContext context){
                    return StatefulBuilder(builder: (BuildContext context,  setState){
                      return SingleChildScrollView(
                        child: Padding(
                          padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text('Tell us more about your gender',style: TextStyle(color: Colors.black,fontFamily: 'outfit' ,fontSize: 20,fontWeight: FontWeight.w600),),
                              ),
                              RadioListTile(
                                dense: true,
                                fillColor: MaterialStateProperty.resolveWith(getColor),
                                title:  Text("Intersex man",style: radioTextStyle()),
                                toggleable: true,
                                value: "Intersex man",
                                controlAffinity: ListTileControlAffinity.trailing,
                                activeColor: AppColors.primary,
                                groupValue: gender,
                                onChanged: (value){
                                  setState(() {
                                    gender = value.toString();
                  widget.callback!(gender!);;
                                  });
                                },
                              ),
                              RadioListTile(
                                fillColor: MaterialStateProperty.resolveWith(getColor),
                                title:  Text("Trans man",style: radioTextStyle()),
                                toggleable: true,
                                value: "Trans man",
                                controlAffinity: ListTileControlAffinity.trailing,
                                activeColor: AppColors.primary,
                                groupValue: gender,
                                onChanged: (value){
                                  setState(() {
                                    gender = value.toString();
                           widget.callback!(gender!);
                                  });
                                },
                              ),
                              RadioListTile(
                                fillColor: MaterialStateProperty.resolveWith(getColor),
                                title:  Text("Transmasculine",style: radioTextStyle()),
                                toggleable: true,
                                value: "Transmasculine",
                                controlAffinity: ListTileControlAffinity.trailing,
                                activeColor: AppColors.primary,

                                groupValue: gender,
                                onChanged: (value){
                                  setState(() {
                                    gender = value.toString();
                  widget.callback!(gender!);;
                                  });
                                },
                              ),
                              RadioListTile(
                                fillColor: MaterialStateProperty.resolveWith(getColor),
                                title:  Text("Man and Nonbinary",style:  radioTextStyle()),
                                toggleable: true,
                                value: "Man and Nonbinary",
                                controlAffinity: ListTileControlAffinity.trailing,
                                activeColor: AppColors.primary,
                                groupValue: gender,
                                onChanged: (value){
                                  setState(() {
                                    gender = value.toString();
                  widget.callback!(gender!);;
                                  });
                                },
                              ),
                              RadioListTile(
                                fillColor: MaterialStateProperty.resolveWith(getColor),
                                title:  Text("Cis Man",style:  radioTextStyle()),
                                toggleable: true,
                                value: "Cis Man",
                                controlAffinity: ListTileControlAffinity.trailing,
                                activeColor: AppColors.primary,
                                groupValue: gender,
                                onChanged: (value){
                                  setState(() {
                                    gender = value.toString();
                                    widget.callback!(gender!);
                                  });
                                },
                              ),
                              const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text('Want to describe more?',style: TextStyle(color: Colors.black,fontFamily: 'inter' ),),
                              ),

                               Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: AppTextFormField(labelText: 'Write here...',onChanged: (value){gender = value;}),
                              )
                            ],
                          ),
                        ),
                      );
                    });
                  });
                });
              },
            ),
          )
        ],),
      ),
    );
  }

  TextStyle radioTextStyle(){
    return const TextStyle(fontSize: 16,color: Color(0xFF344054),fontFamily: 'inter',fontWeight: FontWeight.w500,);
  }

}
