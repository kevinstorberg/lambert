class Setting < RailsSettings::Base
  cache_prefix { "v1" }

  field :display_login_link, type: :string, default: "true"
end
