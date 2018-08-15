//USEUNIT ToolbarHelper
//USEUNIT NodeHelper
//USEUNIT OpenStrHelper

function TabNavigation(){
  //precondition
  Log.Message("Тест навигации на табам");
  //test bodys 
  navTabsWithPinSelect("Pin");
  navTabsWithPinSelect("Mapping");
  navTabsWithPinSelect("Debug");
  navTabsWithPinSelect("Annotation");
  navTabsWithPinSelect("Pin");
  navTabsWithPinSelect("Mapping");
  //postcondition
  inputNode_cancel();
  toolbar_close_withoutSave();
}