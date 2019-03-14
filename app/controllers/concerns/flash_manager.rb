module FlashManager
  extend ActiveSupport::Concern
  private

  # Bulk Data Requests =========================================================
  def flash_everything_up_to_date
    {
      text: "Everything is up to date.",
      type: "success"
    }
  end

  def flash_fetch_data_success
    {
      text: "Successfully fetched data requested.",
      type: "success"
    }
  end

  def flash_fetch_data_failed
    {
      text: "Failed to fetch data requested!!",
      type: "alert"
    }
  end

  def flash_update_data_success
    {
      text: "Successfully updated the data requested.",
      type: "success"
    }
  end

  def flash_update_data_failed
    {
      text: "Failed to update the requested data!!",
      type: "alert"
    }
  end

  # CRUD =======================================================================
  def flash_alert
    {
      clear: true,
      text: "Failed to #{action_name} #{flash_object_name}.",
      type: "alert"
    }
  end

  def flash_success
    {
      clear: false,
      text: "#{flash_object_name} successfully #{flash_action_name}.",
      type: "success"
    }
  end

  # ============================================================================
  # Flash Builders =============================================================
  # ============================================================================
  included do
    def clear_flash_messages
      flash.clear
    end

    def flash_message(*messages)
      messages.each do |message|

        message_params = send("flash_#{message}".to_sym)

        clear = message_params[:clear]
        text  = message_params[:text]
        type  = message_params[:type].to_sym

        clear ? (flash.now[type] = text) : (flash[type] = text)
      end
    end

    def flash_action_name
      ['destroy', 'publish'].include?(action_name) ? action_name + "ed" : action_name + "d"
    end

    def flash_object_name
      controller_name.underscore.humanize.split.map {|word| word.singularize }.join(" ")
    end
  end
end
