class User < ApplicationRecord
    validates :name, :location, :language, presence: true 
end
