
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:loan_project/controller/SubmitController.dart';
import 'package:loan_project/controller/home_controller.dart';
import 'package:loan_project/main.dart';

class SubmitScreen extends ParentWidget{
  SubmitController controller = Get.put(SubmitController());
  HomeController homeController = Get.put(HomeController());
  @override
  Widget buildingView(BuildContext context, double h, double w) {
    return
     Obx(() => SingleChildScrollView(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Container(
             margin: EdgeInsets.only(top: 30.0,bottom: 10.0),
             child: Text("Question/Answer Screen",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
           ),
           Container(
             //margin: EdgeInsets.symmetric(horizontal: 10,vertical: 40),
             height: h,
             width: w,
             child: ListView.builder(
                 padding: EdgeInsets.zero,
                 shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),
               itemCount: controller.selectedOptions.length,
       
                 itemBuilder: (context,index){
                 return Container(
                   margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                   //padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                   height: h*0.1,
                   width: w*0.7,
                   decoration:  BoxDecoration(
                     border: Border.all(color: Colors.grey),
       
       
                   ),
                   child: ListView.builder(
                     padding: EdgeInsets.zero,
                       shrinkWrap: true,
                     itemCount: controller.selectedOptions[index].length,
                       itemBuilder: (context,innerIndex){
       
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                          innerIndex==0?Text(homeController.questionModel.value.schema?.fields?[index].schema?.label??"",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),):Container(),
                           Row(
                             children: [
                               homeController.questionModel.value.schema?.fields?[index].type!="Section"?
                               Container():Text(homeController.questionModel.value.schema?.fields?[index].schema?.fields?[innerIndex].schema?.label??"",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                               homeController.questionModel.value.schema?.fields?[index].type!="Section"?

                               SizedBox(
                                 width: 0,
                               ):
                               SizedBox(
                                 width: 20,
                               ),
                               Text(controller.selectedOptions[index][innerIndex],style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.deepOrange),),
                             ],
                           )


                         ],
                       ),
                     );
                   }),
                 );
       
       
             }),
           ),
           GestureDetector(
             onTap: ()=>Get.back(),
             child: Container(

               margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
               child: Text("< Back",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
             ),
           ),
         ],
       ),
     ));
  }

}