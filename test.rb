require 'minitest/autorun'

require_relative 'encryptor'

class EncryptTest < MiniTest::Unit::TestCase

	def test_encrypt
		e = Encryptor.new
 		assert_equal e.encrypt("Hello"), "uryyb"
	end

	def test_decrypt
		e = Encryptor.new
 		assert_equal e.decrypt("URYYB"), "hello"
	end

end