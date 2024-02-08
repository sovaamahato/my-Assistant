import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_assistant/controller/translate_controller.dart';
import 'package:my_assistant/pallete.dart';
import 'package:my_assistant/widgets/custom_button.dart';
import 'package:my_assistant/widgets/custom_loading.dart';
import 'package:my_assistant/widgets/language_sheet.dart';
import 'package:my_assistant/openai_services.dart';
import '../../controller/image_controller.dart';

class TranslatorFeature extends StatefulWidget {
  const TranslatorFeature({super.key});

  @override
  State<TranslatorFeature> createState() => _TranslatorFeatureState();
}

class _TranslatorFeatureState extends State<TranslatorFeature> {
  final _c = TranslateController();
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Scaffold(
      //-----------appbar
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade200,
        centerTitle: true,
        title: const Text("Multi language translator"),
      ),
      //-----------------body
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
                transform: GradientRotation(3),
                center: Alignment.topRight,
                radius: 3,
                // tileMode: TileMode.clamp,
                colors: [
              //  Pallete.color1,
              Pallete.color2,
              // Pallete.color2,
              Pallete.color3,
              //  Pallete.color4,
              Pallete.color5,
              Pallete.color6,
              //  Pallete.color7,
              // Pallete.color8,
              Pallete.color9,

              //  Pallete.color10,

              // Pallete.whiteColor,

              // Pallete.color4,
              // Pallete.color10,
              // Pallete.whiteColor,
            ])),
        child: ListView(
            physics: const BouncingScrollPhysics(),
            padding:
                EdgeInsets.only(top: mq.height * .02, bottom: mq.height * .1),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //from language
                  InkWell(
                    onTap: () => Get.bottomSheet(LanguageSheet(
                      c: _c,
                      s: _c.from,
                    )),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      height: 50,
                      width: mq.width * 0.4,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD5C2F9),
                        // border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Obx(
                          () => Text(_c.from.isEmpty ? 'Auto' : _c.from.value)),
                    ),
                  ),
                  //swipe language btn
                  IconButton(
                    onPressed: _c.swapLanguages,
                    icon: Obx(
                      () => Icon(
                        CupertinoIcons.repeat,
                        color: _c.to.isNotEmpty && _c.from.isNotEmpty
                            ? Colors.blue
                            : const Color(0xFFECE7E7),
                      ),
                    ),
                  ),
                  //to language
                  InkWell(
                    onTap: () =>
                        Get.bottomSheet(LanguageSheet(c: _c, s: _c.to)),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      height: 50,
                      width: mq.width * 0.4,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD5C2F9),
                        // border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child:
                          Obx(() => Text(_c.to.isEmpty ? 'To' : _c.to.value)),
                    ),
                  ),
                ],
              ),
              //text field
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mq.width * .04, vertical: mq.height * .035),
                child: TextFormField(
                  controller: _c.textC,
                  minLines: 5,
                  maxLines: null,
                  onTapOutside: (e) => FocusScope.of(context).unfocus(),
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 145, 174, 243),
                      hintText: 'Translate anything you want...',
                      hintStyle: TextStyle(fontSize: 13.5),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              //result field
              Obx(() => _translateResult()),

              SizedBox(height: mq.height * .04),

              //translate btn
              CustomButton(
                // onTap: () => _c.translate(),
                onTap: _c.googleTranslate,
                text: 'Translate',
              )
            ]),
      ),
    );
  }

  Widget _translateResult() => switch (_c.status.value) {
        Status.none => const SizedBox(),
        Status.complete => Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .04),
            child: TextFormField(
              controller: _c.resultC,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
        Status.loading => const Align(child: CustomLoading())
      };
}
