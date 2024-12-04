def caesar_cipher(text, shift)
  shift = shift % 26
  new_text = []
  text = text.chars.map{ |c| c.ord }
  text.each do |c|
    if c <= 90 and c >= 65
      k = ((c + shift - 'A'.ord) % 26 + 'A'.ord).chr
    elsif c <= 122 and c >= 97
      k = ((c + shift - 'a'.ord) % 26 + 'a'.ord).chr
    else 
      k = c.chr
    end
    new_text.push(k)
  end
  new_text.join
end

puts caesar_cipher("you are the stinkiest smelliest!", 5)