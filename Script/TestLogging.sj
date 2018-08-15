// The Global Using of Test Step
var _IsStepUsed = false;//defined on BeginTest

function BeginTestTransaction(testName, testDescription)
{
  //END Last Step if it was started
  if (_IsStepUsed)
  {
    Log.PopLogFolder();
    _IsStepUsed=false;
  }
  var testSetUpFolder = Log.CreateFolder(testName,testDescription,pmHighest, getTestLogAttributes());
  Log.PushLogFolder(testSetUpFolder);
  
}

function EndTestTransaction()
{
  if (_IsStepUsed)
  {
    Log.PopLogFolder();
    _IsStepUsed=false;
  }
  Log.PopLogFolder();//End Test
}

function logStep(stepName,stepDescription)
{
  if (_IsStepUsed)
  {
    Log.PopLogFolder();//End Last Step
  }
  else
  {
    _IsStepUsed = true;
  }
  var testStepFolder = Log.CreateFolder(stepName,stepDescription, pmHighest, getStepLogAttributes());
  Log.PushLogFolder(testStepFolder);
}

function getStepLogAttributes()
{
  var logAttributes = Log.CreateNewAttributes();
  logAttributes.Bold = true;
  logAttributes.BackColor = clSkyBlue;
  return logAttributes;
}

function getTestLogAttributes()
{
  var logAttributes = Log.CreateNewAttributes();
  logAttributes.bold = true;
  logAttributes.BackColor = clTeal;
  return logAttributes;
}