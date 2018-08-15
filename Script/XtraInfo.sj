//окно появляется если удалить переменную нелинкованую или используемой в базовых узлах
// после обновления узла до последней версии
function XtraInfo()
{
  this.alias = Aliases.Maven.XtraInfo;
  
  this.ok = function(){this.alias.Ok.Click()}
  this.no = function(){this.alias.No.Click()}
}