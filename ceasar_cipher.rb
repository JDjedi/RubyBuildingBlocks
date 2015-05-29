def caesar_mapping(input, low_value, high_value)
	# converts input to a number between low_value and high_value.  Uses a linear scale.

	

	# My short alphabet example:
	# 0 => 0
	# 1 => 1
	# 2 => 2
	# 3 => 3
	# 4 => 4

	# then repeats...

	# 5 => 0
	# 6 => 1
	# 7 => 2
	# 8 => 3
	# 9 => 4

	# and continues ....

	# 9    +    +
	# 8   +    + 
	# 7  +    +  
	# 6 +    +   
	# 5+    +    
	# 4                    
	# 3          
	# 2          
	# 1          
	# 0          
	#  01234567890

	result = input
	if input <= high_value
		result = input
	else
		result = input%high_value + low_value - 1
	end
	return result
end

def caesar_cipher(original_text, shift_value)
	converted_text = original_text

	original_text.length.times do |idx|
	# original_text.scan /./ do |letter|
		letter = original_text[idx]
		# Begin encoding each letter. Any non letter is not converter.

		# ascii codes:
		# A - 65
		# Z - 90
		# a - 97
		# z - 122

		letter_int_value = letter.ord
		if letter_int_value >= 65 && letter_int_value <= 90
			# convert CAPITAL letters"
			converted_text[idx] = caesar_mapping(letter_int_value+shift_value, 65, 90).chr
		elsif letter_int_value >= 97 && letter_int_value <= 122
			# convert lower case letter"
			converted_text[idx] = caesar_mapping(letter_int_value+shift_value, 97, 122).chr
		else 
			# non alpha character, don't convert
			converted_text[idx] = original_text[idx]
		end
	end
	puts converted_text
end

caesar_cipher("What a string!", 5)