require 'pry-byebug'

VALID_SERIE = [1, 2, 3, 4, 5, 6, 7, 8, 9].freeze
WHOLE_SQUARE = [VALID_SERIE * 9].flatten.sort.freeze

def done_or_not(board)
  if line_valid?(board) && column_valid?(board) && whole_valid?(board)
    "Finished!"
  else
    "Try again!"
end

def line_valid?(board)
  valid?(board)
end

def column_valid?(board)
  columns = []
  array = []
  for i in (0..8) do
    for j in (0..8) do
      array << board[j][i]
    end
    columns << array
    array = []
  end
  valid?(columns)
end

def whole_valid?(board)
  board.flatten.sort == WHOLE_SQUARE
end


def valid?(array)
  array.each do |el|
    return false if el.sort != VALID_SERIE
  end
  true
end


board = [
  [5, 3, 4, 6, 7, 8, 9, 1, 2],
  [6, 7, 2, 1, 9, 5, 3, 4, 8],
  [1, 9, 8, 3, 4, 2, 5, 6, 7],
  [8, 5, 9, 7, 6, 1, 4, 2, 3],
  [4, 2, 6, 8, 5, 3, 7, 9, 1],
  [7, 1, 3, 9, 2, 4, 8, 5, 6],
  [9, 6, 1, 5, 3, 7, 2, 8, 4],
  [2, 8, 7, 4, 1, 9, 6, 3, 5],
  [3, 4, 5, 2, 8, 6, 1, 7, 9]
]

puts done_or_not(board)
