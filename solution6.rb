require 'pry'

@array = [
  [1,2,3,4], 
  [12,13,14,5], 
  [11,16,15,6], 
  [10,9,8,7]]
  @array = [
    [1,4,7], 
    [2,5,8], 
    [3,6,9]]

    #Global variables
    @total = @array.length * @array.length ;
    @x = 0;
    @y = 0;
    @min_x = 0;
    @min_y = 0;
    @max_x = @array.length - 1;
    @max_y = @array.length - 1;
    @flow = "left_bot";
    @count = 0


    #loop that read elements from the left top to the right bottom 
    def left_bot
      if @count < @total  
        for @x in @min_x..@max_x - 1
          @count += 1;
          puts @array[@y][@x]
        end
      end
      @x = @max_x
      @y += 1
      if @count < @total  
        for @y in @min_y..@max_y
          @count += 1;
          puts @array[@y][@x]
        end
      end
      @min_y=+ 1
      @max_x-= 1
      @y = @max_y
      @x = @max_x
      @flow = "right_top"
    end

    #loop that reads elements from the right bottom to the left top
    def right_top
      if @count < @total  
        for @x in (@x).downto(@min_x)
          @count += 1;
          puts @array[@y][@x]
        end
      end
      @x = @min_x
      @y -= 1
      if @count < @total  
        for @y in (@y).downto(@min_y)
          @count += 1;
          puts @array[@y][@x]
        end
      end
      @max_y-= 1
      @min_x=+ 1
      @x = @min_x
      @y = @min_y
      @flow = "left_bot"
    end

    #Loop that starts the process
    def start
      while @count < @total
        case @flow
        when "left_bot"
          left_bot
        when "right_top"
          right_top
        end
      end
    end

    start
