class RunLengthEncoding
  def self.decode(input)
    characters = input.split("")
    output = ""
    digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    current_count = ""
    characters.each_with_index do |char, i|
      if digits.include? char
        current_count += char
        next
      end
      if current_count === ""
        output += char
      else
        digit_count = current_count.to_i
        output += (char * digit_count)
        current_count = ""
      end
    end
    output
  end

  def self.encode(input)
    characters = input.split("")
    output = ""
    count = 1

    characters.each_with_index do |char, i|
      next if i === 0

      if i === characters.length - 1
        if char === characters[i - 1]
          count += 1
          if count > 1
            output += count.to_s
          end
          output += char
        else
          if count > 1
            output += count.to_s
          end
          output += characters[i - 1]
          output += char
        end
        return output
      end

      if char === characters[i - 1]
        count += 1
      else
        if count > 1
          output += count.to_s
        end
        output += characters[i - 1]
        count = 1
      end
    end
    output
  end
end
