# # Create hash of trains and times
# schedule = {
#   "2" => "Train 1",
#   "5" => "Train 2",
#   "7.5" => "Train 3",
#   "8.5" => "Train 4",
#   "9" => "Train 5",
#   "10" => "Train 6",
#   "11.5" => "Train 7",
#   "13.5" => "Train 8",
#   "14.5" => "Train 9",
#   "17" => "Train 10",
#   "18" => "Train 11",
#   "19" => "Train 12",
#   "24" => "Train 13",
# }

# # Get user input for a time
# puts "What time are you leaving?"

# user_input = gets.chomp.to_f

#  # Return train and time for the next available train
# if user_input.between?(19, 24)
#   puts "You should catch Train 13 leaving at 24"
#   puts
#   puts "***DON'T STOP...BELIEVIN'!***

# Just a small town girl
# Living in a lonely world
# She took the midnight train going anywhere
# Just a city boy
# Born and raised in South Detroit
# He took the midnight train going anywhere

# A singer in a smoky room
# A smell of wine and cheap perfume
# For a smile they can share the night
# It goes on and on and on and on

# Strangers waiting, up and down the boulevard
# Their shadows searching in the night
# Streetlights people, living just to find emotion
# Hiding, somewhere in the night."

# else
#   schedule.each do |key, value|
#     if user_input < key.to_f
#       puts "You should catch #{value} leaving at #{key}"
#       break
#     end
#   end
# end

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
