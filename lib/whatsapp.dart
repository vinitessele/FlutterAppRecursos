import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class whatsappMessagem extends StatefulWidget {

  @override
  State<whatsappMessagem> createState() => _whatsappMessagemState();
}

class _whatsappMessagemState extends State<whatsappMessagem> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  void openMessagingApp() async{
    String phoneNumber = phoneNumberController.text;
    String message = messageController.text;

    if(phoneNumber.isEmpty || message.isEmpty){
      // Display a warning if either the phone number or message is empty
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please enter both phone number and message.'),
      ));
      return;
    }

    // WhatsApp deep link
    Uri whatsappLink = Uri.parse("whatsapp://send?phone=$phoneNumber&text=$message");

    // Instagram deep link
    Uri instagramLink =  Uri.parse("https://www.instagram.com/direct/inbox/?thread=$phoneNumber");

    // Try launching without checking for availability
    await launchUrl(whatsappLink);

    // Check if Instagram is installed
    if (await canLaunchUrl(instagramLink)) {
      await launchUrl(instagramLink);
    } else {
      // Display a warning if Instagram is not installed
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Instagram not installed.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messaging App Launcher'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'Enter Mobile Number'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: messageController,
              decoration: InputDecoration(labelText: 'Enter Message'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: openMessagingApp,
              child: Text('Open Messaging App'),
            ),
          ],
        ),
      ),
    );
  }
}
