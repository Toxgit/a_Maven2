//USEUNIT MainMenuHelper
//USEUNIT AppOptionsHelper
//USEUNIT WindowHelper
//USEUNIT MainFormHelper

function firstSetupApp(){
  var selectStartUpOptionsForm = Aliases.Maven.SelectStartUpOptionsForm;  
  if (selectStartUpOptionsForm.Exists){
    Log.Message("Окно настройки запуска приложения - закрыто"); 
    selectStartUpOptionsForm.simpleButton1.ClickButton();
  }
  maximizeWin(mainForm);
  menu_options();
  appOption_workFlowEmpty();
  appOption_ok();
}