class Classperiod < ActiveRecord::Base
  attr_accessible :name, :description
  has_and_belongs_to_many :users
  has_many :assignments, as: :assignable
end
