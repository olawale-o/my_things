require 'date'

module Helper
  def parse_date(date)
    Date.parse(date).strftime('%Y/%m/%d')
  end
end
