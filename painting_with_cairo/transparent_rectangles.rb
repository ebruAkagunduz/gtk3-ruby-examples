require 'gtk3'


class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title('Transparent rectangles')
        signal_connect('destroy') do 
            Gtk.main_quit 
        end
        
        init_ui

        set_default_size(590, 90)
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
        
        for i in (1..10)
            cr.set_source_rgba(0, 0, 1, i*0.1)
            cr.rectangle(50*i, 20, 40, 40)
            cr.fill
        end
    end
end

Gtk.init
    window = RubyApp.new
Gtk.main
