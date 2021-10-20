string1 = "Lua"
print("\"String 1 is\"", string1)
print("Upper case string 1", string.upper(string1), "\n")

string2 = 'Tutorial'
print("String 2 is", string2)


string3 = [["Lua Tutorial"]]
print("String 3 is", string3)

-- replace a substring
string = "Lua Tutorial"

-- replacing strings
newstring = string.gsub(string,"Tutorial","Language")
print("The new string is "..newstring.." Hue hue")