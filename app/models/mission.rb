class Mission < ApplicationRecord
  belongs_to :scientist
  belongs_to :planet


  validates :name, :scientist, :planet, presence: true


  # a scientist cannot join the same mission twice
  #### M [] >- S
  #### P -< M >- S

  # validates :scientist, uniqueness: { 
  #   scope: :name, 
  #   message: "can't joint the same mission twice" 
  # }

  # validates :planet_id, uniqueness: { scope: :scientist_id }

  # validates :scientist_id, uniqueness: true

  # validates :name, presence: true, uniqueness: true

  
  validates :scientist, uniqueness: {scope: :name}


end
