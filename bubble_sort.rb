require 'debug'
def bubble_sort(array = [55,488,32,11,2])

	sorted = false
	until sorted
		sorted = true

		array.each_with_index do |element_1, index|
			element_2 = array[index + 1]
			if (element_1 <=> element_2) == 1
				array[index], array[index + 1] = element_2, element_1
				sorted = false			
			end
		end
end
print array
puts
end

bubble_sort


def bubble_sort_by(array)

	sorted = false
	until sorted
		sorted = true

		array.each_with_index do |element_1, index|
			element_2 = array[index + 1]
			if yield(element_1, element_2) < 0
				break if index == array.length - 1
				array[index], array[index + 1] = element_2, element_1
				sorted = false
			end
		end
	end
	puts array
	end


bubble_sort_by(["hi","hello","hey"]) do |left,right|
       right.to_s.length - left.to_s.length
     end
