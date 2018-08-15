//USEUNIT NodesNavigator
//USEUNIT ListView
//USEUNIT Match
//USEUNIT MavenHelper
//USEUNIT ToolbarHelper

var nodesNavigator = new NodesNavigator.NodesNavigator();

function  clickNodeByName(name)
{
  var index = nodeFind(name);
  if (index == -1) Log.Warning("Узел '"+name+"' не найден");
   else nodesNavigator.list.ClickCell(index, "");
}
//нажатие правой кнопкой на узле по имени
function  clickRNodeByName(name)
{
  var index = nodeFind(name);
  nodesNavigator.list.ClickCellR(index, "");
}
//возвращает индекс узла
function nodeFind(name){
  var index = -1;
  for (var i=0;i< nodesNavigator.list.wRowCount; i++){
    theString = nodesNavigator.list.wValue(i, 2).OleValue;
    if (matchString(theString,name)){
      index = i;
      break;
    }
  }
  return index;
}

function checkThreeSquare(name){
  clickNodeByName(name);
  var x,y,deltaX,deltaY;
  nodesNavigator.list.HoverMouseRowIndicator(nodeFind(name));
  x = Sys.Desktop.MouseX; 
  y = Sys.Desktop.MouseY;
  deltaY = nodesNavigator.list.ScreenTop;
  deltaX = nodesNavigator.list.ScreenLeft;
  x = x - deltaX+27;
  y = y - deltaY-9;
  Regions.ThreeSquare.Check(Regions.CreateRegionInfo(nodesNavigator.list, x, y, 14, 18, false), false, false, 42, 42);
}

function sortList(){
  nodesNavigator.list.ClickColumnHeader("");
}
//*************update*******
function updateToLastVersion(name){
  clickRNodeByName(name);
  nodesNavigator.alias.XtraPopupMenu.Click("Find In Strategy");
  clickRNodeByName(name);
  nodesNavigator.alias.XtraPopupMenu.Click("Update Selected Nodes To Last Version");
}
function updateToLastVersion_hotKey(name){
  clickRNodeByName(name);
  nodesNavigator.alias.XtraPopupMenu.Click("Find In Strategy");
  maven_hotkeys("^u");
}
function updateToLastVersion_toolbar(name){
  clickRNodeByName(name);
  nodesNavigator.alias.XtraPopupMenu.Click("Find In Strategy");
  toolbar_UpdateSelectedNodes();
}

function showNodeProperties(name){
  //clickRNodeByName(name);
  //nodesNavigator.alias.XtraPopupMenu.Click("Find In Strategy");
  clickRNodeByName(name);
  nodesNavigator.alias.XtraPopupMenu.Click("Show Node Properties");
}