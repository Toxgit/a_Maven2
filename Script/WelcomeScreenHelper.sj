//USEUNIT WelcomeScreen

var welcomeScreen = new WelcomeScreen.WelcomeScreen();

function welcomeScreen_ok(){welcomeScreen.ok()}
function welcomeScreen_offline(){welcomeScreen.offline()}
function welcomeScreen_exists(){if(welcomeScreen.alias.Exists) return true;}
function welcomeScreen_LoginControl_ok(){welcomeScreen.LoginControl.ok()}

function delay_welcomeScreen_offline(){
  for (var l=0; l<50; l++){
   if (welcomeScreen_exists()){
    welcomeScreen_offline();
    break;
   }
  }
}
function delay_welcomeScreen_ok(){
  for (var l=0; l<50; l++){
   if (welcomeScreen_exists()){
    welcomeScreen_ok();
    break;
   }
  }
}