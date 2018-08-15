//USEUNIT Maven
//USEUNIT Match

var maven = new Maven.Maven();

function maven_hotkeys(key){
   maven.hotkeys(key);       
}
function maven_strategyExists(){return maven.strategyExists()}

function maven_FindChildrenIndex(name){
  var index = -1;
  for (var i=0; i< maven.alias.ChildCount; i++)
    if (matchString(maven.alias.Child(i).Name,name)){
      index = i;
      break;
    }
  return index;
}
function maven_closeWindowByName(name){  
  aqUtils.Delay (500);
  p = Sys.Process("Maven");
  p.Refresh();
  var index = maven_FindChildrenIndex(name);
  Log.message(index);
  if (index != -1){
    Log.Checkpoint("Window "+name+" is Exists, clouse it");
    maven.alias.Child(index).Close();
  }
}
function sss(){

  var count = maven.alias.ChildCount;
  
  //matchString(maven.Child(i).Name,name);
  Log.Message(count);
  Log.Message(Aliases.Maven.ChildCount);
  //for (var i=0; i< maven.ChildCount; i++){
    //Log.Message(maven.Child(0).Name)
}
