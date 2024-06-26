def can_stop_iterative(runway, initial_speed, initial_position = 0)
  return false if initial_speed < 0

  return true if initial_speed == 0

  array_queue = [[initial_position, initial_speed]] # Initialize a queue with initial position and speed

  while array_queue.any?
    position, speed = array_queue.shift # Dequeue a position and speed

    next if position < 0 || position >= runway.length # Skip invalid positions

    return true if speed == 0

    # Try three possible speeds: current speed, current speed - 1, current speed + 1
    
    [speed, speed - 1, speed + 1].each do |new_speed|
      next if new_speed < 0 # Skip negative speeds
      # Enqueue the new position and speed
      array_queue.push([position + new_speed, new_speed])
    end
  end

  false
end

