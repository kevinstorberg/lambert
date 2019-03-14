class ApplicationController < ActionController::Base
  # helper  SmartListing::Helper

  include FlashMessages
  # include Pundit
  # include SmartListing::Helper::ControllerExtensions
  # include SmartListingManager

  # protect_from_forgery prepend: true
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  @@crud_actions  = [:show, :new, :create, :edit, :update, :destroy]
  @@cruds_actions = [:index, :show, :new, :create, :edit, :update, :destroy]

  before_action :puts_params, if: lambda { Rails.env.development? }


  def true?(string)
    string == 'true'
  end

  def false?(string)
    !true?(string)
  end

  def permitted_params
    @permitted_params ||= PermittedParams.new(params)
  end

  # instantiate_params takes arguments in the form of keys which are then used to find params and turn them into instance variables of the same name/value.
  # Arguments can be given a default value by submitting the key in an array. The first element is the key, which is used to search the params. If the params
  # do not contain objects matching that key, an instance variable is created with the name of the key, and the value of the second element in the array.
  def instantiate_params *args
    args.each do |arg|
      if arg.class.to_s == 'Array'
        if params[arg[0]].present?
          instance_variable_set("@#{arg[0].to_s}", params[arg[0]])
        else
          instance_variable_set("@#{arg[0].to_s}", arg[1])
        end

        next
      end

      if params[arg].present?
        instance_variable_set("@#{arg.to_s}", params[arg])
      end
    end
  end

  # ============================================================================
  # Troubleshooting ============================================================
  # ============================================================================
  def puts_params(nest = nil)
    unformated_hash = nest.present? ? nest : params

    unless nest.present?
      puts "=" * 89
      print paint("#{controller_name}##{action_name}") + " | "
      print paint("commit: #{paint(params[:commit])} | ")
      print paint("_method: #{paint(params[:_method])} | ")
      print paint("utf8: #{paint(params[:utf8])} | ")
      puts "#{paint(Time.now.localtime.strftime("%H:%M"))}"
      puts  "=" * 89
    end

    formatted_hash = {}
    unformated_hash.keys.sort.each do |k, v|
      next if ["action", "commit", "controller", "_method", "utf8"].include?(k)
      formatted_hash[k] = unformated_hash[k]
    end

    formatted_hash.each do |k, v|
      if v.class.name == "ActionController::Parameters"
        if v.empty?
          puts "#{k}: #{paint(v)}"
          next
        end
        puts "#{k}: (nested params)"
        puts_params(v)
      elsif v.class.name == "String"
        print "  " if nest.present?
        puts "#{k}: #{paint(v)}"
      end
    end
    puts "=" * 89, nil, nil, nil unless nest.present?
  end

  def paint(v)
    return "\e[#{35}m#{v}\e[0m" if v.class.name == "ActionController::Parameters"

    if v.to_i != 0 && ["Integer", "Fixnum"].include?(v.to_i.class.name)
      return "\e[#{34}m#{v}\e[0m"
    end

    if ["ActiveSupport::TimeWithZone", "Date", "Time", "DateTime"].include?(v.class.name)
      return "\e[#{32}m#{v}\e[0m"
    end

    if ["true", "false", "True", "False"].include?(v)
      return "\e[#{32}m#{v}\e[0m"
    end

    if v.class.name == "String"
      return "\e[#{33}m#{v}\e[0m"
    end

    if v == nil
      return "\e[#{31}m#{'nil'}\e[0m"
    end

    return "\e[#{35}m#{v}\e[0m"
  end
end
