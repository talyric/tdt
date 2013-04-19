class Character < ActiveRecord::Base
  attr_accessible :age, :alignment, :ath, :career, :con, :dex, :gender, :initiative, :int, :name, :ref, :spd, :str, :wil
end
