	def bubble_sort_by(array_buble)
	
		0.upto(array_buble.length - 1) do |i|
			 (i+1).upto(array_buble.length - 1) do |j|
			 		if yield(array_buble[i], array_buble[j]) > 0 && block_given?
			 			temp = array_buble[i]
			 			array_buble[i] = array_buble[j]
			 			array_buble[j] = temp
			 			
			 		end
			 end
		end
		puts array_buble
	end

	bubble_sort_by(["uwhiuejj", "hi", "hello", "hey", "choifg"]) do |left,right|
		# puts "#{left} and #{right}"
		left.length - right.length
	end
	