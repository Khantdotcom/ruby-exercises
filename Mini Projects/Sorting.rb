# frozen_string_literal: true

class Sorting # rubocop:disable Style/Documentation
  def bubble_sort(array) # rubocop:disable Metrics/MethodLength
    n = array.length
    loop do
      swapped = false
      (n - 1).times do |i|
        if array[i + 1] < array[i]
          array[i + 1], array[i] = array[i], array[i + 1]
          swapped = true
        end
      end
      break unless swapped
    end
    array
  end

  def stock_picker(array) # rubocop:disable Metrics/MethodLength
    profit = 0
    buy = nil
    sell = nil
    array.each_with_index do |i, index|
      maximum = array[index..].max
      next unless (maximum - i) > profit

      profit = maximum - i
      buy = array.index(i)
      sell = array.rindex(maximum)
    end
    [buy, sell]

    # buy , sell = nil, nil
    # array.each do |i|
    #    array[i..-1].min
    # buy,sell = array.min , array.max
    # (array.length-2).times do |i|
    #   if array.index(buy) > array.index(sell) && buy < sell
    #     buy = array[i+1..-1].min
    #     sell = array[i+1..-1].max
    #   end
    #   puts buy, sell
    # end
    #   if array[i..-1].max == array[i+1..-1].max
    #   array[i..-1].max - array[i] > array[i..-1].max - arry[i..-1].min
    #   && array.index(array[i..-1].max) > arry.index(arry[i..-1].min)

    #   array.map.with_index do |i,index|
    #     if (array[index+1..-1].max - i) > profit
    #       profit = array[index+1..-1].max - i
    #     end
    #   end
    # end
  end
end

sort = Sorting.new
sort.stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
# [1,3,6,6,8,9,10,15,17]
# [-8,0,0,-2,-1,2,3,7,2]
