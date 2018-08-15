//USEUNIT MainMenuHelper
//USEUNIT OpenStrHelper
//USEUNIT NodesNavigatorHelper
//USEUNIT WindowErrorHelper
//USEUNIT NodeHelper

function updateCPAndDS(){
  //initialization
  var testStrategyName = "CreditProduct_DataSource.strat";//name стратегии для теста
  //precondition
  Log.Message("Тест update кредитного продукта и DS");
  openOnlyNodesNav();
  openStrategy_quickly(testStrategyName);
  //test bodys 
  updateToLastVersion_hotKey("TestProduct");
  delay_xtraInfo_ok();
  Log.Message("TestProduct обновлен");
  updateToLastVersion_toolbar("Sasha_DS");
  delay_xtraInfo_ok();
  Log.Message("Sasha_DS обновлен");
  updateToLastVersion("a_tableApp");
  delay_xtraInfo_ok();
  Log.Message("a_tableApp обновлен");
}