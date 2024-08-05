def can_stop_iterative(runway, speed, position = 0)
  return false if speed < 0

  return true if speed == 0

  queue = [[position, speed]] # Initialize a queue with initial position and speed

  while queue.any?
    position, speed = queue.shift # Dequeue a position and speed

    next if position >= runway.length # Skip invalid positions

    return true if speed == 0

    # Try three possible speeds: speed, speed - 1, speed + 1
    
    [speed, speed - 1, speed + 1].each do |new_speed|
      next if new_speed < 0 # Skip negative speeds
      # Enqueue the new position and speed
      queue.push([position + new_speed, new_speed])
    end
  end

  false
end

