def can_stop_iterative(runway, initial_speed, initial_position = 0)
  return false if initial_speed < 0

  return true if initial_speed == 0

  queue = [[initial_position, initial_speed]] # Initialize a queue with initial position and speed

  while queue.any?
    position, speed = queue.shift # Dequeue a position and speed

    next if position < 0 || position >= runway.length # Skip invalid positions

    return true if speed == 0

    # Try three possible speeds: current speed, current speed - 1, current speed + 1
    
    [speed, speed - 1, speed + 1].each do |new_speed|
      next if new_speed < 0 # Skip negative speeds

      # Enqueue the new position and speed
      queue.push([position + new_speed, new_speed])
    end
  end

  false
end




def can_stop_iterative(runway, initial_position=0, initial_speed)
    return false unless initial_speed > 0
    return true if initial_speed == 0

    # initialize a queue with the initial position and speed

    my_array  =  [[initial_position, initial_speed]]

    while my_array.any?
      # get the last speed and position
      position, speed = my_array.pop

      return true if speed == 0
      # invalid position
      next if position < 0 || position >= runway.length

      [speed -1 , speed , speed + 1].each do |new_speed|
        next if new_speed < 0
        # my_array << [position + new_speed, new_speed]
        my_array.push [position + new_speed, new_speed]

      end
    end
    false
end
