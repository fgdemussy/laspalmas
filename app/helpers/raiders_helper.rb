module RaidersHelper

  def days_ago_or_today(from_date)
    diff = (Date.today - from_date).round
    if diff > 1
      time_ago_in_words(from_date)
    else
      return "Today"
    end
  end
end
