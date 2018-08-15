function NodesContainer()
 {
  this.alias = Aliases.Maven.MainForm.NodesContainer;
  
  this.refresh = function()
  {
    this.alias.Controls.ClickItem("Refresh");
  }
 }