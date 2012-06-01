class LineItem < ActiveRecord::Base
  #belongs_to is similar to foreign_key references
  belongs_to :product
  belongs_to :cart
end
