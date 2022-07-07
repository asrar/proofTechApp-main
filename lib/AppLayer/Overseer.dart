import 'package:proof_tech_app/Login/UserManager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Login/LoginModel.dart';
import '../logs/LogsManager.dart';
import 'package:proof_tech_app/Login/LoginModel.dart';



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
  static int projectId = 0;
  static String projectName = "";
  static Team myteam = new Team(id: 1, fName: "", lName: "", phone: "",
      email: "", image: "", password: "=", rememberToken: "rememberToken", createdAt: "createdAt",
      updatedAt: "updatedAt", roleId: "", zoneId: "zoneId", authToken: "authToken", memberAddingTime: "memberAddingTime");
  static List<Team> myteamList  = new List.empty();
  static List<Projects> myProjects  = new List.empty();
  static Projects project  = new Projects(id: 0, projectTypeId: "", name: "", description: "", status:
  "", createdAt: "", updatedAt: "", material: List.empty(), tools: List.empty(), team: List.empty(), type: new Type(id: 0, name: "",
      activities: List.empty(), status: "", createdAt: "", updatedAt: "", myActivities: List.empty()),
      expenses1: List.empty(), actions1: List.empty());

  static List<Materials> myMaterialList  = new List.empty();
  static List<Tools> myToolList  = new List.empty();
  static List<String> myActivities =  new List.empty();
  static  Map<String, int> teamActivityStatus = {
  };
  static  Map<String, String> teamRollCallTime = {
  };
  static bool iSTodayRollCallDone = false;
  static String TodayRollCallText = "";

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
    initializeRollDate();
    setTeamRollCallTime();
    register(UserManager, UserManager());
    register(LogsManager, LogsManager());
  }

  static printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
  static setTeamStatus() {

    if(teamActivityStatus.length == 0 || teamActivityStatus.length< myteamList.length) {
      if(teamActivityStatus.length > 0 && teamActivityStatus.length< myteamList.length) {
        teamActivityStatus.clear();
      }
      for (int i = 0; i < myteamList.length; i++) {
        teamActivityStatus[myteamList[i].fName + " " + myteamList[i].lName+"-"+myteamList[i].id.toString()] = 0;
      }
    }
  }

  static setTodayDate() {

    if(teamActivityStatus.length == 0 || teamActivityStatus.length< myteamList.length) {
      if(teamActivityStatus.length > 0 && teamActivityStatus.length< myteamList.length) {
        teamActivityStatus.clear();
      }

      for (int i = 0; i < myteamList.length; i++) {
        teamActivityStatus[myteamList[i].fName + " " + myteamList[i].lName+"-"+myteamList[i].id.toString()] = 0;
      }
    }
  }
  static setTeamRollCallTime() {

    if(teamRollCallTime.length == 0 || teamRollCallTime.length< myteamList.length) {
      if(teamRollCallTime.length > 0 && teamRollCallTime.length< myteamList.length) {
        teamRollCallTime.clear();
      }

      for (int i = 0; i < myteamList.length; i++) {
        teamRollCallTime[myteamList[i].fName + " " + myteamList[i].lName+"-"+myteamList[i].id.toString()] = "0";
      }
    }
  }
  static initializeRollDate() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("today_rollcall","-");
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
