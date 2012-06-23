def merge_sort_count (array1, array2)
  puts array1.length
  puts array2.length
end
  
file = File.new("IntegerArray.txt", "r")
array = file.read.split("\r\n").each { |number| number.to_i }
merge_sort_count(array[0..array.length/2 - 1], array[array.length/2,-1])