require 'pry'

sentence = "It was the best of times."

array = sentence.split("")
seeds = array.collect.with_index do |letter, i|
	"#{letter}#{array[i+1]}"
end

seed_hash = {}
seeds.each_with_index{|seed, index| seed_hash[seed] = [] if (index < seeds.length - 2)}

seeds.each_with_index do |seed, index|
  if index < seeds.length - 2
  seed_hash[seed].push(seeds[index + 1][1])
	end
end

max_amt = seed_hash.max_by {|key, value| value.length}.flatten.length - 1

start_seed = seed_hash.select {|key, value| value.length == max_amt}.keys.sample

master_string = start_seed.dup if start_seed.frozen?

50.times do
	seed = "#{master_string[-2..-1]}"
	# binding.pry
	master_string << seed_hash[seed].sample
end

puts master_string
