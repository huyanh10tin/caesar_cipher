class StockPicker
	attr_accessor :stock
	def initialize(stock)
		@stock = []
		@stock = stock
		print @stock
	end
	def process
		daypay = 0
		daysell = 0
		maxprofit = 0
		0.upto(@stock.length - 1) do |x|
			(x+1).upto(@stock.length - 1) do |y|
				if @stock[y] - @stock[x] > maxprofit
					maxprofit =  @stock[y] - @stock[x]
					# print "max profit #{maxprofit}"
					daypay = x
					daysell = y
				end
			end
		end
		puts "The day to pay is: #{daypay} and the day to sell is: #{daysell} and profit is #{@stock[daysell] - @stock[daypay]}"
	end

	# find max(sellday - payday)

end
stock_picker = StockPicker.new([6,23,6,68,15,8,6,1,10])
stock_picker.process