class UdaciList
  
  attr_reader :title, :items

 


  def initialize(options = {})
    @title = options[:title] ? options[:title] : 'Untitled List'
    @items = []
  end

  def add(type, description, options = {})
    type = type.downcase
    if type == 'todo' then @items.push TodoItem.new(description, options)
    elsif type == 'event' then @items.push EventItem.new(description, options)
    elsif type == 'link' then @items.push LinkItem.new(description, options)
    else raise UdaciListErrors::InvalidItemType,
               "'#{type}' is not a valid data type"
    end
  end

  def delete(index)
    if index.between?(1, @items.count)
      @items.delete_at(index - 1)
    else
      raise UdaciListErrors::IndexExceedsListSize,
            "item '#{index}' does not exist"
    end
  end

  def all
    print
  end

 


  def print(class_filter = nil)
    print_header
    if !class_filter.nil? && !@items.any? { |item| item.is_a?(class_filter) }
      puts 'No items were found with given filter'
    else
      @items.each_with_index do |item, position|
        if class_filter.nil? || item.is_a?(class_filter)
          puts "#{position + 1}) #{item.details}"
        end
      end
    end
  end

  def print_header
    puts
    puts '-' * @title.length
    puts @title
    puts '-' * @title.length
  end

  def filter(item_type)
    case item_type
    when 'todo' then item_type = TodoItem
    when 'event' then item_type = EventItem
    when 'link' then item_type = LinkItem
    else raise UdaciListErrors::InvalidFilterType,
               "#{type_desc} is not a valid filter type"
    end
    print(item_type)
  end

def export_file
    a = Artii::Base.new :font => 'slant'
    puts 'Please enter a file name:'
    filename = gets.chomp
    CSV.open(filename, 'w') do |csv|
      @items.each_with_index do |item, position|
        csv << [a.asciify(position + 1),a.asciify(item.details)]
      end
    end
  end

 

  
  def delete_all
    @items.clear
  end
    
  end


