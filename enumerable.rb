	module Enumerable
		def my_each
			i = 0
			while i< self.size
				# puts self[i]
				yield(self[i])
				i += 1
			end
			# self
		end
		def my_each_with_index
			i = 0
			self.my_each do |x|
				yield(x,i)
				i +=1
			end
		end
		def my_select
			self.my_each do |x|
				yield(x)
			end
		end
		def my_all?
			i = 0
			love = true
			while i < self.size
				love = love && yield(self[i])
				i += 1
			end
			love
		end
		def my_any?
			i = 0
			result = false
			while i < self.size
				result = result || yield(self[i])
				i += 1
			end
			result
		end
		def my_none?
			i = 0
			result = true
			while i < self.size

				if yield(self[i])
					result = false
					break
				end
				i += 1
			end
			result
		end
		
		def my_count(*args)
			count = 0 
			if block_given?
				self.my_each do |x|
						count += 1 if yield(x)
				end
			elsif args.empty?
				return self.length
			else
				self.my_each do |element|
					count += 1 if args[0] == element
				end
			end
			return count
		end
		# my_map
		def my_map
			arr = []
			if block_given?
				self.my_each do |x|
					arr << yield(x)
				end
			else
				self.my_each do |x|
					arr << x.to_enum
				end
			end
			return arr
		end
		# my_inject
		def my_inject(*args)
			memo = args.empty? ? self[0] : args[0]
			i = args.empty? ? 1 : 0
			while i < self.length
				memo = yield(memo, self[i])
				i += 1
			end
			memo
		end
		# my_map with proc
		def my_map_proc(proc=nil)
			arr = []
			if proc && proc.class == proc
				self.my_each do |element|
					arr.push(proc.call(element))
				end
			else
				if block_given?
					self.my_each do |element|
						arr.push(yield(element))
					end
				else
					self.my_each do |element|
						arr.push(element.to_enum)
					end
				end
			
			end
			arr
		end
	end
	def multiply_els(arr)
			result = arr.my_inject do |product, n|
				product * n
			end
			result
	end
	# puts (5..10).to_a.my_inject() { |sum, n| sum + n }
	# puts (5..10).to_a.my_inject(1) { |product, n| product * n }
	# longest = %w{ cat sheep bear }.my_inject do |memo, word|
 #   memo.length > word.length ? memo : word
	# end
	# puts longest
	# puts multiply_els([2,4,5])
	lay = Proc.new{|x| x*2}
	puts [1, 2, 3, 4].my_map_proc
	puts [1, 2, 3, 4].my_map_proc{|x| x*2}