class PublicPage < ApplicationRecord

  has_rich_text :copy_0

  def self.pages
    ['about', 'home', 'team']
  end

  def self.save_pages
    self.pages.each do |page|
      unless PublicPage.exists?(title: page)
        PublicPage.create(title: page)
      end
    end
  end
end
