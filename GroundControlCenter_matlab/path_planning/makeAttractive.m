function attractive = makeAttractive(goal,x,y)
xi = 1/700*2;   
attractive = xi * ( (x - goal(1)).^2 + (y - goal(2)).^2 );