module TrackingvizHelper

  def pickcolor(value, value_target)
    diff = ((value * 100)/value_target) - 100
    if diff > 10 or diff < -10
      "#FB0000"
    else
      "green"
    end
  end
end
