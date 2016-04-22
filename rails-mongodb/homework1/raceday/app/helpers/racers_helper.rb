module RacersHelper
  def convert_racer(racer)
    racer.is_a?(Racer) ? racer : Racer.new(racer)
  end
end
