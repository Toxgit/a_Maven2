function WindowError2 (){//окно появляется если ввести недопустимый Dascription переменной
  this.alias = Aliases.Maven.WindowError2;
  
  this.label = function(){return this.alias.Label.WndCaption}
  this.ok = function(){this.alias.Ok.ClickButton()}
}