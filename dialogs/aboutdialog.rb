require 'gtk3'


class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title "About dialog"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        init_ui

        set_default_size 300, 150
        set_window_position(:center)
        
        show_all
    end
    
    def init_ui
        # deprecated -> button = Gtk::Button.new "About"
        button = Gtk::Button.new(:label => "About")
        button.set_size_request 80, 30
        
        button.signal_connect "clicked" do
            on_clicked
        end
        
        fix = Gtk::Fixed.new
        fix.put button, 20, 20
   
        add fix

    end
    
    def on_clicked
        about = Gtk::AboutDialog.new
        about.set_program_name "Battery"
        about.set_version "0.1"
        about.set_copyright "(c) Jan Bodnar"
        about.set_comments "Battery is a simple tool for battery checking"
        about.set_website "http://www.zetcode.com"
        about.set_logo Gdk::Pixbuf.new "battery.png"
        about.run
        about.destroy
    end
end

Gtk.init
    window = RubyApp.new
Gtk.main
