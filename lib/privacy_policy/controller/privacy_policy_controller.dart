import '../../api_services/api_services.dart';
import '../../api_services/environment.dart';

class PrivacyPolicyController {
  static Future privacyPolicy() async {
    String params = "?token=hWBGKlLQbRQJdav33aWF5dDDMdPCY5uf";
    Uri ppUrl = Uri.parse(Environment.base_url + EndPoints.live + params);
    dynamic ppApiCall = await ApiServices.getMethod(ppUrl);
    return ppApiCall.body;
  }
}
