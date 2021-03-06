class User < ApplicationRecord

  has_one_attached :avatar
  has_rich_text :long_bio
  has_rich_text :short_bio

  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  validates_presence_of :email, :first_name, :last_name, :role

  scope :team, -> { where(role: ["admin", "associate", "super_admin"]) }

  def full_name(flip = false)
    flip ? "#{last_name}, #{first_name}" : "#{first_name} #{last_name}"
  end

  def full_name_with_titles
    "#{full_name}, #{titles}"
  end

  # ============================================================================
  # ROLES ======================================================================
  # ============================================================================
  def self.role_types
    {
      admin: "Admin",
      associate: "Associate",
      client: "Client",
      # developer: "Developer",
      # super_admin: "Super Admin"
    }
  end

  def any_admin?
    ['admin', 'developer', 'super_admin'].include? role
  end
end
