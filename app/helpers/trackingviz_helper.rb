module TrackingvizHelper

  def pickcolor(value, value_target)
    diff = (value * 100/value_target)
    diff > 50 ? "red" : "green"
  end
end
