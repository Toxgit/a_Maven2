//USEUNIT NodeHelper
//USEUNIT OpenStrHelper

function TabNavigation_CredProd(){
  //precondition
  Log.Message("Тест навигации на табам");
  //test bodys 
  navTabs3tabs("Debug");
  navTabs3tabs("Mapping");
  navTabs3tabs("Annotation");
  navTabs3tabs("Mapping");
  //postcondition
  inputNode_cancel();
}