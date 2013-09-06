

class Schedule
  def initialize(departure_list)
    @departure_list = departure_list.sort_by{|x| x.time}
  end

  def departure_after(time)
    @departure_list.each do |departure|
      if departure.time >= time
        return departure
      end
    end
  end
end

class Departure
  def initialize(train_id, time)
    @train_id = train_id
    @time = time
  end

  def train_id
    @train_id
  end

  def time
    @time
  end

end

departure_listing = []
{
1 => 2,
2 => 5,
3 => 7.5,
4 => 8.5,
5 => 9,
6 => 10,
7 => 11.5,
8 => 13.5,
9 => 14.5,
10 => 17,
11 => 18,
12 => 19,
13 => 24
}.each do |train_id, departure_time|
  departure_listing << Departure.new(train_id, departure_time)
end

train_schedule = Schedule.new(departure_listing)

puts "What time are you leaving?"

user_supplied_time = gets.chomp.to_f
next_departure = train_schedule.departure_after(user_supplied_time)

puts "You should catch Train #{next_departure.train_id} leaving at #{next_departure.time}."
