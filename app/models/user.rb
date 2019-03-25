class User < ApplicationRecord
  include RailsSettings::Extend

  devise :database_authenticatable, :recoverable,
         :registerable, :rememberable, :validatable

  validates_presence_of :email, :first_name, :last_name

  def full_name(flip = false)
    flip ? "#{last_name}, #{first_name}" : "#{first_name} #{last_name}"
  end

  # ============================================================================
  # ROLES ======================================================================
  # ============================================================================
  def self.role_types
    {
      admin: "Admin",
      client: "Client",
      super_admin: "Super Admin"
    }
  end

  def any_admin?
    ['admin', 'super_admin'].include? role
  end
end
