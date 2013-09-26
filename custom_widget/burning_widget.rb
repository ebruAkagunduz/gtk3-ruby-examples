require 'gtk3'

class Burning < Gtk::DrawingArea

    def initialize(parent)
        @parent = parent

        super()
 
        @num = [ "75", "150", "225", "300", 
            "375", "450", "525", "600", "675" ]
 
        set_size_request 1, 30
        signal_connect "draw" do
            expose
        end
    end
    

    def expose
    
        cr = window.create_cairo_context
        draw_widget cr
  
    end
    
    def draw_widget cr
 
         cr.set_line_width 0.8

        cr.select_font_face("Courier", 
            Cairo::FONT_SLANT_NORMAL, Cairo::FONT_WEIGHT_NORMAL)
        cr.set_font_size 11

        width = allocation.width
     
        @cur_width = @parent.get_cur_value

        step = (width / 10.0).round

        till = (width / 750.0) * @cur_width
        full = (width / 750.0) * 700

        if @cur_width >= 700
            
            cr.set_source_rgb(1.0, 1.0, 0.72)
            cr.rectangle(0, 0, full, 30)
            cr.clip
            cr.paint
            cr.reset_clip
            
            cr.set_source_rgb(1.0, 0.68, 0.68)
            cr.rectangle(full, 0, till-full, 30)
            cr.clip
            cr.paint
            cr.reset_clip

        else
            cr.set_source_rgb 1.0, 1.0, 0.72
            cr.rectangle 0, 0, till, 30
            cr.clip
            cr.paint
            cr.reset_clip
        end
       

        cr.set_source_rgb(0.35, 0.31, 0.24)
        
        for i in (1..@num.length)
            cr.move_to i*step, 0
            cr.line_to i*step, 5
            cr.stroke
            
            te = cr.text_extents @num[i-1]
            cr.move_to i*step-te.width/2, 15
            cr.text_path @num[i-1]
            cr.stroke
        end         
    end
end
        
 
class RubyApp < Gtk::Window
    def initialize
        super
    
        set_title "Burning"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end

        set_size_request 350, 200        
        set_window_position(:center)
        
        @cur_value = 0
       
        vbox = Gtk::Box.new(:vertical, 2)
        
        # deprecated -> scale = Gtk::HScale.new
        # use Gtk::Scale.new(:horizontal, *args)
        scale = Gtk::Scale.new(:horizontal)
        scale.set_range 0, 750
        scale.set_digits 0
        scale.set_size_request 160, 35
        scale.set_value @cur_value
        
        scale.signal_connect "value-changed" do |w|
            on_changed(w)
        end
                
        fix = Gtk::Fixed.new
        fix.put scale, 50, 50
        
        vbox.pack_start fix
        
        @burning = Burning.new(self)
        vbox.pack_start(@burning, :expand => false, :fill => false, :padding => 0)

        add vbox
        show_all
    end    
        
    def on_changed widget
    
        @cur_value = widget.value
        @burning.queue_draw
    end
    
    def get_cur_value
        return @cur_value
    end
end
    
Gtk.init
    window = RubyApp.new
Gtk.main
