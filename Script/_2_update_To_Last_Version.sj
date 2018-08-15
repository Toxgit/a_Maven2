//USEUNIT MainMenuHelper
//USEUNIT NodesNavigatorHelper
//USEUNIT WindowErrorHelper

function update_To_Last_Version(){
  //precondition
  Log.Message("Тест обновления узла до последней версии");
  openOnlyNodesCon();
  //aqUtils.Delay(3000);
  //test bodys 
   updateToLastVersion("a_Form");
   xtraInfo_exists();
   xtraInfo_ok();
   Log.Checkpoint("Узел обновлен");
   updateToLastVersion("a_In");
   xtraInfo_exists();
   xtraInfo_ok();
   Log.Checkpoint("Узел обновлен");
}