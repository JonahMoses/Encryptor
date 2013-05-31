class Encryptor

	 def cipher(rotation)
		characters = (' '..'z').to_a
		rotated_characters = characters.rotate(rotation)
		Hash[characters.zip(rotated_characters)]
 	 end

 	 def encrypt_letter(letter, rotation)
 	 	cipher_for_rotation = cipher(rotation)
 	 	cipher_for_rotation[letter]
 	 end

 	 def encrypt(string, rotation)
 	 	# 1. Cut the input string into letters
 	 	letters = string.split("")
  		# 2. Encrypt those letters one at a time, gathering the results
  		# 3. Join the results back together in one string
  		encrypted_letters = letters.collect do |letter|
  			encrypt_letter(letter, rotation)
  		end.join
 	 end

 	 def decrypt_letter(letter, rotation)
 	 	cipher_for_rotation = cipher(rotation-(rotation*2))
 	 	cipher_for_rotation[letter]
 	 end

 	 def decrypt(string, rotation)
 	 	letters = string.split("")
			decrypted_letters = letters.collect do |letter|
				decrypt_letter(letter, rotation)
			end.join 	 
	 end

	 def encrypt_file(filename, rotation)
 		#1 Create the file handle to the input file
 		input = File.open(filename, "r")
		#2 Read the text of the input file
		input_text = input.read
		#3 Encrypt the text
		secret_text = encrypt(input_text, rotation)
		#4 Create a name for the output file
		output_filename = filename + ".encrypted"
		#5 Create an output file handle
		output = File.open(output_filename, "w")
		#6 Write out the text
		output.write(secret_text)	
		#7 Close the file
		output.close
	 end

end
