import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_template/core/extension/context_extension.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          _buildMessageInput(context),
          context.sizedBoxlow
        ],
      ),
    );
  }

  Widget _buildMessageInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(Icons.camera_alt, color: context.colorScheme.secondary),
          context.sizedBoxlow,
          Icon(Icons.image, color: context.colorScheme.secondary),
          context.sizedBoxlow,
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter message...',
                hintStyle: TextStyle(color: context.colorScheme.secondary),
                filled: true,
                fillColor: context.colorScheme.onPrimary,
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          context.sizedBoxlow,
          IconButton(
            icon: Icon(Icons.send, color: context.colorScheme.onTertiary),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
