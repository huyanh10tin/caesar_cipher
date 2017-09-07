class SubString
	attr_accessor :word, :dictionary, :result
	
	def initialize(word, dictionary)
		@result = Hash.new(0)
		@dictionary = []
		@word = word
		@dictionary = dictionary
	end
	def process
		@dictionary.each do |element|
			# find all index of element in word and increase result[element]
			i = -1
			while i = @word.downcase.index(element,i+1)
			  result[element] += 1
			end
		end
		puts @result
	end
end
 dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
sub = SubString.new("Howdy partner, sit down! How's it going?", dictionary)
sub.process