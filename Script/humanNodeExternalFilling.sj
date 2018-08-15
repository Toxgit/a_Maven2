//USEUNIT MainMenuHelper
//USEUNIT OpenStrHelper
//USEUNIT NodesNavigatorHelper
//USEUNIT NodesContainerHelper
//USEUNIT WindowErrorHelper
//USEUNIT UpdateDatasetsHelper

function unknown_Nodes_ThreeeSquare(){
  //precondition
  Log.Message("Тест проверяет обновление узла, содержащий External Filling");
  openOnlyNodesNav();//Открываем тлько Nodes Navigator 
  openStrategy_quickly("3_UpdateSelectedNodes\\ExFill.strat");
  winError2_exists_ok();
  //aqUtils.Delay(3000);
  //test bodys 
  openOnlyNodesCon();
  nodesContainer_refresh();
  updateToLastVersion("humanNode");
  updateDatasets_exists();
  updateDatasets_checkByIndex(0);
  upDatasets_ok();
  xtraInfo_exists_ok();
  
}