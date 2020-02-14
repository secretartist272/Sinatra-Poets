class User < ActiveRecord::Base
    has_many :poem

    has_secure_password

    # validates :name, presence: true
    # validates :username, presence: true, uniqueness: true
    validates_presence_of :name, :username, :password
    
end