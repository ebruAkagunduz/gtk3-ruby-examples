
require 'gtk3'

class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title  "Quit button"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        init_ui
        
        show_all
    end
    
    def init_ui
    
        fixed = Gtk::Fixed.new
        add fixed
       
        button = Gtk::Button.new(:label => "Quit", :mnemonic => nil, :stock_id => nil)
        button.set_size_request 80, 35      
        button.signal_connect "clicked" do 
            Gtk.main_quit 
        end
  
        fixed.put button, 50, 50       

        set_default_size 250, 200
        set_window_position(:center)
    end
end

Gtk.init
    window = RubyApp.new
Gtk.main
