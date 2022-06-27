import 'package:proof_tech_app/Login/UserManager.dart';

import '../Login/LoginModel.dart';
import '../logs/LogsManager.dart';




class Overseer {
  Map<dynamic, dynamic> repository = {};

  ///
  static DateTime date_of_birth = DateTime.now();
  static String date_of_birth_string = "";
  static int age = 0;
  ///// app level dataset
  static String usname = "";
  static String supervisorName = "";
  static int supervisorId = 0;
  static String projectName = "";
  static Team myteam = new Team(id: 1, fName: "", lName: "", phone: "",
      email: "", image: "", password: "=", rememberToken: "rememberToken", createdAt: "createdAt",
      updatedAt: "updatedAt", roleId: "", zoneId: "zoneId", authToken: "authToken", memberAddingTime: "memberAddingTime");
  static List<Team> myteamList  = new List.empty();


  //////
  static String csrf_token_overseer = "";
  static String user_image_path = "";
  static String home_text = "";
  static String home_text_2nd = "";
  static String course_image_path = "";
  static String base_URL = "";
  static String login_status = "";
  static String register_status = "";
  static String videoURL = "";
  static String MainvideoURL = "";
  static String userName = "";
  static String videoCaption = "";
  static String fitnesgoal_name = "";
  static String gender = "";
  static String heightin = "";
  static String weighttin = "";
  static String createUserActivityMessage = "";
  static String signInActivityMessage = "";
  static String scheduleQuery = "";
  static int weight = 0;
  static int height = 0;
  static int userId = 0;
  static int onGoingCoursesLength = 0;
  static int fitnesgoal_id = 0;
  static String freeTrialMessage = "";
  static bool freeTrialEnable = false;
  static bool is_user_valid = false;
  static bool is_user_Registered = false;
  static bool is_Profile_updated = false;
  static bool isColor = false;
  static bool isOngoingSuccess = false;

  // cart values

  Overseer() {
// register managers
    register(UserManager, UserManager());
    register(LogsManager, LogsManager());
  }

  static printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  // register the manager to this overseer to store in repository
  register(name, object) {
    repository[name] = object;
  }

  // get the required manager from overseer when needed
  fetch(name) {
    return repository[name];
  }
}
