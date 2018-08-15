//USEUNIT TextBox
//USEUNIT Match

function ListViewFindItem(ListView, title){
  var index = -1;
  for (var i=0;i<ListView.wItems.Count; i++)
    if (ListView.wItems.Item(i).Text == title){
      index = i;
      break;
    }
  return index;
}
function ListViewSelectItem(ListView, title){
  var index = ListViewFindItem(ListView, title);
  if (index>-1) ListView.wItems.Item(index).Click()
  else Log.Warning("Item "+titlt+" was not found");
}
function ListViewDoubleclickItem(ListView, title){
  var index = ListViewFindItem(ListView, title);
  if (index>-1) ListView.wItems.Item(index).DblClick()
  else Log.Warning("Item "+titlt+" was not found");
}
//*********SubVersion
function ListViewPickSubVersion(ListView, versionName){
  var parentName = getParentName(versionName);
  var indexP = ListViewFindItem(ListView, parentName);
  var indexC = ListViewFindSubItem(ListView, indexP, versionName);
  if (indexP>-1 && indexC>-1) ListView.wItems.Item(indexP).Items.Item(indexC).Click();
}
function getParentName(name){
  var indx = name.indexOf(" ("); 
  return name.substring(0, indx);
}
function ListViewFindSubItem(ListView, indexP, versionName){
  var index = -1;
  for (var i=0;i<ListView.wItems.Item(indexP).Items.Count; i++)
    if (ListView.wItems.Item(indexP).Items.Item(i).Text == versionName){
      index = i;
      break;
    }
  return index;
}

function ListViewDoubleSubItem(ListView, versionName){
  var parentName = getParentName(versionName)
  var indexP = ListViewFindItem(ListView, parentName);
  var indexC = ListViewFindSubItem(ListView, indexP, versionName);
  if (indexP>-1 && indexC>-1) ListView.wItems.Item(indexP).Items.Item(indexC).DblClick();
}

//***Find*****Variable***Constraint******************

//в тестах для переменных используется не универсальный хелпер,
// для Constraint написал универсальные хелпер для работы со списком
function listFind(object, name){
  var index = -1;
  for (var i=0;i< object.list.wRowCount; i++)
    if (object.list.wValue(i, "Name").OleValue == name){
      index = i;
      break;
    }
  return index;
}
//..ищем значение в указанной колонке. для теста создание Numeric constraint надо найти номер поля макс и мин значений
function listFinInColumn(object,column, name)
{
  var index = -1;
  for (var i=0;i< object.list.wRowCount; i++)
    if (object.list.wValue(i, column).OleValue == name)
    {
      index = i;
      break;
    }
  return index;
}
function listMatchInColumn(object,column, name)
{
  var index = -1;
  for (var i=0;i< object.list.wRowCount; i++)
    if (matchString(object.list.wValue(i, column).OleValue, name)){
      index = i;
      break;
    }
  return index;
}
//***Exists********************************
function listElementExists(object, name)
{
  if (listFind(object, name) >-1) return true;
  else return false;
}
function listElementNotExists(object, name)
{
  if (listFind(object, name) >-1)
  {   
    return true;
  }
  else
  {
    Log.Checkpoint("Constraint "+name+" - NOT exists");
    return false;
  }
}
//*********Filter***************
function filterList(object, column, value)
{
  var x,y,deltaX,deltaY;
  object.list.HoverMouseColumnHeader(column, 10, 10);
  x = Sys.Desktop.MouseX; 
  y = Sys.Desktop.MouseY;
  deltaY = object.alias.ScreenTop;
  deltaX = object.alias.ScreenLeft;
  x = x - deltaX;
  y = y - deltaY+25;
  object.alias.Click(x,y);
  textBoxSet_Keys (object.list.Filter, value)
}
function filterListClear(object)
{
  object.alias.List.Filter.Keys("^a");
  object.alias.List.Filter.Keys("[Del]");
}
//**********sort********
function sortListByHeader(object,header){
  object.list.ClickColumnHeader(header);
 }
//****Проверка позиции елемента в списке***************
function checkListItemPosition(object, name, position){
  var curPosition = listFinInColumn(object,1,name);
  if ( curPosition == position) Log.Checkpoint("Переменная '"+name+"' на правильной позиции "+position);
  else Log.Warning("Переменная '"+name+"' не на "+position+" позиции, а на: "+curPosition);
}
function checkItemPosition(object, column, name, position){
  var curPosition = listFinInColumn(object,column,name);
  if ( curPosition == position) Log.Checkpoint("Переменная '"+name+"' на правильной позиции "+position);
  else Log.Warning("Переменная '"+name+"' не на "+position+" позиции, а на: "+curPosition);
}
function checkEmptyList(object){
  if (object.list.wRowCount == 0) Log.Checkpoint("Cписок пуст.");
  else Log.Warning("Cписок не пуст.");
}
function listEmpty(object){
  if (object.list.wRowCount == 0) return true;
  else return false;
}
//********click****choose***********************
function clickRowByIndex(object,index){
  object.list.ClickRowIndicator(index);
}
function clickListRowByName(object, name){
  var index = listFind(object, name);
  if (index == -1){Log.warning(name+" not found"); return;}
  object.list.ClickRowIndicator(index);
}
function clickListRow(object,column, value){
  var ind =  listFinInColumn(object,column, value);
   if (ind == -1){Log.warning(value+" not found"); return;}
   object.list.ClickRowIndicator(ind);
}

//**********GET*************
function getValueOfListFild(object, name, title){  
  var value = object.list.wValue(listFind(object, name), title);
  if (value === null) return "";
  else return value.OleValue; 
}
//***********verify*****check****
function checkValueOfField(object, name, title, value){
  var str = getValueOfListFild(object, name, title).toString();
  if (str == value) Log.Checkpoint("Поле '"+title+"' = "+value);
  else Log.Warning("Поле '" + title + "' != "+value+", а равно: "+str);
  
}