//USEUNIT DataSource

var dataSource = new DataSource.DataSource();

function dataSource_ok(){dataSource.ok()}
function dataSource_cancel(){dataSource.cancel()}

function dataSource_Exists_cancel(){
  if(dataSource.alias.Exists)
    dataSource_cancel();
}