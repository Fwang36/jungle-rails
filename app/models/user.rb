class User < ActiveRecord::Base

  has_secure_password
  validates :email, presence: true, uniqueness: {case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_length_of :password, minimum: 4

  def self.authenticate_with_credentials(email, password)

    stripped =  email.downcase.strip
    @user = User.find_by_email(stripped)

    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end
