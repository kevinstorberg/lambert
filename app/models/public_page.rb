class PublicPage < ApplicationRecord

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
