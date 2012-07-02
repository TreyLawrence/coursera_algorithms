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
      # print "split(#{array}) = #{[array[0..(array.length/2 - 1)],array[(array.length/2)..-1]]}\n"
      [array[0..(array.length/2 - 1)],array[(array.length/2)..-1]]
    end

    def merge(first, second)
      # print "merge(#{first}, #{second})"
      a1 = 0
      a2 = 0
      result = []
      while (a1 + a2) < (first.length + second.length)
        # print("while(#{a1} + #{a2} < (#{first.length} + #{second.length}))\n")
        # print("first: #{first}, second: #{second}\n")
        if a1 == first.length
          result += second[a2..-1]
          a2 = second.length
        elsif a2 == second.length
          result += first[a1..-1]
          a1 = first.length
        elsif first[a1] < second[a2]
          result << first[a1]
          a1 += 1
        else second[a2] < first[a1]
          result << second[a2]
          a2 += 1
          @count += first.length - a1
        end
      end
      # print " = #{result}\n"
      result
    end
end

file = File.new("IntegerArray.txt", "r")
array = file.read.split("\r\n").map { |number| number.to_i }
# array = (1..10).to_a.shuffle
# puts array.to_s
merge = Sort.new(array)

puts merge.merge_sort.to_s
puts merge.count