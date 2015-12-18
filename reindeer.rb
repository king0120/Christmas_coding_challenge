# --- Day 14: Reindeer Olympics ---
# This year is the Reindeer Olympics! Reindeer can fly at high speeds, but must
# rest occasionally to recover their energy. Santa would like to know which of his
# reindeer is fastest, and so he has them race.
# Reindeer can only either be flying (always at their top speed) or resting
# (not moving at all), and always spend whole seconds in either state.
# For example, suppose you have the following Reindeer:
# Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
# Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.
# After one second, Comet has gone 14 km, while Dancer has gone 16 km.
# After ten seconds, Comet has gone 140 km, while Dancer has gone 160 km.
# On the eleventh second, Comet begins resting (staying at 140 km), and
# Dancer continues on for a total distance of 176 km. On the 12th second,
# both reindeer are resting.
# They continue to rest until the 138th second, when Comet flies for
# another ten seconds. On the 174th second, Dancer flies for another 11 seconds.
# In this example, after the 1000th second, both reindeer are resting, and
# Comet is in the lead at 1120 km (poor Dancer has only gotten 1056 km by that point).
# So, in this situation, Comet would win (if the race ended at 1000 seconds).
# Given the descriptions of each reindeer (in your puzzle input),
# after exactly 2503 seconds, what distance has the winning reindeer traveled?



class Reindeer
  def initialize(name, speed, fly_time, resting_time)
    @name = name
    @speed = speed
    @fly_time = fly_time
    @resting_time = resting_time

    @position = 0
    @remaining_fly_time = @fly_time

    @remaining_resting_time = 0

  end

  def flying?
    @remaining_fly_time > 0
  end

  def step
    if flying?
      @remaining_fly_time -= 1
      @position += @speed
      if @remaining_fly_time == 0
        @remaining_resting_time = @resting_time
      end
    else
      @remaining_resting_time -=1
      if @remaining_resting_time.zero? && @remaining_fly_time.zero?
        @remaining_resting_time = @resting_time
        @remaining_fly_time = @fly_time
      end
    end
  end

  def to_s
    "#{@name} won! Traveled #{@position} in 2503 seconds."
  end
end


reindeer = [
  Reindeer.new('Rudolph', 22, 8, 165),
  Reindeer.new('Cupid', 8, 17, 115),
  Reindeer.new('Prancer', 18, 6, 103),
  Reindeer.new('Donner', 25, 6, 143),
  Reindeer.new('Dasher', 11, 12, 125),
  Reindeer.new('Comet', 21, 6, 212),
  Reindeer.new('Blitzen', 18, 3, 50),
  Reindeer.new('Vixen', 20, 4, 75),
  Reindeer.new('Dancer', 7, 20, 119),
]



for step in 1..2503
  reindeer.each do |deer|
    deer.step()
  end
end

reindeer.sort_by {|x| @position}
winner = reindeer.first
puts winner
