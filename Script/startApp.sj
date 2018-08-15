//USEUNIT WelcomeScreenHelper
//USEUNIT MainFormHelper


function start(){
  /*aqUtils.Delay (500);
  if (Sys.Process("Maven").exists) Sys.Process("Maven").close();*/
  TestedApps.Maven.Run();
  //ждем welcomScreen
  delay_welcomeScreen_ok();
  var loginControl = Aliases.Maven.WelcomeScreenForm.LoginControl;
  //ждем LoginControl
  while (true){if(loginControl.Exists)break;aqUtils.Delay(2000);}
  loginControl.UserName.SetText("1");//("MAIN\\alevkovskiy"); //
  textEdit = loginControl.Password;
  textEdit.TextBoxMaskBox.Click(21, 7);
  textEdit.SetText("1");
  loginControl.ok.ClickButton();
  //ждем MainForm
  wait_mainForm();
}