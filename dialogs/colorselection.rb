require 'gtk3'


class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title "ColorSelectionDialog"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        init_ui

        set_default_size 350, 150
        set_window_position(:center)
        
        show_all
    end
    
    def init_ui
    
        set_border_width 10
        @label = Gtk::Label.new "The only victory over love is flight."
        button = Gtk::Button.new(:label => "Select color")
        
        button.signal_connect "clicked" do
            on_clicked
        end

        fix = Gtk::Fixed.new
        fix.put button, 100, 30
        fix.put @label, 30, 90
        add fix
    end
    
    def on_clicked
        # deprecated -> cdia = Gtk::ColorSelectionDialog.new "Select color"
        cdia = Gtk::ColorSelectionDialog.new(:title => "Select color")
        response = cdia.run
              
        if response == Gtk::ResponseType::OK
            colorsel = cdia.color_selection
            # color = colorsel.current_color, it returns Gtk::Color but it should return Gdk::RGBA
            color = colorsel.current_rgba
            @label.override_color(:normal, color)
        end
        
        cdia.destroy
    end
end

Gtk.init
    window = RubyApp.new
Gtk.main

