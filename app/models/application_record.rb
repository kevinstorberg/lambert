class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # ============================================================================
  # Queries ====================================================================
  # ============================================================================
  # SimulationResult.generate_date_ranges(SimulationResult.all, :status_change_date)
  # => [date_range 1, date_range 2, date_range 3 ... date_range n ... date_range N]
  def self.generate_date_ranges(objects, attribute, increment)
    return [] if objects.empty? || attribute.blank? || increment.blank?

    lower_bound = objects.minimum(attribute).strftime("%Y-%m-1").to_date
    upper_bound = objects.maximum(attribute).strftime("%Y-%m-1").to_date

    date        = lower_bound
    date_ranges = []
    index       = 0

    while date <= upper_bound
      next_month = date + 1.send(increment.to_sym)
      date_ranges[index] = date..next_month

      index = index + 1
      date  = next_month
    end

    return date_ranges
  end

  # For searching by date range on multiple attributes at once (i.e. attribute OR attribute)
  # First argument is date range and second argument is the array of attributes to be searched
  def self.date_range_between(range, attributes)
    return if range.blank? || attributes.blank?
    set = self.where(attributes.first => range)
    attributes.each do |attribute|
      next if attribute == attributes.first
      set = set.or(self.where(attribute => range))
    end

    return set
  end

  # ============================================================================
  # Formatters =================================================================
  # ============================================================================
  # Motivation.new(name: 'Hello World').dynamic_name => 'Hello World'
  def dynamic_name # Motivation.new.dynamic_name => 'New Motivation'
    class_name = self.class.table_name.to_sym
    attributes = [:banner, :display_name, :head, :heading, :headline, :label, :title, :name]
    attribute  = attributes.find {|attribute| ActiveRecord::Base.connection.column_exists?(class_name, attribute) }

    ActiveRecord::Base.connection.close if ActiveRecord::Base.connection

    if self.send(attribute).present?
      self.send(attribute)
    else
      self.new_record? ? "New #{self.class.name.underscore.humanize}" : self.send(attribute)
    end
  end

  def downcase_attributes(*args)
    args.each do |arg|
      next if arg.blank? || self.send(arg.to_sym).blank?
      self.assign_attributes(arg.to_sym => self.send(arg.to_sym).downcase)
    end
  end

  # ============================================================================
  # System Admin ===============================================================
  # ============================================================================
  def self.in_development?
    Rails.env.development?
  end

  def in_development?
    Rails.env.development?
  end

  def self.in_production?
    Rails.env.production?
  end

  def in_production?
    Rails.env.production?
  end

  # ============================================================================
  # Temporary Scripts ==========================================================
  # ============================================================================
end
