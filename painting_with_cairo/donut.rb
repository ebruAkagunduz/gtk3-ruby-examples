require 'gtk3'


class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title('Donut')
        signal_connect('destroy') do 
            Gtk.main_quit 
        end
        
        init_ui

        set_default_size(350, 250)
        set_window_position(:center)
        
        show_all
    end
    
    def init_ui
    
        @darea = Gtk::DrawingArea.new  
        
        @darea.signal_connect('draw') do  
            on_expose
        end
    
        add(@darea)

    end
    
    def on_expose
    
        cr = @darea.window.create_cairo_context  
        cr.set_line_width(0.5)

        w = allocation.width
        h = allocation.height
       
        cr.translate(w/2, h/2)
        cr.arc(0, 0, 120, 0, 2*Math::PI)
        cr.stroke
         
        for i in (1..36)
            cr.save
            cr.rotate(i*Math::PI/36)
            cr.scale(0.3, 1)
            cr.arc(0, 0, 120, 0, 2*Math::PI)
            cr.restore
            cr.stroke
        end
    end
end

Gtk.init
    window = RubyApp.new
Gtk.main
