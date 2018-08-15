//префикс createde and link
function InputPrefix()
{
  this.alias = Aliases.Maven.InputPrefix;
  this.ok = function()
  {
    this.alias.Ok.Click();
  }
  this.cancel = function()
  {
    this.alias.Cancel.Click();
  }
}