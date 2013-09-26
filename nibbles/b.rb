require 'gtk2'
require './a'

class RubyApp < Gtk::Window
    def initialize
        super
    
        set_title "Nibbles"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        @board = Board.new
        signal_connect "key-press-event" do |w, e|
            on_key_down(w, e)
        end
        
        add @board

        set_default_size 300, 270
        set_window_position Gtk::Window::POS_CENTER
        show_all
    end
    
    def on_key_down widget, event 
     
        key = event.keyval
        @board.on_key_down event
    end
end

Gtk.init
    window = RubyApp.new
Gtk.main
