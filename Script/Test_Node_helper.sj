//USEUNIT NodeHelper
//USEUNIT WindowErrorHelper
//USEUNIT NodesNavigatorHelper

//****************************
function CreateAndLink_node(var1,var2){
  //initialization
  var inputNode = new Node.Node();
  var inPrefix = new InputPrefix.InputPrefix();
  if (var2 == undefined) var2 = var1;
  //precondition
  Log.Message("Тест функционала Создать и слинковать Output Variables автоматически ");
  //test bodys 
  radiobuttonSetChecked(inputNode.alias.OutputVariables, 1);
  clickListRowByName(inputNode.listVar, var1);
  inputNode.unlink();
  checkValueOfField(inputNode.listVar, var1, "Linked To", "");
  inputNode.createAndLink();
  setPrefix("clear");
  inPrefix.ok();
  checkValueOfField(inputNode.listVar, var1, "Linked To", var2);
  //postcondition
}
//****************************
function check_linked_variables_node(node,nodeDispName,condition1,condition2){
  //initialization
  Project.Variables.Node = node;
  var nodesNavigator = new NodesNavigator.NodesNavigator();
  var datasource = new Node.Node();
  //precondition
  Log.Message("Тест проверяет линковку переменных.");
  //test bodys 
  showNodeProperties(nodeDispName);
  if (listEmpty(inputNode.listVar)) checkEmptyList(inputNode.listVar);
  else{
    for (var i=0; i< ODT.Data.Nodes.VariableCount; i++){ 
        var item = ODT.Data.Nodes.Variables(i).Value;
        if(item.options != condition1) continue;
        clickListRowByName(inputNode.listVar, item.name);
        verifyNodeVariablesProperty(inputNode.listVar,item);
    }
  }   
  radiobuttonSetChecked(inputNode.alias.OutputVariables, 1);
  for (var i=0; i< ODT.Data.Nodes.VariableCount; i++){ 
      var item = ODT.Data.Nodes.Variables(i).Value;
      if(item.options != condition2) continue;
      clickListRowByName(inputNode.listVar, item.name);
      verifyNodeVariablesProperty(inputNode.listVar,item);
  }
}
//****************************
function linkUnlink_Autolink_node(var1,var2,var3,var4)
{
  //initialization
  
  //precondition
  Log.Message("Разлинковка переменных, линковка переменных");
  //test bodys
  radiobuttonSetChecked(inputNode.alias.InputVariables, 1);
  if (listEmpty(inputNode.listVar)) radiobuttonSetChecked(inputNode.alias.OutputVariables, 1);
  clickListRowByName(inputNode.listVar, var1);
  inputNode.unlink();
  checkValueOfField(inputNode.listVar, var1, "Linked To", "");
  clickListRowByName(inputNode.listStr, var2);
  inputNode.link();
  checkValueOfField(inputNode.listVar, var1, "Linked To", var2);
  Log.Message("Авто линковка");
  radiobuttonSetChecked(inputNode.alias.OutputVariables, 1);
  clickListRowByName(inputNode.listVar, var3);
  inputNode.unlink();
  checkValueOfField(inputNode.listVar, var3, "Linked To", "");
  inputNode.autoLink();
  checkValueOfField(inputNode.listVar, var3, "Linked To", var4);
  //postcondition
}
//****************************
