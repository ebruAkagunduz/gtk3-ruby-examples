require 'gtk3'


class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title "Colors"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        init_ui

        set_default_size 360, 100
        set_window_position(:center)
        show_all
    end
    
    def init_ui
    
        @darea = Gtk::DrawingArea.new  
        # deprecated -> @darea.signal_connect "expose-event" do  
        #    on_expose
        # end 
        @darea.signal_connect('draw') do  
            on_expose
        end
    
        add(@darea)

    end
    
    def on_expose
    
        cr = @darea.window.create_cairo_context  
        draw_colors cr

    end 
    
    def draw_colors cr
        
        cr.set_source_rgb 0.2, 0.23, 0.9
        cr.rectangle 10, 15, 90, 60
        cr.fill
         
        cr.set_source_rgb 0.9, 0.1, 0.1
        cr.rectangle 130, 15, 90, 60
        cr.fill

        cr.set_source_rgb 0.4, 0.9, 0.4
        cr.rectangle 250, 15, 90, 60
        cr.fill
    end
end

Gtk.init
    window = RubyApp.new
Gtk.main
