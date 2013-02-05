Calculator
Josh Cooper

Plan to compute the output.

I plan to have a GUI that will allow the user to make the input String using some sort of StringBuffer as the user presses buttons like "+" or "9" to add to the StringBuffer. For any term that is a digit, decimal point, or minus sign, the StringBuffer will append that term. For all other terms (operands), the StringBuffer will append that term, with a space preceding and following. A "C" button can reset the StringBuffer. Pressing 11,+,2,x,30,+,4,x,5 will thus produce the string "11 + 2 x 30 + 4 x 35". Pressing "Enter" will turn the StringBuffer into a String and call the main calculating method.

I plan to turn this string into a String List, using the space separation, making each term surrounded by spaces a term in the List. For example, the above input would give the list ["11","+","2","x","30","+","4","x","35"]. At this point, I will test that the input is of acceptable form (e.g., no two adjacent operators). If it is invalid, I will throw an exception and handle it accordingly.

If it is valid, I will call private double workList(List<String>); with this list as an argument. My plan is to have workList call a helper method that will parse the List according to a given operator and modify the List. The helper method will take the List and operator under consideration as arguments. Its declaration will be something like: private void carryOutOperator(List<String> list, Operator operator); (I plan to make an enum Operator to denote multiplication, addition, etc. if that's possible in Objective C). So, workList will first call carryOutOperator(list, Operator.Multiplication);. In this case, carryOutOperator will go through the List looking for every "x" and then multiply the terms immediately before and after the "x" (which must be numbers so we use a String to Double parser) and replace those three terms with the String representation of the product. For example, calling carryOutOperator on ["1","+","2","x","3","+","4","x","5"] and Operator.Multiplication would modify the List to end up with ["1","+","6","+","20"]. carryOutOperator will then be called on the list for Operator.Division, then Operator.Addition, and then Operator.Subtraction. At the end, we would be left with ["27"].

From here it won't be too hard to add parentheses, I could just call workList recursively on the sublist inside the parentheses before all of the other operations and then proceed. I could also add Operator.Exponent pretty easily too.

When workList is finished, there will be only one element left in the list and it will be a String representation of a double. workList will return that Double, which is the result.

I will throw a different exception if we ever have division by zero.