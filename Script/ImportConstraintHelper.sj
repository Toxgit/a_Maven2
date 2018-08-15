//USEUNIT ImportConstraint
//USEUNIT ListView
//USEUNIT Popup_importConstraint


var importConstraint = new ImportConstraint.ImportConstraint();
var popupImpotrtConstraint = new Popup_importConstraint.Popup_importConstraint();

function impConstr_cancel(){importConstraint.cancel();}
function impConstr_import(){importConstraint.importt();}
function impConstr_selectAll(){importConstraint.selectAll();}
function impConstr_unselectAll(){importConstraint.unselectAll();}
function impConstr_browse(){importConstraint.browse();}
function impConstr_load(){importConstraint.load();}


function impConstr_selectRemoteStrategy(title)
{
  importConstraint.alias.UploadedStrategies.DropDown();
  //popupImpotrtConstraint.list.DblClickItem("|"+title);
  ListViewDoubleclickItem(popupImpotrtConstraint.list, title);
}

function impConstr_selectEarlierRemoteStrategy(versionName)
{
  importConstraint.alias.UploadedStrategies.DropDown();
  //альтернативное решение
  //popupImpotrtConstraint.list.DblClickItem("|"+item.name+"|"+item.versionName");
  ListViewDoubleSubItem(popupImpotrtConstraint.list, versionName);
}

function impConstr_SelectSource(num)
{
  var sourse;
  if (num == 1) sourse= "From strategies uploaded to the server:";
  else sourse = "From strategy files on the hard disk:" ;
  importConstraint.alias.SelectSource.ClickItem(sourse);
}
function verifyConstraintFromStrategy(item)
{
  clickListRowByName(importConstraint, item.name);
  checkValueOfField(importConstraint, item.name, "Selected", item.selected);
  checkValueOfField(importConstraint, item.name, "Name", item.name);
  checkValueOfField(importConstraint, item.name, "Type", item.type);
  checkValueOfField(importConstraint, item.name, "Values", item.values);
}
function selectConstraint(name)
{
 var index = listFind(importConstraint, name);
  importConstraint.list.ClickCell(index, "Selected"); 
}
function filterColumnSelected(value)
{
  var x,y,deltaX,deltaY;
  importConstraint.list.HoverMouseColumnHeader("Selected", 10, 10);
  x = Sys.Desktop.MouseX; 
  y = Sys.Desktop.MouseY;
  deltaY = importConstraint.alias.ScreenTop;
  deltaX = importConstraint.alias.ScreenLeft;
  x = x - deltaX;
  y = y - deltaY+20;
  do 
  {
    importConstraint.alias.Click(x,y);
  } while (value != importConstraint.list.CheckEdit.wState)
}
function setWidthCulumnSelected()
{
  importConstraint.list.Drag(44, 12, 20, 0);
}
  