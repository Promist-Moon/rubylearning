def substrings(word, dictionary)
  wc = Hash.new(0)
  worr = word.split

  dictionary.each do |s|
    worr.each do |w|
      if w.downcase.include?(s)
        wc[s] += 1
      end
    end
  end
  puts wc
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?", dictionary)