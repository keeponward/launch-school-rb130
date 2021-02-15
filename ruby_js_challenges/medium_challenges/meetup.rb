require 'date'

HASH = { 'first' => 0, 'second' => 7, 'third' => 14, 'fourth' => 21, 'fifth' => 28}

class Meetup
  attr_reader :year, :month, :date, :last_date_of_month

  def initialize(year, month)
    @year = year
    @month = month
    @date = Date.new(year, month, 1)
  end

  def day(weekday, schedule)
    weekday.downcase!
    schedule.downcase!

    date_of_first = get_date_of_first(weekday)

    if schedule == 'teenth'
      search_date = date_of_first.clone
      while !(13..19).include? (search_date.day)
        search_date = search_date + 7
      end
      date_of_scheduled_weekday = search_date
    elsif schedule == 'last'
      date_of_scheduled_weekday = (date_of_first + HASH['fifth']).month == date.month ? date_of_first + HASH['fifth'] : date_of_first + HASH['fourth']
    else
      date_of_scheduled_weekday = date_of_first + HASH[schedule]
    end
    date_of_scheduled_weekday.month == date.month ? date_of_scheduled_weekday : nil
  end

  def get_date_of_first(weekday)
    search_date = date.clone

    case weekday
    when "monday"
      while !search_date.monday?
        search_date = search_date.next_day
      end
    when "tuesday"
      while !search_date.tuesday?
        search_date = search_date.next_day
      end
    when "wednesday"
      while !search_date.wednesday?
        search_date = search_date.next_day
      end
    when "thursday"
      while !search_date.thursday?
        search_date = search_date.next_day
      end
    when "friday"
      while !search_date.friday?
        search_date = search_date.next_day
      end
    when "saturday"
      while !search_date.saturday?
        search_date = search_date.next_day
      end
    when "sunday"
      while !search_date.sunday?
        search_date = search_date.next_day
      end
    end
    search_date
  end

end

# puts Date.civil(2013, 3, 4)

# Meetup.new(2021, 2).day("Wednesday", "third")

# Meetup.new(2021, 2).day("Saturday", "teenth")

# def test_fifth_wednesday_of_october_2015
#   # skip
#   meetup = Meetup.new(2015, 10)
#   puts meetup.day('Wednesday', 'fifth')
# end

# test_fifth_wednesday_of_october_2015
