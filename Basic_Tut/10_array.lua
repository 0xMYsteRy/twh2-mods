-- 1D array

array = {"Lua", "Tutorial"}

for i = 0, 2 do
   print(array[i])
end

-- 2D array
array = {}
for i=1,3 do
   array[i] = {}
	
   for j=1,3 do
      array[i][j] = i*j
   end
	
end

print("Fist element ",array[1][1])

-- Access the element
for i = 1,3 do 
    for j = 1,3 do
        print("Element ",array[i][j])
    end
end