module Listable
  # Listable methods go here


   def format_indent(options = {})
    if options[:description]
      options[:description].to_s.ljust(40)
    elsif options[:type]
      options[:type].to_s.ljust(8)
    end
  end
 
def format_date(date1, date2 = nil)
    if date1
      if date2
        "#{date2.strftime('%D')} -- #{date2.strftime('%D')}"
      else date1.strftime('%D')
      end
    else 'No date'
    end
  end



def format_priority(priority)
    case priority
    when 'high' then '***'.colorize(:red)
    when 'medium' then ' **'.colorize(:orange)
    when 'low' then ' *'.colorize(:green)
    else ''
    end
  end


end
