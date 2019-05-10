class User < ApplicationRecord
  # include RailsSettings::Extend

  has_one_attached :avatar

  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  validates_presence_of :email, :first_name, :last_name, :role

  scope :team, -> { where(role: ["admin", "super_admin"]) }

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
      client: "Client",
      developer: "Developer",
      super_admin: "Super Admin"
    }
  end

  def any_admin?
    ['admin', 'developer', 'super_admin'].include? role
  end
end
