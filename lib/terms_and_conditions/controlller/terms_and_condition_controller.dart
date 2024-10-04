import 'package:logger/logger.dart';
import 'package:vperfumes/api_services/api_services.dart';
import 'package:vperfumes/api_services/environment.dart';

class TermsAndConditionController {
  static Future termsAndCondition() async {
    String params = "?token=gJKUdAi4gmSrKWsfn4BJ4vKvLqNBIGpu";
    Uri tcUrl = Uri.parse(Environment.base_url + EndPoints.live + params);
    dynamic tcApiCall = await ApiServices.getMethod(tcUrl);
    return tcApiCall.body;
  }
}
