class Game < ActiveRecord::Base
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :events, dependent: :destroy
end
