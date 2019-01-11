require 'timezone'

## TimeLocalizer
#
# In:   timezone name
# Out:  local_offset for UTC
#
class ZoneName
  attr_reader :abbreviation
  
  def initialize(timezone)
    @zone =         init_validation(timezone)
    @zone_name =    get_zone
    @abbreviation = get_abbreviation
  end

  def init_validation(zone)
    raise ArgumentError, "timezone was empty" unless zone != ""
    raise ArgumentError, "timezone is not valid String" unless zone.is_a? String
    zone
  end
  
  def get_zone
    raise ArgumentError, "Non-valid TimeZone" unless Timezone[@zone].valid?
    Timezone[@zone]
  end
  
  def get_abbreviation
    @zone_name.abbr(Time.now)
  end
end