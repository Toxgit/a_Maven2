//USEUNIT MainMenuHelper
//USEUNIT OpenStrHelper
//USEUNIT NodesNavigatorHelper
//USEUNIT NodesContainerHelper
//USEUNIT WindowErrorHelper

function unknown_Nodes_ThreeeSquare(){
  //initialization
  var testStrategyPath = "InputNode.strat";
  //precondition
  Log.Message("Тест проверяет иконку(три кубика) для неизвестного Input узла");
  openOnlyNodesNav();//Открываем тлько Nodes Navigator 
  openStrategy_quickly(testStrategyPath);
  winError2_exists_ok();
  
  //test bodys 
  checkThreeSquare("a_FormInput");
  checkThreeSquare("a_Init");
  openOnlyNodesCon();
  nodesContainer_refresh();
}