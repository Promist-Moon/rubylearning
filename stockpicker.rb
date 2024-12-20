def stock_picker(prices)
  count_buy = 0
  best_buy = 0
  best_sell = 0
  while count_buy < prices.length()
    count_sell = count_buy + 1
    while count_sell < prices.length()
      if prices[count_sell] - prices[count_buy] > prices[best_sell] - prices[best_buy]
        best_buy = count_buy
        best_sell = count_sell
      end
      count_sell += 1
    end
    count_buy += 1
  end
  p [best_buy, best_sell]
end

stock_picker([17,3,6,9,15,8,6,1,10])