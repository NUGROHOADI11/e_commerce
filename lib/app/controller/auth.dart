import 'package:appwrite/appwrite.dart';

Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('65694635ef35f1a85243')
    .setSelfSigned(status: true);