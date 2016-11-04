class Question
  attr_accessor :question, :answer_a, :answer_b, :answer_c, :correct_answer

  def initialize(question_hash)
    @question = question_hash[:question]
    @answer_a = question_hash[:answer_a]
    @answer_b = question_hash[:answer_b]
    @answer_c = question_hash[:answer_c]
    @correct_answer = question_hash[:correct_answer]
  end
end

question_array = []
hash = {}
File.open('quiz_source_text.txt').each do |line|
  line = line.chomp
  if line.include?("?")
    hash[:question] = line
  elsif line.include?("A.")
    hash[:answer_a] = line
  elsif line.include?("B.")
    hash[:answer_b] = line
  elsif line.include?("C.")
    hash[:answer_c] = line
  elsif line.include?("Correct:")
    hash[:correct_answer] = line
    question_array << Question.new(hash)
  end
end
puts "Welcome to the Quiz game"
puts "The topic today is the Cubs!"
sleep 1
question_array.each do |question|
  puts question.question
  puts "========================================================"
  puts question.answer_a
  puts question.answer_b
  puts question.answer_c
  puts "What do you think?"
  answer = gets.chomp
  if answer.upcase == question.correct_answer[-1]
    sleep 1
    puts "That is correct. The answer is "
    response = / (?<=answer.upcase)(.+) /
    p response
    sleep 1
  else
    sleep 1
    puts "That is incorrect. The answer is really:"
    sleep 1
  end
  puts "========================================================="
end