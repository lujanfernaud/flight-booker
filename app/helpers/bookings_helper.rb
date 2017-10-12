module BookingsHelper
  def several?(passengers)
    passengers && passengers > 1
  end
end
