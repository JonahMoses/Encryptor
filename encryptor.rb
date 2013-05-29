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

end
