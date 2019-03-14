module ApplicationHelper

  # ============================================================================
  # Data Formatters ============================================================
  # ============================================================================
  def format_boolean(boolean)
    ["1", 1, "true", true].include?(boolean) ? "Yes" : "No"
  end

  def format_date(date, long = false)
    return "- - - - - - -" if date.blank?
    long ? date.strftime("%B %d, %Y") : date.strftime("%m/%d/%y")
  end

  def format_datetime(datetime, flip = false)
    if flip
      "#{format_time(datetime)} on #{format_date(datetime)}"
    else
      "#{format_date(datetime)} at #{format_time(datetime)}"
    end
  end

  def format_time(time)
    return "- - - - - - -" if time.blank?
    time.strftime("%I:%M %p")
  end

  def dollar_value(price)
    if price.to_s[-2] == "."
      "$#{price}" + "0"
    else
      "$#{price}"
    end
  end

  def number_in_words(int, str = "")
    written_numbers_map.each do |num, name|
      if int == 0
        return str
      elsif int.to_s.length == 1 && int/num > 0
        return str + "#{name}"
      elsif int < 100 && int/num > 0
        return str + "#{name}" if int%num == 0
        return str + "#{name} " + number_in_words(int%num)
      elsif int/num > 0
        return str + number_in_words(int/num) + " #{name} " + number_in_words(int%num)
      end
    end
  end

  def time_diff(start_time, end_time)
    return 'uknown' if start_time.blank? || end_time.blank?

    seconds_diff = (start_time - end_time).to_i.abs

    hours = seconds_diff / 3600
    seconds_diff -= hours * 3600

    minutes = seconds_diff / 60
    seconds_diff -= minutes * 60

    seconds = seconds_diff

    "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
  end

  def comma_seperate(collection, attribute = nil)
    string = ""
    if attribute
      collection.each do |item|
        string += "#{item.send(attribute).humanize.titleize}, "
      end
    else
      collection.each do |item|
        string += "#{item.humanize.titleize}, "
      end
    end
    string[0...-2]
  end

  # ============================================================================
  # Input Helpers ==============================================================
  # ============================================================================
  def enum_select(enums, sort = true)
  	sort ? enums.map {|k, v| [k.humanize, k] }.sort : enums.map {|k, v| [k.humanize, k] }
  end

  # ============================================================================
  # Wrappers ===================================================================
  # ============================================================================
  def form_wraper
    content_tag(:div, class: 'col-xs-7 col-sm-5 col-md-4 col-lg-3 form-container' ) do
      yield
    end
  end

  # ============================================================================
  # Collections ================================================================
  # ============================================================================
  def us_states
    [
      ['Alabama', 'AL'],
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY']
    ]
  end

  def canadian_provinces
    [
      ["Alberta", "AB"],
      ["British Columbia", "BC"],
      ["Manitoba", "MB"],
      ["New Brunsick", "NB"],
      ["Newfoundland and Labrador", "NL"],
      ["Nova Scotia", "NS"],
      ["Northwest Territories", "NT"],
      ["Nunavut", "NU"],
      ["Ontario", "ON"],
      ["Prince Edward Island", "PE"],
      ["Quebec", "QC"],
      ["Saskatchewan", "SK"],
      ["Yukon", "YT"]
    ]
  end

  def country_regions
    [
      ["United States", us_states],
      ["Canada", canadian_provinces]
    ]
  end

  def written_numbers_map
    {
      1000000 => "million",
      1000 => "thousand",
      100 => "hundred",
      90 => "ninety",
      80 => "eighty",
      70 => "seventy",
      60 => "sixty",
      50 => "fifty",
      40 => "forty",
      30 => "thirty",
      20 => "twenty",
      19 => "nineteen",
      18 => "eighteen",
      17 => "seventeen",
      16 => "sixteen",
      15 => "fifteen",
      14 => "fourteen",
      13 => "thirteen",
      12 => "twelve",
      11 => "eleven",
      10 => "ten",
      9 => "nine",
      8 => "eight",
      7 => "seven",
      6 => "six",
      5 => "five",
      4 => "four",
      3 => "three",
      2 => "two",
      1 => "one"
    }
  end
end
