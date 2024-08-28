require binding.pry
def casesar_cipher(string, count)
  
  #lowercase >> split >> locate index >> change index if sum > 25 sum // 25 -1>> locate letter >> cap
  array = ('a'..'z').to_a
  string.lowercase!.each |x| do
    binding.pry
    new_index = array.find_index(x) + count
    if new_index > 25 
      new_index // 25 -1
    x = array[sum]
  string.capitalize
