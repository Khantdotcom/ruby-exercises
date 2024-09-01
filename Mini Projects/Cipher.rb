# frozen_string_literal: true
Class Cipher # rubocop:disable Layout/EmptyLineAfterMagicComment
def casesar_cipher(string, count)
  # lowercase >> split >> locate index >> change index if sum > 25 sum // 25 -1>> locate letter >> cap
  array = ('a'..'z').to_a
  down_string = string.downcase.chars.map do |char|
    if array.include?(char)
      new_index = (array.index(char) + count) % 26
      array[new_index]
    else
      char
    end
  end
  down_string.join.capitalize
end
