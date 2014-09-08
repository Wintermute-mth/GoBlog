class Post < ActiveRecord::Base
    has_many :comments

    validates :name, presence: true,
                     length: { minimum: 3 },
                     uniqueness: true
    validates :text, presence: true,
                     length: { minimum: 2 }
end
