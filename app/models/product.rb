class Product < ActiveRecord::Base
  
  default_scope :order => 'title'
  
  validates :title, :desc, :presence => true
  validates :title, :uniqueness => true
  validates :title, :length => {:minimum => 5}
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png|jpeg)$}i,
    :message => "must be a URL for GIF, JPG or PNG"
  }
end
