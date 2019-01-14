
class TemplateAssigner
  attr_accessor :result
  
  def initialize(holders, args)
    @holders = holders
    assign_deliminators(args.delete(:deliminator))
    @template = args.delete(:raw_template)
    @parameters = args
    
  end
  
  def assign_deliminators(deliminator)
    @start = deliminator.start
    @stop = deliminator.stop
  end

  def match_placeholder_to_data
    data = @holders.map{|x| x= [x,@parameters.fetch(x.to_sym)]} 
  end
   
  def fill_out_template_placeholders
    match_placeholder_to_data.each do |x,y| 
      sub_in(x.to_s, y.to_s)
    end
    @result = @template
  end
  
  def sub_in(placeholder, replacement)
    placeholder = @start+placeholder+@stop
    @template.gsub!(placeholder, replacement)
  end
end