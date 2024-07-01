def can_stop_recursive(runway, initial_speed, initial_position = 0)
  return false if initial_speed < 0
  return true if initial_speed == 0
  return false if initial_position < 0 || initial_position >= runway.length

  # Try three possible speeds: current speed, current speed - 1, current speed + 1
  [initial_speed, initial_speed - 1, initial_speed + 1].each do |new_speed|
    next if new_speed < 0 # Skip negative speeds
    return true if can_stop_recursive(runway, new_speed, initial_position + new_speed)
  end

  false
end
