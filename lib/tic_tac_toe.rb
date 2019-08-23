def turn(board)
  puts "Please enter 1-9:"
  index=gets.chomp
  index=input_to_index(index)
  if valid_move?(board,index)==true
    move(board,index)
    display_board(board)
  elsif valid_move?(board,index)==false
    puts "Re-enter a valid position"
    index=gets.chomp
    index=input_to_index(index)
  end
end


def display_board(board)
  puts [" #{board[0]} | #{board[1]} | #{board[2]} "]
  puts "-----------"
  puts [" #{board[3]} | #{board[4]} | #{board[5]} "]
  puts "-----------"
  puts [" #{board[6]} | #{board[7]} | #{board[8]} "]
end

# code your input_to_index and move method here!
def input_to_index(input)
  index=input.to_i - 1
end

def move(board,index,mark)
  board[index.to_i]=mark
end
  

def valid_move?(board,index)
  if position_taken?(board,index)==false
    true
  else 
    false
  end
end

i=0
def play(board)
  while i<9
    i=i+1
    turn(board)
  end
end

def turn_count(board)
  turncount=0
  board.each do |turn|
      if turn=="X"
        turncount+=1
      elsif turn=="O"
        turncount+=1
      end
    end
    return turncount
end

def current_player(board)
	if turn_count(board)==0
	  return "X"
  elsif turn_count(board).odd?
    return "O"
  else return "X"
  end
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[1,4,7],[0,3,6],[2,5,8]]

status=[]
win_index=[]
final=[]
def won?(board)
  for each_combination in WIN_COMBINATIONS
    win_index_1=each_combination[0]
    win_index_2=each_combination[1]
    win_index_3=each_combination[2]
    
    position_1=board[win_index_1]
    position_2=board[win_index_2]
    position_3=board[win_index_3]
    
    status=[position_1,position_2,position_3]
    win_index=[win_index_1,win_index_2,win_index_3]

    if status.all? {|x| x=="X"} or status.all? {|x| x=="O"}
      final=win_index
    else
      false
    end
  end
  return final
end



def full?(board)
  if board.any? {|x| x==" "}
    false
  else
    true
  end
end


def draw?(board)
  if won?(board)==nil && full?(board)==true
    true
  elsif full?(board)==false && won?(board)==nil
    false
  else
    false
  end
end


def over?(board)
  if won?(board)!=nil or draw?(board)==true or full?(board)==true
    true 
  else
    false
  end
end

status=[]
win_index=[]
winner=" "
def winner(board)
  for each_combination in WIN_COMBINATIONS
    win_index_1=each_combination[0]
    win_index_2=each_combination[1]
    win_index_3=each_combination[2]
    
    position_1=board[win_index_1]
    position_2=board[win_index_2]
    position_3=board[win_index_3]
    
    status=[position_1,position_2,position_3]
    win_index=[win_index_1,win_index_2,win_index_3]

    if status.all? {|x| x=="X"}
      winner="X"
    elsif status.all? {|x| x=="O"}
      winner="O"
    else
      false
    end
  end
  return winner
end



