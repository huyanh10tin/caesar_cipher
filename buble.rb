	def bubble_sort(array_buble)
		0.upto(array_buble.length - 1) do |i|
			 (i+1).upto(array_buble.length - 1) do |j|
			 		if array_buble[i] > array_buble[j]
			 			# swap
			 			temp = array_buble[i]
			 			array_buble[i] = array_buble[j]
			 			array_buble[j] = temp
			 			# array_buble[i], array_buble[j] = array_buble[j], array_buble[j]
			 			# puts "#{array_buble[i]} and #{array_buble[j]}"	
			 		end
			 end
		end
		print array_buble
	end
	bubble_sort([4,3,78,2,0,2])