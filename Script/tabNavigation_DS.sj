//USEUNIT NodeHelper
//USEUNIT ToolbarHelper

function TabNavigation_DS(){
  //precondition
  Log.Message("Тест навигации на табам");
  //test bodys 
  navTabs2tabs("Annotation");
  navTabs2tabs("Mapping");
  navTabs2tabs("Annotation");
  navTabs2tabs("Mapping");
  //postcondition
  inputNode_cancel();
  toolbar_close_withoutSave();
}