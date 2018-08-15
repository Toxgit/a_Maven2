function matchString(theString,pattern){
  pattern = ".*" + pattern +".*";
  var regex = new RegExp(pattern);
  if (theString.match(regex))return true;
   else return false;
}
