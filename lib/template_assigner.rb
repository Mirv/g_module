
class TemplateAssigner
  def initialize(holders, args)
    @holders = holders
    @deliminator = args.delete(:deliminator)
    @raw = args.delete(:raw_template)
    @parameters = args
  end

def match_placeholder_to_data2
    # Note:  string hash keys on here to make make next part easier
    # TODO:  remove next two lines when finalize
    # puts @holders.map!{ |k| { k => @parameters.fetch(k.to_sym) }  }
    # {"timeGreeting"=>"Sometime"}
    # byebug
    data = @holders.map{|x| x= [x,@parameters.fetch(x.to_sym)]} 
    # @holders.map!{ |k| {k  @parameters.fetch(k.to_sym)  }
    # @holders.map!{ |k| { k => @parameters.fetch(k) }  }
    @parameters = nil
    data
  end

  def match_placeholder_to_data
    # Note:  string hash keys on here to make make next part easier
    # TODO:  remove next two lines when finalize
    # puts @holders.map!{ |k| { k => @parameters.fetch(k.to_sym) }  }
    # {"timeGreeting"=>"Sometime"}
    # byebug
    data = @holders.map{|x| x= [x,@parameters.fetch(x.to_sym)]} 
    # @holders.map!{ |k| {k  @parameters.fetch(k.to_sym)  }
    # @holders.map!{ |k| { k => @parameters.fetch(k) }  }
    @parameters = nil
    data
  end
  
  def fill_out_template_placeholders
    start = @deliminator.start
    stop = @deliminator.stop
    # puts start+@holders.first+stop
    data = match_placeholder_to_data
    byebug
    msg = @holders.each{|x| }
    blah = @holders.map{ |k| puts "#{k.first}"; @raw.gsub!("#{start}#{k}#{stop}", @holders) }
    blah = @holders.map{ |k| @raw.gsub }
  end
  
  def fill(x)

    placeholder = "#{}x.first.first.to_s#{}"
    @raw.gsub(placeholder, x.first.second)
  end
  
end