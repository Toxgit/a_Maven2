//USEUNIT ListView
//USEUNIT Node
//USEUNIT CheckBox

var inputNode = new Node.Node();

function inputNode_cancel(){inputNode.cancel()}

function verifyNodeVariablesProperty(object,item)
{
  clickListRowByName(object, item.name);
  checkValueOfField(object, item.name, "Name", item.name);
  checkValueOfField(object, item.name, "Type", item.type);
  checkValueOfField(object, item.name, "Linked To", item.linkedTo);
}
function navTabsWithPinSelect(tab)
{
  if (tab == "Debug") inputNode.alias.tabControl.Click(128, 11);
  if (tab == "Pin") inputNode.alias.tabControl.Click(252, 11);
  if (tab == "Annotation") inputNode.alias.tabControl.Click(330, 11);
  if (tab == "Mapping") inputNode.alias.tabControl.Click(50, 11);
}
function navTabs3tabs(tab)
{
  if (tab == "Debug") inputNode.alias.tabControl.Click(128, 11);
  if (tab == "Annotation") inputNode.alias.tabControl.Click(252, 11);
  if (tab == "Mapping") inputNode.alias.tabControl.Click(50, 11);
}
function navTabs2tabs(tab){
  if (tab == "Annotation") inputNode.alias.tabControl.Click(128, 11);
  if (tab == "Mapping") inputNode.alias.tabControl.Click(50, 11);
}
