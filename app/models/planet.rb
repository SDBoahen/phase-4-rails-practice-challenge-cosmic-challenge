class Planet < ApplicationRecord


    #### Association
    has_many :missions
    has_many :scientists, through: :missions

    # P -< M >- S


    #### Validations


    #### Instance / Class Methods


end
