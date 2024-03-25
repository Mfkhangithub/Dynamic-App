import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:saloonstore/components/Colors.dart';


class Web_view_page extends StatefulWidget {
  const Web_view_page({
    super.key,
  });

  @override
  State<Web_view_page> createState() => _Web_view_pageState();
}

class _Web_view_pageState extends State<Web_view_page> {
  InAppWebViewController? webViewController;
  PullToRefreshController? refreshController;
  late var URL;
  double progress = 0;
  var InitialUrl = "https://www.wakafridi.com/login/?ref=dshop";
  var URLCONTROLLER = TextEditingController();
  bool isLoading = false;
  @override
  void initState() {
    refreshController = PullToRefreshController(
      onRefresh: () {
        webViewController!.reload();
      },
      options: PullToRefreshOptions(
          color: AppColors.white, backgroundColor: AppColors.textColor),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () async {
              if (await webViewController!.canGoBack()) {
                webViewController!.goBack();
              }
            },
            child: const Icon(Icons.arrow_back_ios)),
        actions: [
          GestureDetector(
              onTap: () {
                webViewController!.reload();
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.refresh),
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Stack(
            alignment: Alignment.center,
            children: [
              InAppWebView(
                onLoadStop: (controller, url) {
                  refreshController!.endRefreshing();
                  setState(() {
                    isLoading = false;
                  });
                },
                onProgressChanged: (controller, progress) {
                  if (progress == 100) {
                    refreshController!.endRefreshing();
                  }
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
                pullToRefreshController: refreshController,
                onLoadStart: (controller, url) {
                  var v = url.toString();
                  setState(() {
                    isLoading = true;
                    URLCONTROLLER.text = v;
                  });
                },
                onWebViewCreated: (controller) =>
                    webViewController = controller,
                initialUrlRequest: URLRequest(url: WebUri(InitialUrl)),
              ),
              Visibility(
                  visible: isLoading,
                  child: CircularProgressIndicator(
                    value: progress,
                    valueColor: const AlwaysStoppedAnimation(AppColors.red),
                  ))
            ],
          ))
        ],
      ),
    );
  }
}
