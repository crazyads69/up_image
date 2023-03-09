import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:up_image/style.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
//Define Screen Size

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: const MainForm(),
      appBar: AppBar(
          shadowColor: Colors.white60,
          elevation: 1.0,
          title: GestureDetector(
            child: const AutoSizeText(
              "UP IMAGE",
              style: blsemiBold,
              minFontSize: 7,
              maxFontSize: 30,
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const UploadPage()),
                  (route) => false);
            },
          )),
    );
  }
}

class MainForm extends StatefulWidget {
  const MainForm({super.key});

  @override
  State<MainForm> createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  late DropzoneViewController controller;
  //get File Upload Function
  Future acceptFile(dynamic event) async {
    final name = await controller.getFilename(event);
    final mime = await controller.getFileMIME(event);
    final size = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);
    print("Name: $name");
    print("Mime: $mime");
    print("Size: $size");
    print("Url: $url");
  }

  Future showWarning(BuildContext context) async {
    return showDialog(
        barrierDismissible: true,
        barrierLabel: "CẢNH BÁO",
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            title: const AutoSizeText(
              "CẢNH BÁO",
              style: blsemiBold,
              minFontSize: 10,
              maxFontSize: 30,
            ),
            titleTextStyle: blsemiBold,
            backgroundColor: Colors.white,
            shadowColor: Colors.white70,
            elevation: 2.0,
            content: const AutoSizeText(
                "Chỉ được phép upload các file có địng dạng *.jpg, *.jpeg,*.png,*.bitmap",
                style: blRegular,
                minFontSize: 10,
                maxFontSize: 25,
                maxLines: 2),
            contentTextStyle: blRegular,
            actions: [
              MaterialButton(
                color: babyBlue,
                elevation: 1.0,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UploadPage()),
                      (route) => false);
                },
                minWidth: MediaQuery.of(context).size.width * 60 / 100,
                height: MediaQuery.of(context).size.height * 10 / 100,
                child: const AutoSizeText("OK, Đã hiểu",
                    minFontSize: 10, maxFontSize: 20, style: wsemiBold),
              )
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 10 / 100,
          left: MediaQuery.of(context).size.width * 5 / 100,
          right: MediaQuery.of(context).size.width * 5 / 100,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(colors: [
                  babyBlue,
                  lightBlue,
                  Colors.blueAccent,
                ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
            width: MediaQuery.of(context).size.width * 90 / 100,
            height: MediaQuery.of(context).size.height * 80 / 100,
            child: Stack(
              children: [
                DropzoneView(
                  mime: const [
                    "image/png",
                    "image/jpeg",
                    "image/bitmap",
                    "image/gif",
                    "image/svg",
                  ],
                  onCreated: (controller) => this.controller = controller,
                  onDrop: acceptFile,
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 5 / 100,
                      left: MediaQuery.of(context).size.width * 5 / 100,
                      right: MediaQuery.of(context).size.width * 5 / 100,
                      bottom: MediaQuery.of(context).size.width * 5 / 100,
                    ),
                    decoration: DottedDecoration(
                        borderRadius: BorderRadius.circular(20),
                        linePosition: LinePosition.bottom,
                        color: Colors.white,
                        shape: Shape.box,
                        strokeWidth: 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            cloudUpload,
                            cacheColorFilter: true,
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width * 40 / 100,
                            height:
                                MediaQuery.of(context).size.height * 40 / 100,
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 5 / 100,
                          ),
                          const AutoSizeText(
                            "Chọn hoặc kéo / thả file ảnh của bạn vào đây",
                            minFontSize: 10,
                            maxFontSize: 100,
                            style: wRegular,
                            maxLines: 1,
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 5 / 100,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.width * 2 / 100,
                                right: MediaQuery.of(context).size.width *
                                    2 /
                                    100),
                            child: MaterialButton(
                              onPressed: () {},
                              minWidth:
                                  MediaQuery.of(context).size.width * 80 / 100,
                              height:
                                  MediaQuery.of(context).size.height * 10 / 100,
                              color: lightBlue,
                              elevation: 2.0,
                              hoverColor: lightBlue.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: const AutoSizeText("CHỌN FILE",
                                  minFontSize: 10,
                                  maxFontSize: 100,
                                  style: wsemiBold),
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
