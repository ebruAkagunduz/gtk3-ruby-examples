
require 'gtk3'


class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title "Calculator"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        init_ui

        set_default_size 300, 250
        set_window_position(:center)
        
        show_all
    end
    
    def init_ui
    
        vbox = Gtk::Box.new(:vertical, 2)
        
        mb = Gtk::MenuBar.new
        filemenu = Gtk::Menu.new
        file = Gtk::MenuItem.new "File"
        file.set_submenu filemenu
        mb.append file

        vbox.pack_start(mb, :expand => false, :fill => false, :padding => 0)

        table = Gtk::Table.new 5, 4, true
         
        # deprecated -> table.attach Gtk::Button.new("Cls"), 0, 1, 0, 1
        table.attach Gtk::Button.new(:label => "Cls"), 0, 1, 0, 1
        table.attach Gtk::Button.new(:label => "Bck"), 1, 2, 0, 1
        table.attach Gtk::Label.new, 2, 3, 0, 1
        table.attach Gtk::Button.new(:label => "Close"), 3, 4, 0, 1

        table.attach Gtk::Button.new(:label => "7"), 0, 1, 1, 2
        table.attach Gtk::Button.new(:label => "8"), 1, 2, 1, 2
        table.attach Gtk::Button.new(:label => "9"), 2, 3, 1, 2
        table.attach Gtk::Button.new(:label => "/"), 3, 4, 1, 2

        table.attach Gtk::Button.new(:label => "4"), 0, 1, 2, 3
        table.attach Gtk::Button.new(:label => "5"), 1, 2, 2, 3
        table.attach Gtk::Button.new(:label => "6"), 2, 3, 2, 3
        table.attach Gtk::Button.new(:label => "*"), 3, 4, 2, 3

        table.attach Gtk::Button.new(:label => "1"), 0, 1, 3, 4
        table.attach Gtk::Button.new(:label => "2"), 1, 2, 3, 4
        table.attach Gtk::Button.new(:label => "3"), 2, 3, 3, 4
        table.attach Gtk::Button.new(:label => "-"), 3, 4, 3, 4

        table.attach Gtk::Button.new(:label => "0"), 0, 1, 4, 5
        table.attach Gtk::Button.new(:label => "."), 1, 2, 4, 5
        table.attach Gtk::Button.new(:label => "="), 2, 3, 4, 5
        table.attach Gtk::Button.new(:label => "+"), 3, 4, 4, 5

        vbox.pack_start(Gtk::Entry.new, :expand => false, :fill => false, :padding => 0)
        
        vbox.pack_end(table, :expand => true, :fill => true, :padding => 0)
        
        add vbox

    end
end

Gtk.init
    window = RubyApp.new
Gtk.main
