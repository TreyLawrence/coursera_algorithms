class Sort
  
  def initialize(array)
    @array = array
    @count = 0
  end

  def merge_sort
    merge_sorter(@array)
  end
    
  def count
    @count
  end
  
  def array
    @array
  end

  protected
  
    def merge_sorter(array)
      # If it's an array 1 or 0 length, then return itself
      if array.length <= 1
        array.dup
      else
        #otherwise split
        halves = split(array).map { |half| merge_sorter(half) }

        #Then merge the havles sorted together
        merge(*halves)
      end
    end
  
    def split(array)
      [array[0..(array.length/2 - 1)],array[(array.length/2)..-1]]
    end

    def merge(array1, array2)
      if array1.empty?
        array2.dup
      elsif array2.empty?
        array1.dup
      elsif array1.first <= array2.first
        [array1.first] + merge(array1[1..-1], array2)
      else
        @count += 1
        [array2.first] + merge(array1, array2[1..-1])
      end
    end
end

file = File.new("IntegerArray.txt", "r")
array = file.read.split("\r\n").each { |number| number.to_i }
# array = [7,4,8,6,9]
merge = Sort.new(array)

print merge.merge_sort
puts ""
puts merge.count