class Users < ActiveRecord::Base
    has_many :poems

    has_secure_password

    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    
end