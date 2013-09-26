WIDTH = 300
HEIGHT = 270
DOT_SIZE = 10
ALL_DOTS = WIDTH * HEIGHT / (DOT_SIZE * DOT_SIZE)
RAND_POS = 26

$x = [0] * ALL_DOTS
$y = [0] * ALL_DOTS

class Board < Gtk::DrawingArea

    def initialize
        super
            
        modify_bg Gtk::STATE_NORMAL, Gdk::Color.new(0, 0, 0)

        signal_connect "expose-event" do  
            on_expose
        end
 
        init_game
    end
    
    def on_timer

        if @inGame
            check_apple
            check_collision
            move
            queue_draw
            return true
        else
            return false
        end
    end
    
    def init_game

        @left = false
        @right = true
        @up = false
        @down = false
        @inGame = true
        @dots = 3

        for i in (0..@dots)
            $x[i] = 50 - i * 10
            $y[i] = 50
        end
        
        begin
            @dot = Cairo::ImageSurface.from_png "dot.png"
            @head = Cairo::ImageSurface.from_png "head.png"
            @apple = Cairo::ImageSurface.from_png "apple.png"
        rescue Exception => e
            puts "cannot load images"
            exit
        end

        locate_apple
        GLib::Timeout.add(100) { on_timer }

     end   
        

    def on_expose 
    
        cr = window.create_cairo_context

        if @inGame
            draw_objects cr
        else
            game_over cr
        end      
    end
    
    def draw_objects cr
    
        cr.set_source_rgb 0, 0, 0
        cr.paint

        cr.set_source @apple, @apple_x, @apple_y
        cr.paint

        for z in (0..@dots)
            if z == 0 
                cr.set_source @head, $x[z], $y[z]
                cr.paint
            else
                cr.set_source @dot, $x[z], $y[z]
                cr.paint
            end    
        end
    end

    def game_over cr

        w = allocation.width / 2
        h = allocation.height / 2

        cr.set_font_size 15
        te = cr.text_extents "Game Over"

        cr.set_source_rgb 65535, 65535, 65535
        
        cr.move_to w - te.width/2, h
        cr.show_text "Game Over"

    end


    def check_apple

        if $x[0] == @apple_x and $y[0] == @apple_y 
            @dots = @dots + 1
            locate_apple
        end
    end
    
    def move

        z = @dots

        while z > 0
            $x[z] = $x[(z - 1)]
            $y[z] = $y[(z - 1)]
            z = z - 1
        end

        if @left
            $x[0] -= DOT_SIZE
        end

        if @right 
            $x[0] += DOT_SIZE
        end

        if @up
            $y[0] -= DOT_SIZE
        end

        if @down
            $y[0] += DOT_SIZE
        end
        
     end

    def check_collision

        z = @dots
       
        while z > 0
            if z > 4 and $x[0] == $x[z] and $y[0] == $y[z]
                @inGame = false
            end
            z = z - 1
        end

        if $y[0] > HEIGHT - DOT_SIZE
            @inGame = false
        end
        
        if $y[0] < 0
            @inGame = false
        end
        
        if $x[0] > WIDTH - DOT_SIZE
            @inGame = false
        end
        
        if $x[0] < 0
            @inGame = false
        end    
        
    end

    def locate_apple
    
        r = rand(RAND_POS)
        @apple_x = r * DOT_SIZE
        r = rand(RAND_POS)
        @apple_y = r * DOT_SIZE
    end

    def on_key_down event
    
        key = event.keyval

        if key == Gdk::Keyval::GDK_Left and not @right
            @left = true
            @up = false
            @down = false
        end

        if key == Gdk::Keyval::GDK_Right and not @left
            @right = true
            @up = false
            @down = false
        end

        if key == Gdk::Keyval::GDK_Up and not @down
            @up = true
            @right = false
            @left = false
        end

        if key == Gdk::Keyval::GDK_Down and not @up
            @down = true
            @right = false
            @left = false
        end
    end   
end
