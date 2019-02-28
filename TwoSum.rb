require 'benchmark'

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  return [] if nums.size < 2

  lookup = {}
  for index in (0..nums.size - 1)
    return [index, lookup[target - nums[index]]] if lookup[target - nums[index]]

    lookup[nums[index]] = index
  end

  []
end

private 

def testRun
  Benchmark.bm 10 do |r|
    r.report "case1" do
      if checkError(two_sum([2, 7, 11, 15], 9), [0,1])
        p "Error! case1"
      end
    end
    r.report "case2" do
      if checkError(two_sum([2, 7, 11, 15], 9), [0,1])
        p "Error! case2"
      end
    end
    r.report "case3" do
      if checkError(two_sum([2, 7, 11, 15], 9), [0,1])
        p "Error! case3"
      end
    end
  end
end

def checkError(result, expect)
  result.sort != expect
end

testRun
