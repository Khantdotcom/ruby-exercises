# frozen_string_literal: true

class String_Manipulate
  def substrings(string, dictionary)
    counts = Hash.new(0)
    result = string.scan(Regexp.union(dictionary))
    result.each do |x|
      counts[x] += 1
    end
    puts counts
  end
end

strings = String_Manipulate.new
strings.substrings("Howdy partner, sit down! How's it going?",
                   %w[down go going horn how howdy it i])

# # #   > substrings("below", dictionary)
# # #   => { "below" => 1, "low" => 1 }
# # # Next, make sure your method can handle multiple words:

# # #   > substrings("Howdy partner, sit down! How's it going?", dict
# # #   => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy
# # # Please note the order of your keys might be different.
# # # if attern match() , split into words and count
#     flattened = Regexp.union(dictionary)
#     puts flattened
#     puts flattened.match(string.gsub('/\s/',"")).length
#   end
# # # Quick Tips:

# # # Recall how to turn strings into arrays and arrays into strings.
