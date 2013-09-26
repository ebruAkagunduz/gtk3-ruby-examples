
require 'gtk3'


class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title "Entry"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        init_ui

        set_default_size 250, 200
        set_window_position(:center)
        
        show_all
    end
    
    def init_ui
    
        fixed = Gtk::Fixed.new

        label = Gtk::Label.new "..."
        fixed.put label, 60, 40

        entry = Gtk::Entry.new
        fixed.put entry, 60, 100

        entry.signal_connect "key-release-event" do |w, e|
            on_key_release(w, e, label)
        end

        add(fixed)
    end  
    
    def on_key_release sender, event, label
        label.set_text sender.text
    end
end

Gtk.init
    window = RubyApp.new
Gtk.main

