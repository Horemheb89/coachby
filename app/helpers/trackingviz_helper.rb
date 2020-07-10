module TrackingvizHelper

  def pickcolor(value, value_target)
    diff = ((value * 100)/value_target) - 100
    if diff > 15
      "#FB0000"
    elsif diff < -15
      "#76FB00"
    end
  end
end
