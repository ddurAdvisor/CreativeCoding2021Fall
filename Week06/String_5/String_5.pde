String[] notation = {"12345 34567 24132 12", 
                     "12345 34567 24132 12", 
                     "12345 34567 24132 12", 
                     "12345 34567 24132 12"};
//println(notation.length);

for (int i = 0; i < notation.length; i ++) {
  String subSetOfNotation = notation[i];
  for (int j = 0; j < subSetOfNotation.length(); j ++) {
    char c = subSetOfNotation.charAt(j);
    println(c);
  }
}
