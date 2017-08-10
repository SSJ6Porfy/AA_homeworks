def sluggish_octopus(arr_of_fish)
  longest = ""
  arr_of_fish.each do |first_fish|
    arr_of_fish.each do |second_fish|
      longest = first_fish.length > second_fish.length ? first_fish : second_fish
    end
  end
  longest
end

arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p sluggish_octopus(arr)



class Array

  def merge_sort(&prc)
    return self if count <= 1

    prc ||= proc { |x, y| x <=> y }

    mid = count / 2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    result = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        result << left.shift
      when 0
        result << left.shift
      when 1
        result << right.shift
      end
    end

    result + left + right
  end
end

def dominant_octopus(fish_arr, &prc)
  prc ||= proc { |x, y| y.length <=> x.length }

  fish_arr.merge_sort(&prc).first
end

p n_log_n_big_fish(arr)

def clever_octopus(arr)
  longest = arr.first
  arr[1..-1].each do |fish|
    longest = fish.length > longest.length ? fish : longest
  end
  longest
end
p clever_octopus(arr)



def slow_dance(target, tiles)
  tiles.each_with_index do |tile, idx|
    return idx if tile == target
  end
end
