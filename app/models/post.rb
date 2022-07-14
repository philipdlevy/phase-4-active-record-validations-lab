class Post < ApplicationRecord
    

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}

    validate :clickbait_title


    def clickbait_title
        if title
            unless title.include? "Won't Believe" || "Secret" || "Top [number]" || "Guess"
                errors.add(:title, "Not clickbait-y enough!")
            end
        end
    end

    ###refactored
    # & symbol says, if it exists, THEN run the inlcudes, if not, do nothing.
    # def clickbait_title
    #     unless title&.include? "Won't Believe" || "Secret" || "Top [number]" || "Guess"
    #         errors.add(:title, "Not clickbait-y enough!")
    #     end
    # end
end
