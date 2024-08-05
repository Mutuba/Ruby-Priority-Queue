def can_stop_recursive(runway, speed, position = 0)
  return false if speed < 0 # early return false
  return true if speed == 0

  # verify that the position is within the runway
  return false position >= runway.length

  # Try three possible speeds: current speed, current speed - 1, current speed + 1
  [speed, speed - 1, speed + 1].each do |new_speed|
    next if new_speed < 0 # Skip negative speeds
    return true if can_stop_recursive(runway, new_speed, position + new_speed)
  end

  false
end
