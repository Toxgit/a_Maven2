//USEUNIT ToolbarHelper
//USEUNIT OpenStrategyRemoteHelper

function getVersionNameStrategy(){
  toolbar_openStrategyRemote();
  Project.Variables.a_Fetch_version =  getVersionName("a_Fetch"); 
  Project.Variables.Import_constraints_varsion = getVersionName("Import constraints");
  
  Log.Message(Project.Variables.a_Fetch_version);
  Log.Message(Project.Variables.Import_constraints_varsion);
  openStrRemote_cancel();
}