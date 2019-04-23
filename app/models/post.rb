class Post < ActiveRecord::Base
  has_many :post_categories #all this does is add methods
  has_many :categories, through: :post_categories #all this does is add methods
  has_many :comments
  has_many :users, through: :comments
  #accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      if category_attributes[:name].present?
        category = Category.find_or_create_by(category_attribute)
        if !self.categories.include?(:category)
          self.post_categories.build(category: category)
        end
      end
    end
  end
end
