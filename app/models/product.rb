class Product < ActiveRecord::Base
  
  default_scope :order => 'title'
  
  has_many :line_items
  
  validates :title, :desc, :presence => true
  validates :title, :uniqueness => true
  validates :title, :length => {:minimum => 5}
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png|jpeg)$}i,
    :message => "must be a URL for GIF, JPG or PNG"
  }
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
  private
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line items present for this Product')
        return false
      end
      
    end
end
