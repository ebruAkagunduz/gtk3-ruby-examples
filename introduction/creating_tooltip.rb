
require 'gtk3'

class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title  "Tooltips"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        fixed = Gtk::Fixed.new
        add fixed
        # deprecated button = Gtk::Button.new('Button') 
        button = Gtk::Button.new(:label =>'Button', :mnemonic => nil, :stock_id => nil)
        button.set_size_request 80, 35      
        button.set_tooltip_text "Button widget"
  
        fixed.put button, 50, 50       

        set_tooltip_text "Window widget"
        set_default_size 250, 200
        set_window_position :center
        
        show_all
        
    end
end

Gtk.init
    window = RubyApp.new
Gtk.main
