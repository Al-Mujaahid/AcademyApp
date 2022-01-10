const BASE_URL = 'https://morning-caverns-74415.herokuapp.com/api/';

//----------------------------AUTHENTICATIONS
const LOGIN_URL = BASE_URL + 'auth/login';
const REGISTER_URL = BASE_URL + 'auth/register';
const RESET_PASSWORD = BASE_URL + 'auth/resetPassword';
const FORGOT_PASSWORD = BASE_URL + 'auth/forgotPassword';
const VERIFY_EMAIL = BASE_URL + 'auth/verifyEmail';
const RESEND_OTP = BASE_URL + 'auth/resendOtp';

//----------------------------USER PROFILE;
const GET_USER_PROFILE = BASE_URL + 'profile';
const UPDATE_USER_PROFILE = BASE_URL + 'profile';
const UPDATE_USER_PROFILE_PICTURE = BASE_URL + 'profilePicture';

//----------------------------AZKAR
const GET_ALL_AZKAR = BASE_URL + 'azkar';
const CREATE_AZKAR = BASE_URL + 'azkar';
const UPDATE_AZKAR = BASE_URL + 'azkar/${1}';
const GET_SINGLE_AZKAR = BASE_URL + 'azkar/${1}';
const DELETE_AZKAR = BASE_URL + 'azkar/${1}';

//-----------------------------BRANCHES
const GET_BRANCHES = BASE_URL + 'branch';
const CREATE_BRANCH = BASE_URL + 'branch';
const UPDATE_BRANCH = BASE_URL + 'branch/${1}';
const GET_SINGLE_BRANCH = BASE_URL + 'branch/${1}';
const DELETE_BRANCH = BASE_URL + 'branch/${1}';

//-----------------------------NEWS
const GET_NEWS = BASE_URL + 'news';
const CREATA_NEWS = BASE_URL + 'news';
const UPDATE_NEWS = BASE_URL + 'news${1}';
const DELETE_NEWS = BASE_URL + 'news${1}';

//----------------------------MENTOR/MENTEE
const GET_MENTOR = BASE_URL + 'myMentors';
const GET_MENTEES = BASE_URL + 'myMentees';
const PENDING_MENTOR_REQUEST  = BASE_URL + 'userMentorRequest';
const PENDING_MENTEE_REQUEST  = BASE_URL + 'userMenteeRequest';
const RATE_MENTOR_MENTEE =  BASE_URL + 'rate';
//----------------------------ACCEPT OR DECLINE REQUEST
const ACCEPT_OR_DECLINE_REQUEST = BASE_URL + 'acceptOrDecline';
//----------------------------MEETING SCHEDULE
const CREATE_SCHEDULE = BASE_URL + 'schedule';
const GET_SCHEDULE = BASE_URL + 'schedules';
//const


//----------------------------RECITERS
const GET_RECITERS = BASE_URL + 'reciter';
const CREATE_RECITER = BASE_URL + 'reciter';
const GET_SINGLE_RECITER = BASE_URL + 'reciter/${1}';
const DELETE_RECIRER = BASE_URL + 'reciter';

//------------------------------NOTIFICATION
const NOTIFICATION = 'http://127.0.0.1:3333/api/notification';
