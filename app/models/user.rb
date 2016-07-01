class User < ActiveRecord::Base
	has_many :orders
	has_many :movies, through: :orders
	attr_accessor :password
	EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ 
	#Confirm by SENDING Emails
	validates :username, :presence => true, :uniqueness => true, :length => {:in => 6..20}
	validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
	validates :password, :confirmation => true 
	validates_length_of :password, :in => 6..20, :on => :create
	before_save :encrypt_password
	after_save :clear_password
	def encrypt_password
		if password.present?
			self.salt = BCrypt::Engine.generate_salt
			self.encrypted_password = BCrypt::Engine.hash_secret(password,self.salt)
		end
	end
	def clear_password
	self.password = nil
	end
	def self.exist(user_name="", user_password="")
		temp = User.find_by_username(user_name)
		if temp && temp.encrypted_password == BCrypt::Engine.hash_secret(user_password,temp.salt)
			return temp
		else
			return false 
		end	 
	end
end
