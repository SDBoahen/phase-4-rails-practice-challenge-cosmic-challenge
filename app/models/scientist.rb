class Scientist < ApplicationRecord

    has_many :missions, dependent: :destroy
    has_many :planets, through: :missions
    ##  S -< []  M 
    #### m - nil : scientist_id


    validates :name, :field_of_study, presence: true

    validates :name, uniqueness: true

end
