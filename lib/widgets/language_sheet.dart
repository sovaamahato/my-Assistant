// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_assistant/controller/translate_controller.dart';

class LanguageSheet extends StatefulWidget {
  final TranslateController c;
  final RxString s;
  const LanguageSheet({
    Key? key,
    required this.c,
    required this.s,
  }) : super(key: key);

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  final _search = ''.obs;

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      height: mq.height * .5,
      padding: EdgeInsets.only(
          left: mq.width * .04, right: mq.width * .04, top: mq.height * .02),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      child: Column(
        children: [
          TextFormField(
            // controller: _c.resultC,
            onChanged: (s) => _search.value = s.toLowerCase(),

            onTapOutside: (e) => FocusScope.of(context).unfocus(),
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.translate_rounded, color: Colors.blue),
                hintText: 'Search Language...',
                hintStyle: TextStyle(fontSize: 14),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),
          Expanded(
            child: Obx(() {
              final List<String> list = _search.isEmpty
                  ? widget.c.lang
                  : widget.c.lang
                      .where((e) => e.toLowerCase().contains(_search.value))
                      .toList();
              return ListView.builder(
                 physics: const BouncingScrollPhysics(),
                  itemCount: list.length,
                  padding: EdgeInsets.only(top: mq.height * .02, left: 6),
                  itemBuilder: (ctx, i) {
                    return InkWell(
                      onTap: () {
                        //update the value for us in search 
                        widget.s.value = list[i];
                        //to show in console log
                        log(list[i]);
                        Get.back();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: mq.height * .02),
                        child: Text(list[i]),
                      ),
                    );
                  });
            }),
          ),
        ],
      ),
    );
  }
}
