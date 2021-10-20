#!/usr/local/bin/lua

-- This simple function takes 2 variables and return which one bigger
function max(num1, num2)

    if (num1 > num2) then
       result = num1;
    else
       result = num2;
    end
 
    return result; 
end

-- Calling a function
print("Max (a,b): ", max(3,5))


-- Assigning and parsing function
myprint = function(param)
   print("This is my print function -   ##",param,"##")
end

function add(num1,num2,functionPrint)
   result = num1 + num2
   functionPrint(result)
end

myprint(10)
add(2,5,myprint)

