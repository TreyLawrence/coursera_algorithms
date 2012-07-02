class Quicksort
  def initialize array
    @array = array
    @count = 0
  end
  
  def quick_sort_first
    @count = 0
    sort_and_count_first @array
  end
  
  def quick_sort_median
    @count = 0
    sort_and_count_median @array
  end
  
  def quick_sort_last
    @count = 0
    sort_and_count_last @array
  end
  
  def count
    @count
  end
  
  private
  
    def sort_and_count_first array
      less = []
      more = []
      if array.length <= 1
        array
      else
        @count += array.length - 1
        print "count: #{array.length - 1} "
        pivot = array.first
        array[1..-1].each { |i| (i < pivot) ? less << i : more << i}
        puts "pivot: #{pivot} less: #{less} more: #{more}"
        sort_and_count_first(less) + [pivot] + sort_and_count_first(more)
      end
    end
    
    def sort_and_count_last array
      less = []
      more = []
      if array.length <= 1
        array
      else
        @count += array.length - 1
        print "count: #{array.length - 1} "
        pivot = array.last
        array[0..-2].each { |i| (i < pivot) ? less << i : more << i}
        puts "pivot: #{pivot} less: #{less} more: #{more}"
        sort_and_count_last(less) + [pivot] + sort_and_count_last(more)
      end
    end
    
    def sort_and_count_median array
      less = []
      more = []
      median = array.length/2 - (1 - array.length%2)
      if array.length <= 1
        array
      elsif array.length == 2
        @count += array.length - 1
        print "count: #{array.length - 1} "        
        puts "comparing #{array.first} and #{array.last}"
        if array.first < array.last
          array
        else
          [array.last, array.first]
        end
      else
        @count += array.length - 1
        print "count: #{array.length - 1} "        
        if ((array.first <=> array[median]) + (array.first <=> array.last)) == 0
          pivot = array.first
        elsif ((array[median] <=> array.first) + (array[median] <=> array.last)) == 0
          pivot = array[median]
        elsif ((array.last <=> array[median]) + (array.last <=> array.first)) == 0
          pivot = array.last
        end
        array.each { |i| (i < pivot) ? less << i : more << i unless (i == pivot)}
        puts "pivot: #{pivot} less: #{less} more: #{more}"
        sort_and_count_median(less) + [pivot] + sort_and_count_median(more)
      end
    end
end

file = File.new("QuickSort.txt", "r")
array = file.read.split("\r\n").map { |number| number.to_i }

# array = (1..10).to_a.shuffle
# puts array.to_s
sort = Quicksort.new(array)

sorted = sort.quick_sort_first
if sorted == (1..array.length).to_a
  puts "First: " + sort.count.to_s
else
  puts sorted.to_s
  puts "Broke"
end

sorted = sort.quick_sort_median
if sorted == (1..array.length).to_a
  puts "Median: " + sort.count.to_s
else
  puts sorted.to_s
  puts "Broke"
end

sorted = sort.quick_sort_last
if sorted == (1..array.length).to_a
  puts "Last: " + sort.count.to_s
else
  puts sorted.to_s
  puts "Broke"
end
