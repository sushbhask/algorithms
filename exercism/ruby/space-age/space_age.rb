class SpaceAge
  attr_accessor :age_in_seconds

  SECONDS_IN_DAY = 86400
  DAYS_IN_YEAR = 365.25
  YEARLY_RATIO = {
    "earth" => 1,
    "mercury" => 0.2408467,
    "venus" => 0.61519726,
    "mars" => 1.8808158,
    "jupiter" => 11.862615,
    "saturn" => 29.447498,
    "uranus" => 84.016846,
    "neptune" => 164.79132,
  }

  def initialize(seconds)
    self.age_in_seconds = seconds
  end

  def method_missing(method, *args, &block)
    return super method, *args, &block unless method.to_s =~ /^on_\w+/
    self.class.send(:define_method, method) do
      planet = method.to_s.gsub(/^on_/, '').to_s
      age_in_earth_years = (self.age_in_seconds) / (SECONDS_IN_DAY * DAYS_IN_YEAR).to_f.round(6)
      year_ratio = YEARLY_RATIO[planet]
      year_ratio.nil? ? "invalid planet" : (age_in_earth_years / year_ratio).to_f.round(6)
    end
    self.send method, *args, &block
  end
end
