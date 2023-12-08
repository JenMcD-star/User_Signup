class User < ApplicationRecord
    enum status: { 'Want a guide': 0, 'Want to guide': 1, 'Want to run with anyone':2 }

    has_secure_password 

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, presence: true,

                   uniqueness: { case_sensitive: false },

                   length: { maximum: 105 },

                   format: { with: VALID_EMAIL_REGEX }
   
    def self.find_by_uid!(uid)
      User.find_by!("profile_name = :p OR id = :p", p: uid)
    end

end
