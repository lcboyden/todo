class User < ApplicationRecord
  has_many :lists, dependent: :destroy
  
  def name
    "#{self.first_name} #{self.last_name}"
  end
end
