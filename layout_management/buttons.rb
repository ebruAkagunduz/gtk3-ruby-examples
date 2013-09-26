
require 'gtk3'


class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title "Buttons"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        init_ui

        set_default_size 260, 150
        set_window_position(:center)
        
        show_all
    end
    
    def init_ui
        
        # deprecated -> vbox = Gtk::VBox.new false, 5 
        vbox = Gtk::Box.new(:vertical, 5)
        # deprecated -> hbox = Gtk::HBox.new true, 3
        hbox = Gtk::Box.new(:horizontal, 3)
        
        valign = Gtk::Alignment.new 0, 1, 0, 0
        vbox.pack_start valign
        
        ok = Gtk::Button.new(:label => "OK")
        ok.set_size_request 70, 30
        close = Gtk::Button.new(:label => "Close")
        
        hbox.add ok
        hbox.add close
        
        halign = Gtk::Alignment.new 1, 0, 0, 0
        halign.add hbox
        
        # deprecated -> vbox.pack_start halign, false, false, 3
        # 'Gtk::Box#pack_start(child, :expand => true, :fill => true, :padding => 0)'
        vbox.pack_start(halign, :expand => false, :fill => false, :padding => 3) 

        add vbox
    end
end

Gtk.init
    window = RubyApp.new
Gtk.main
