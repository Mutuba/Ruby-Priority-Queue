def can_stop_recursive(runway, speed, position = 0)

  return true if speed == 0

  # speed cannot be negative, we cannot land on a spike and we need to be within array bounds
  if speed < 0 || !runway[position] || position < 0 || position >= runway.length
    return false
  end

[speed, speed -1, speed + 1].each do |speed|
  next if speed < 0 
  if can_stop_recursive(runway, speed, position + speed)
    return true
  end
  return false
end
end