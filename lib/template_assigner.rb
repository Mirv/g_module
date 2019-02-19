require_relative 'deliminators'

class TemplateAssigner
  attr_accessor :result
  
  def initialize(template, args)
    @raw = template.raw
    @holders = template.pull_holders
    @start = template.start
    @stop = template.stop
    @parameters = args
  end
  
  def process
    fill_holders
    fill_out_template_with_placeholders
    raise ArgumentError.new(deliminator_found) if check_no_orphans
    @result = @raw # old
  end

  # create hash of placer as key & values loaded to substitute
  def fill_holders
    @loaded_holders = @holders.map{|x| x= [x, @parameters.fetch(x.to_sym)]} 
  end

  def fill_out_template_with_placeholders
    @loaded_holders.map do |x,y| 
      @raw.gsub!(@start + x.to_s + @stop, y.to_s) 
    end
  end
  
  # deliminitors should all be removed if there are no empty placeholders
  def check_no_orphans
    [@start, @stop].any? { |x| @raw.include? x }
  end
end