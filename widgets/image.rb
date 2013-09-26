require 'gtk3'


class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title "Red Rock"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        init_ui

        set_default_size 250, 200
        set_window_position(:center)
        
        show_all
    end
    
    def init_ui
    
        set_border_width 2
        
        begin
            # deprecated -> image = Gtk::Image.new "redrock.png"
            image = Gtk::Image.new(:file => "sample_image.png")
        rescue
            puts "cannot load image"
            exit
        end
        
        add image
    end
    
end

Gtk.init
    window = RubyApp.new
Gtk.main
