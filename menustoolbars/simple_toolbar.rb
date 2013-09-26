require 'gtk3'


class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title "Toolbar"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        init_ui

        set_default_size 250, 200
        set_window_position(:center)
        
        show_all
    end
    
    def init_ui
    
        toolbar = Gtk::Toolbar.new
        toolbar.set_toolbar_style Gtk::Toolbar::Style::ICONS

        # deprecated -> newtb = Gtk::ToolButton.new Gtk::Stock::NEW
        newtb = Gtk::ToolButton.new(:stock_id => Gtk::Stock::NEW)
        opentb = Gtk::ToolButton.new(:stock_id => Gtk::Stock::OPEN)
        savetb = Gtk::ToolButton.new(:stock_id => Gtk::Stock::SAVE)
        sep = Gtk::SeparatorToolItem.new
        quittb = Gtk::ToolButton.new(:stock_id => Gtk::Stock::QUIT)
       
        # deprecated -> toolbar.insert 0, newtb
        toolbar.insert(newtb, 0)
        toolbar.insert(opentb, 1)
        toolbar.insert(savetb, 2)
        toolbar.insert(sep, 3)
        toolbar.insert(quittb, 4)
        
        quittb.signal_connect "clicked" do
            Gtk.main_quit
        end

        vbox = Gtk::Box.new(:vertical, 2)
        vbox.pack_start(toolbar, :expand => false, :fill => false, :padding => 0)

        add(vbox)
    end
end

Gtk.init
    window = RubyApp.new
Gtk.main
