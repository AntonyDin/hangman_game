require_relative 'lib/console_interface'
require_relative 'lib/game'

puts "Всем привет!"

word = File.readlines(__dir__ + '/data/words.txt', chomp: true).sample

game = Game.new(word)
console_interface = ConsoleInterface.new(game)

# Пока не закончилась игра
until game.over?
  # Очередное состояние игры
  console_interface.print_out
  # Очередную букву
  letter = console_interface.get_input
  # Состояние игры
  game.play!(letter)
end

# Финальное состояние игры
console_interface.print_out
