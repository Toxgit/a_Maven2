function WindowError(){
  this.alias = Aliases.Maven.WindowError;
  
  this.text = function(){return this.alias.Text.wText}
  this.close = function(){this.alias.Close.ClickButton()}
}