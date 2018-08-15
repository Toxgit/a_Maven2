//old
//USEUNIT Variables

//USEUNIT XtraInfo
//USEUNIT CheckDisable
//USEUNIT WindowErrorHelper
//USEUNIT SelectConstraint
//USEUNIT ListView 

var variables = new Variables.Variables();
var selectConstraint = new SelectConstraint.SelectConstraint();

function variables_add(){variables.add()}
function variables_ok(){variables.ok()}
function variables_cancel(){variables.cancel()}
function variables_apply(){variables.apply()}
function variables_unSelectAll(){variables.unSelectAll();}
function variables_selectAll(){variables.selectAll()}
function variables_delete(){ variables.del();}
function variables_copy(){variables.copy()}
function variables_toSelectConstraint(){variables.toSelectConstraint()}

function variables_detailetInfo(){variables.alias.tabControl.Click(100,8)}
function variables_properties(){variables.alias.tabControl.Click(28,8)}

//***Find*********************************
function listFindVar(name){
  var index = -1;
  for (var i=0;i<variables.list.wRowCount; i++)
    if (variables.list.wValue(i, 1).OleValue == name)
    {
      index = i;
      break;
    }
  return index;
}
function listFindDirectionVar(direction){
  var index = -1;
  for (var i=0;i<variables.list.wRowCount; i++)
    if (variables.list.wValue(i, 3).OleValue == direction)
    {
      index = i;
      break;
    }
  return index;
}
//***Exists********************************
function variableExists(name){
  if (listFindVar(name) >-1) return true;
  else return false;
}
function varDirectionExists(title){
  if (listFindDirectionVar(title) >-1)return true
  else return false;
}
//***DeleteAll*******************************
function deleteAllVariable(){
  var info = new XtraInfo.XtraInfo();
  for (var i=0; i < variables.list.wRowCount; i++)
  {
    variables.del();
    info.ok();
  }
}

//**********Set Value*********************************
function setValueToField(value){
  if(variables.alias.Properties.TextEdit.ReadOnly) Log.Message("Поле ReadOnly");
  else variables.alias.Properties.TextEdit.Name.SetText(value);
}
function setVarNameLikeUser(name){
  if(name == "clear") {variables.alias.Properties.TextEdit.Name.SetFocus();variables.alias.Properties.TextEdit.Name.Keys("^a");variables.alias.Properties.TextEdit.Name.Keys("[BS]");}
  else variables.alias.Properties.TextEdit.Name.Keys(name);
}
function setDropDownType(value){
  if ((value == "Date")||(value == "DateColumn")||(value == "BinaryData")||(value == "BinaryDataColumn")){
    variables.alias.Properties.drop_downLists.Keys("d");
    chooseProperty("Name");
    chooseProperty("Type");
    variables.alias.Properties.drop_downLists.Keys(value);
  }else{
     variables.alias.Properties.drop_downLists.Keys(value);
  }
}
function setDropDownList(value){
  variables.alias.Properties.drop_downLists.Keys("^a");
  variables.alias.Properties.drop_downLists.Keys("[BS]");
  variables.alias.Properties.drop_downLists.Keys(value);
}
function setConstraintName(value){
  variables.alias.Properties.ConstraintButton.constraint.Keys("^a");
  variables.alias.Properties.ConstraintButton.constraint.Keys("[BS]");
  variables.alias.Properties.ConstraintButton.constraint.Keys(value);
}
//*******Verify AND Check****************************
function verifyDirection(direction){
  if(varDirectionExists(direction))Log.Checkpoint("Переменная  c Direction = "+direction+" отображается в окне стратегических переменных.");
  else Log.Warning("Переменная c Direction = "+direction+" не отображается в окне стратегических переменных.");   
 }
 
function verifyName_ErrorExists (){
  if (Regions.ValidError.Check(Regions.CreateRegionInfo(variables.alias.Properties.TextEdit, 0, 0, 18, 13, false), false, false, 31, 34))
    return true;
  else return false;
}
function verifyErrorMessageInWinError2(error){
  var winError2 = new WindowError2.WindowError2();
  if (winError2.label() == error){
    Log.Checkpoint("Текст сообщения об ошибке правельный.");
    winError2.ok();
  }else{
    Log.Warning("Текст сообщения об ошибке не совпадает с ожидаемым.");
    winError2.ok();
  }
}
function checkVarPosition(variable, position){ //проверка проходит по индексу переменной в конкретной стратегии
   if ( listFindVar(variable) == position) Log.Checkpoint("Переменная "+variable+" на правильной позиции"+position);
   else Log.Warning("Переменная "+variable+" не на "+position+" позиции");
}
function checkEmptyVarList (){
  if (variables.list.wRowCount == 0) Log.Checkpoint("Cписок переменных пуст.");
  else Log.Warning("Cписок переменных не пуст.");
}
function checkPropertiForSelectedVariable(property, value){
  if (getPropertyValue(property) == value) Log.Checkpoint("Свойство '"+property+"' = "+value);
  else Log.Warning("Свойство '" + property + "' != "+value);
}
function checkLinked(name, value){
 if (getPropertyLinked(name) == value) Log.Checkpoint("Cвойство Linked переменной "+name+" = "+value);
  else Log.Warning("Поле Linked переменной "+name+" должно быть"+value ); 
}
//******Click Row AND CHOOSE Property**************************
function clickRowByName(name){
  var index = listFindVar(name);
  variables.alias.List.ClickRowIndicator(index);
}
function clickVariableByIndex(index){
  var i = index + 0;
  clickRowByIndex(variables.alias,i);
}
function chooseProperty(property){
  if ((property == "Constraint name") || (property == "Constraint values")){
    variables.alias.Properties.wItems("3. Constraint").ClickValue(property);
  }else{
    variables.alias.Properties.wItems("2. Common").ClickValue(property);
  }
}
//**********Keybord*****************
function propertiesGridKeybord(keys){
    variables.alias.Properties.Keys(keys)
}
//********Filter**********************
function filterVariables(column, value){
  var x,y,deltaX,deltaY;
  variables.list.HoverMouseColumnHeader(column, 10, 10);
  x = Sys.Desktop.MouseX; 
  y = Sys.Desktop.MouseY;
  deltaY = variables.alias.ScreenTop;
  deltaX = variables.alias.ScreenLeft;
  x = x - deltaX;
  y = y - deltaY+25;
  variables.click(x,y);
  /*
  variables.alias.List.ClickColumnHeader(column);
  x = Sys.Desktop.MouseX;
  y = Sys.Desktop.MouseY + 40;
  variables.alias.List.Click(y,x);
  //variables.alias.List.click(y,x); old solution*/
  variables.alias.List.Filter.Keys(value);
}

function filterVariablesClear(){
  variables.alias.List.Filter.Keys("^a");
  variables.alias.List.Filter.Keys("[Del]");
}

//******Get*************
function getPropertyValue(property){
  if (property == "Used in basic nodes")return variables.alias.Properties.wItems("1. Additional").wValue(property);
  else if((property =="Constraint name")||(property =="Constraint values") ) return variables.alias.Properties.wItems("3. Constraint").wValue(property);
  else return variables.alias.Properties.wItems("2. Common").wValue(property);
}
function getPropertyLinked(name,index){ 
  if (index != undefined) return variables.list.wValue(index, 4).OleValue; 
  else return variables.list.wValue(listFindVar(name), 4).OleValue;
}
//*****get name by index
function getNameByIndex(index){
  return variables.list.wValue(index, 1).OleValue;
}
//****get count variables
function getCountVariables(){
return variables.list.wRowCount;
}
//Создание переменной с указанием  свойств
function createVariableWithCostomProperty(item){
  variables.add();
  setValueToField(item.name);
  chooseProperty("Type");
  setDropDownType(item.type);
  chooseProperty("Description");
  setValueToField(item.description);
  chooseProperty("Direction");
  setDropDownList(item.direction);
  chooseProperty("Initial value");
  setDropDownList(item.initialValue);
  variables.apply(); 
}
//Редактирование переменной 
function editVariableWithCostomProperty(item){
  chooseProperty("Name");
  setValueToField(item.newName);
  chooseProperty("Type");
  setDropDownType(item.type);
  chooseProperty("Description");
  setValueToField(item.description);
  chooseProperty("Direction");
  setDropDownList(item.direction);
  chooseProperty("Initial value");
  setDropDownList(item.initialValue);
  if (variables.alias.Apply.Enabled) variables.apply();
  else  chooseProperty("Name");
}

function editUsedVariable(item){
  chooseProperty("Name");//Name fold
  setValueToField(item.newName);
  chooseProperty("Type");
  xtraError_exists_ok();
  chooseProperty("Type");//type
  setDropDownType(item.newType);
  xtraError_exists_ok();
  chooseProperty("Description");
  setValueToField(item.description);
  chooseProperty("Direction");
  setDropDownList(item.direction);
  chooseProperty("Initial value");
  setDropDownList(item.initialValue);
  chooseProperty("Constraint name");
  setConstraintName(item.newConstraint);
  if (variables.alias.Apply.Enabled) variables.apply();
  else  chooseProperty("Name");
  xtraError_exists_ok();
}

//Проверка всех свойст переменной 
function verifyVariableWithCostomProperty(item){
  clickRowByName(item.name);
  checkPropertiForSelectedVariable("Name", item.name);
  checkPropertiForSelectedVariable("Used in basic nodes", item.usedInBasicNodes);
  checkPropertiForSelectedVariable("Description", item.description);
  checkPropertiForSelectedVariable("Type", item.type);
  checkPropertiForSelectedVariable("Direction", item.direction);
  checkPropertiForSelectedVariable("Initial value", item.initialValue);
  checkLinked(item.name, item.linked); 
}

//Constraint

//********Filter**********************
function filterSelectConstraint(column, value){
  var x,y,deltaX,deltaY;
  variables.list.HoverMouseColumnHeader(column, 10, 10);
  x = Sys.Desktop.MouseX; 
  y = Sys.Desktop.MouseY;
  deltaY = variables.alias.ScreenTop;
  deltaX = variables.alias.ScreenLeft;
  x = x - deltaX;
  y = y - deltaY+25;
  variables.click(x,y);
  /*
  variables.alias.List.ClickColumnHeader(column);
  x = Sys.Desktop.MouseX;
  y = Sys.Desktop.MouseY + 40;
  variables.alias.List.Click(y,x);
  //variables.alias.List.click(y,x); old solution*/
  variables.alias.List.Filter.Keys(value);
}

function filterSelectConstraintClear(){
  variables.alias.List.Filter.Keys("^a");
  variables.alias.List.Filter.Keys("[Del]");
}
//*************Detailed Infromation Tab*************
//****Linked****
function variableDetailInfo_pickNodeName(list,name){
  switch (list){
    case "linked":
      var index =  listMatchInColumn(variables.DetalInfoLinkedList,"Node name", name);
      if (index == -1){Log.warning(name+" not found"); return;}
      clickRowByIndex( variables.DetalInfoLinkedList,index);
    break;
    case "used":
      var index =  listMatchInColumn(variables.DetalInfoUsedList,"Node name", name);
      if (index == -1){Log.warning(name+" not found"); return;}
      clickRowByIndex( variables.DetalInfoUsedList,index);
    break;
    case "script":
      var index =  listMatchInColumn(variables.DetalInfoScriptList,"Global script and statistics", name);
      if (index == -1){Log.warning(name+" not found"); return;}
      clickRowByIndex( variables.DetalInfoScriptList,index);
    break;
  }
}
function variableDetailInfo_openNodeProperties(list,name){
  switch (list){
    case "linked":
      var index =  listMatchInColumn(variables.DetalInfoLinkedList,"Node name", name);
      if (index == -1){Log.warning(name+" not found"); return;}
      variables.DetalInfoLinkedList.list.ClickCellXY(index, "Node name", 35, 8);
    break;
    case "used":
      var index =  listMatchInColumn(variables.DetalInfoUsedList,"Node name", name);
      if (index == -1){Log.warning(name+" not found"); return;}
      variables.DetalInfoUsedList.list.ClickCellXY(index, "Node name", 35, 8);
    break;
    case "script":
      variables.DetalInfoScriptList.list.ClickCellXY(0, "Global script and statistics", 35, 8);
    break;
  }
  
}