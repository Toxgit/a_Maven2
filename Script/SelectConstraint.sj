function SelectConstraint()
{
  this.alias = Aliases.Maven.SelectConstraint;
  this.list = this.alias.List;
  
  this.ok = function(){this.alias.Ok.ClickButton()}
  this.cancel = function(){this.alias.Cancel.ClickButton()}
  this.toManageConstraints = function(){this.alias.ManageConstraints.ClickButton()}
  
  this.click = function(x,y){this.alias.Click(x,y)}
}