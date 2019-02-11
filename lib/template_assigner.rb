require_relative 'loaders/deliminators'

class TemplateAssigner
  attr_accessor :result
  
  def initialize(holders, args)
    @placeholders = holders
    @delims = args.delete(:deliminator)
    @template = args.delete(:raw_template)
    @parameters = args
  end
  
  def process
    fill_holders
    fill_out_template_with_placeholders
    raise ArgumentError.new(deliminator_found) if check_no_orphans
    @result = @template 
  end
  
  def assign_deliminators(deliminator)
    @delims.start = deliminator.start
    @delims.stop = deliminator.stop
  end

  def fill_holders
    @holders = @placeholders.map{|x| x= [x, @parameters.fetch(x.to_sym)]} 
  end

  def fill_out_template_with_placeholders
    @holders.map { |x,y| @template.gsub!(@delims.start + x.to_s + @delims.stop, y.to_s) }
  end
  
  # deliminitors should all be removed if there are no empty placeholders
  def check_no_orphans
    [@delims.start, @delims.stop].any? { |x| @template.include? x }
  end
end