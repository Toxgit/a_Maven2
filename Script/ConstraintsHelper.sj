//USEUNIT Constraint
//USEUNIT ListView
//USEUNIT CheckDisable
//USEUNIT WindowHelper
//USEUNIT WindowErrorHelper
//USEUNIT TextBox

var constraint = new Constraint.Constraint();
//constraint.constraintValue.list =  Aliases.Maven.Constraint.Properties.Values
function constraint_import(){constraint.imp()}
function constraint_ok(){constraint.ok()}
function constraint_add(){constraint.add()}
function constraint_copy(){constraint.copy()}
function constraint_cancel(){constraint.cancel()}
function constraint_selectAll(){constraint.selectAll()}
function constraint_unSelectAll(){constraint.unSelectAll()}
function constraint_delete(){constraint.del()}

function constraint_detailetInfo(){constraint.alias.tabControl.Click(100,5)}
function constraint_properties(){constraint.alias.tabControl.Click(28,5)}

function pick_Constraint(name){clickListRowByName(constraint, name)}
function pick_FirstConstraint(){clickRowByIndex(constraint,0)}

function verifyConstraintWithCustomProperty(object,item)
{
  clickListRowByName(object, item.name);
  checkValueOfField(object, item.name, "Name", item.name);
  checkValueOfField(object, item.name, "Type", item.type);
  checkValueOfField(object, item.name, "Values", item.values);
  checkValueOfField(object, item.name, "Used", item.used); 
}
//********Set Value***********************
function setName(object,value){
  textBoxSetText (object.alias.tabControl.Properties.Common.TextEdit.TextBox, value);
}
//*******Exists********
function constraintValue_textboxExists(){
  if (constraint.alias.tabControl.Properties.Values.TextEdit.TextBox.Exists)return true;
  else return false;
}
//****** CHOOSE Property**************************
function chooseNameOrType(object,property)
{
 object.alias.tabControl.Properties.Common.wItems(1).ClickValue(property);
}
function setType(value){
  chooseNameOrType(constraint,"Type");
  constraint.alias.tabControl.Properties.Common.ComboBox.Keys(value);
}
function constraint_checkDisableType(){
  chooseNameOrType(constraint,"Type");
  if(constraint.alias.tabControl.Properties.Common.ComboBox.Value == null) Log.Checkpoint("Type is disabled");
  else Log.Warning("Type isn't disabled")
}
function setMinValue(value)
{
  var row = listFinInColumn(constraint.constraintValue, "Constraint values", "Min value");
  constraint.constraintValue.list.ClickCell(row, "Value");
  if (!constraintValue_textboxExists()){
    return Log.Message("Field TextBox is disabled");
  }
  constraint.constraintValue.list.Keys("^a");
  constraint.constraintValue.list.Keys(value);
  constraint.constraintValue.list.Click();
}
function setMaxValue(value)
{
  var row = listFinInColumn(constraint.constraintValue, "Constraint values", "Max value");
  constraint.constraintValue.list.ClickCell(row, "Value");
  if (!constraintValue_textboxExists()){
    return Log.Message("Field TextBox is disabled");
  }
  constraint.constraintValue.list.Keys("^a");
  constraint.constraintValue.list.Keys(value);
  constraint.constraintValue.list.Click();
}
function setStrConstraint(value){
 constraint.constraintValue.list.DblClickNewRowCell("Constraint values");
 constraint.constraintValue.list.TextEdit.SetText(value);
 constraintValue_plus();
 warning_exists_ok();
 constraintValue_cross();
}
function setStrCon_UsedInNode(value){
 constraint.constraintValue.list.DblClickNewRowCell("Constraint values");
 constraint.constraintValue.list.TextEdit.SetText(value);
 constraintValue_plus();
 warning_exists_ok();
 warning_exists_ok();
 constraintValue_cross();
}
function setStrConstraint_fail(value)
{
 constraint.constraintValue.list.DblClickNewRowCell("Constraint values");
 constraint.constraintValue.list.TextEdit.SetText(value);
 constraintValue_plus();
 winError2_exists_ok();
 constraintValue_cross();
}
function constraintValue_plus(){constraint.gridControlNavigator.Click(6, 8);}
function constraintValue_minus(){constraint.gridControlNavigator.Click(29, 8);}
function constraintValue_cross(){constraint.gridControlNavigator.Click(43, 8);}

//Edit Value constraint****************
function editNumericConWithoutType(item){
  //setType("Numeric");если менять тип, то Варнинг окно
  pick_Constraint(item.name);
  setMaxValue(item.max);
  setMinValue(item.min);
}
function editNumericCon_UsedInNode(item){
  pick_Constraint(item.name);
  setMaxValue(item.max);
  warning_exists_ok();
  setMinValue(item.min);
  warning_exists_ok();
}
function deleteAllStrConValues(){
  var count = constraint.constraintValue.list.wRowCount
  for (var u=0; u<count; u++){constraintValue_minus()} 
}
function deleteAllStrConValues_UsedInNode(){
  var count = constraint.constraintValue.list.wRowCount
  for (var u=0; u<count; u++){
    constraintValue_minus();
    warning_exists_ok();
  } 
}
function editStrConWithoutType(item){
  pick_Constraint(item.name);
  deleteAllStrConValues();
  setStrConstraint(item.values);
}
function editStrCon_UsedInNode(item){
  pick_Constraint(item.name);
  deleteAllStrConValues_UsedInNode();
  setStrCon_UsedInNode(item.values);
}
function deleteNotlinkedConstraint(){
  constraint.del();
  info.ok();
  info.ok();
}
function constraintValue_checkDisableEdit(item){
  pick_Constraint(item.name);
  Regions.Plas_minus_cross.Check(constraint.alias.tabControl.Properties.Values.GridControlNavigator, false, false, 120, 34);
}
//*************Detailed Infromation Tab*************
function constraintDetailInfo_pickVarName(name){
  clickListRow(constraint.alias.tabControl,"Variable name", name);
}
function constraintDetailInfo_pickNodeName(name){
  clickListRow(constraint.alias.tabControl,"Node name", name);
}
function constraintDetailInfo_openStrateyVar(name){
  var index =  listFinInColumn(constraint.alias.tabControl,"Variable name", name);
  if (index == -1){Log.warning(name+" not found"); return;}
  constraint.alias.tabControl.list.ClickCellXY(index, "Variable name", 35, 8);
}
function constraintDetailInfo_openNodeProperties(name){
  var index =  listFinInColumn(constraint.alias.tabControl,"Node name", name);
  if (index == -1){Log.warning(name+" not found"); return;}
  constraint.alias.tabControl.list.ClickCellXY(index, "Node name", 35, 8);;
}