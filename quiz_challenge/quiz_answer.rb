
correct_answers = 0
puts "Welcome to the Quiz"
puts ""
sleep 1
File.open('quiz_source_text.txt').each do |line|
line = line.chomp
if line.include?("Correct:")
  answer = "Correct: " + gets.chomp.upcase
  if answer == line 
    puts ""
    puts line 
    correct_answers += 1
  else
    puts ""
    puts "Wrong"
    puts "The correct answer was:"
    puts line[-1]
  end
else 
  puts line
end
puts ""
sleep 1 
end
puts "Total number of answers correct:"
puts correct_answers