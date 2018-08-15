//USEUNIT WelcomeScreenHelper
//USEUNIT MainFormHelper
//USEUNIT MainMenuHelper
//USEUNIT AppOptionsHelper

function StartOffline(){
  TestedApps.Maven.Run();
  //ждем welcomScreen
  delay_welcomeScreen_offline();
  //ждем MainForm
  wait_mainForm();

  var selectStartUpOptionsForm = Aliases.Maven.SelectStartUpOptionsForm;  
  if (selectStartUpOptionsForm.Exists)
    {
      Log.Message("Окно настройки запуска приложения - закрыто"); 
      selectStartUpOptionsForm.simpleButton1.ClickButton();
    }
    
  menu_options();
  appOption_workFlowEmpty();
  appOption_ok();
}
function StartOffline_forRestart(){
  TestedApps.Maven.Run();
  //ждем welcomScreen
  delay_welcomeScreen_offline();
  //ждем MainForm
  wait_mainForm();
}