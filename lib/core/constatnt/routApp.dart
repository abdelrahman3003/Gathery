import 'package:note_app/view/auth/signin/signin_view.dart';
import 'package:note_app/view/auth/signup/signup_view.dart';
import 'package:note_app/view/event/join_event_view.dart';
import 'package:note_app/view/event/create_event.dart';
import 'package:note_app/view/homepage/buttom_navigator_bar.dart';
import 'package:note_app/view/homepage/chat_view.dart';
import 'package:note_app/view/homepage/profile_view.dart';
import 'package:note_app/view/homepage/vote_view.dart';
import 'package:note_app/view/homepage/widget/home/add_task_view.dart';
import 'package:note_app/view/homepage/widget/home/task_details.dart';
import 'package:note_app/view/homepage/widget/vote/add_vote_view.dart';
import 'package:note_app/view/splash/splash_view.dart';
import 'package:note_app/view/welcome/welcome_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

const kSplashView = "/SplashView";
const kWelcomeView = "/WelcomeView";
const kSignInView = "/SignInView";
const kSignUpView = "/SignUpView";
const kCreateEventView = "/CreateEventView";
const kJoinEventView = "/JoinEventView";
const kCreateEvent = "/CreateEvent";
const kBottomNavigationScreen = "/BottomNavigationScreen";
const kTaskDetailsView = "/TaskDetailsView";
const kAddTaskView = "/AddTaskView";
const kProfileView = "/ProfileView";
const kHomeView = "/HomeView";
const kVoteView = "/KVoteView";
const kAddVoteView = "/AddVoteView";
const kChatView = "/ChatView";
List<GetPage<dynamic>>? getPages = [
  GetPage(name: kSplashView, page: () => const SplashView()),
  GetPage(name: kWelcomeView, page: () => const WelcomeView()),
  GetPage(name: kSignInView, page: () => const SignInView()),
  GetPage(name: kSignUpView, page: () => const SignUpView()),
  GetPage(name: kJoinEventView, page: () => const JoinEventView()),
  GetPage(name: kCreateEvent, page: () => const CreateEvent()),
  GetPage(name: "/", page: () => const BottomNavigationScreen()),
  GetPage(name: kTaskDetailsView, page: () => const TaskDetailsView()),
  GetPage(name: kAddTaskView, page: () => const AddTaskView()),
  GetPage(name: kProfileView, page: () => const ProfileView()),
  GetPage(name: kVoteView, page: () => const VoteView()),
  GetPage(name: kAddVoteView, page: () => const AddVoteView()),
  GetPage(name: kChatView, page: () => const ChatView()),
];
