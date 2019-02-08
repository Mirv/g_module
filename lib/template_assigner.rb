class TemplateAssigner
  attr_accessor :result
  
  def initialize(holders, args)
    @placeholders = holders
    assign_deliminators(args.delete(:deliminator))
    @template = args.delete(:raw_template)
    @parameters = args
  end
  
  def process
    fill_holders
    fill_out_template_with_placeholders
    raise ArgumentError, "A delimitor has been found. Possible placeholder issue" if check_no_orphans
    @result = @template 
  end
  
  def assign_deliminators(deliminator)
    @start = deliminator.start
    @stop = deliminator.stop
  end

  def fill_holders
    @holders = @placeholders.map{|x| x= [x, @parameters.fetch(x.to_sym)]} 
  end

  def fill_out_template_with_placeholders
    @holders.map { |x,y| @template.gsub!(@start + x.to_s + @stop, y.to_s) }
  end
  
  # deliminitors should all be removed if there are no empty placeholders
  def check_no_orphans
    [@start, @stop].any? { |x| @template.include? x }
  end
end