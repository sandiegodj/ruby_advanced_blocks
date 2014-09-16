module Enumerable
	def my_each 
		i = 0
		while i < self.size
			yield(self[i])
			i+=1
		end
		self
	end

	def my_each_with_index
		i = 0
		while i < self.size
			yield(self[i], i)
			i+=1
		end
		self
	end

	def my_select
		result = []
	    self.my_each {|i| result << i if yield(i)}
	    result
	end

	def my_all?
		self.my_select { |i| yield(i) } == self ? true : false
	end

	def my_any? 
		self.my_select {|i| yield(i)}.size > 0 ? true : false 
	end

	def my_none?
		self.my_select {|i| yield(i)}.size > 0 ? false : true 
	end

	def my_count
		i = 0
		result = 0
		while i < self.size
			if yield(self[i]) 
				i += 1
				result += 1
			else
				i += 1
			end
		end
		result
	end

	def my_map
		result = []
		i = 0
		while i < self.size
			result << yield(self[i])
			i += 1
		end
		result
	end

	def my_inject(total = self[0])
		i = 0
		while i < self.size
			total = yield(total, self[i])
			i += 1
		end
		total
	end

	def multiply_els(array = [2,4,5])
		answer = array.my_inject {|total, n| total * n}
		puts answer
	end
end



