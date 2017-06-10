module GamesHelper
    def findReviews(id)
        Review.where(:game_id => id).all
    end
end
