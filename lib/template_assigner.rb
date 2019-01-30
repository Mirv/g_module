require 'byebug'
class TemplateAssigner
  attr_accessor :result
  
  def initialize(holders, args)
    @holders = holders
    assign_deliminators(args.delete(:deliminator))
    @template = args.delete(:raw_template)
    @parameters = args
  end
  
  def process
    fill_holders
    fill_out_template_with_placeholders
  end
  
  def assign_deliminators(deliminator)
    @start = deliminator.start
    @stop = deliminator.stop
  end

  def fill_holders
    @holders.map{|x| x= [x, @parameters.fetch(x.to_sym)]} 
  end

  def fill_out_template_with_placeholders
    fill_holders.map { |x,y| @template.gsub!(@start + x.to_s + @stop, y.to_s) }
    @result = @template
  end
  
end