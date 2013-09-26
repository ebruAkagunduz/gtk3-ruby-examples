require 'gtk3'


class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title "Windows"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        init_ui

        set_default_size 300, 250
        set_window_position(:center)
        
        show_all
    end
    
    def init_ui
    
        set_border_width 15
        
        table = Gtk::Table.new 8, 4, false
        table.set_column_spacings 3

        title = Gtk::Label.new "Windows"

        halign = Gtk::Alignment.new 0, 0, 0, 0
        halign.add title
        # use Gtk::AttachOptions::FILL instead of Gtk::FILL
        table.attach(halign, 0, 1, 0, 1, Gtk::AttachOptions::FILL,
            Gtk::AttachOptions::FILL, 0, 0)
            
        frame = Gtk::Frame.new
        # use Gtk::AttachOptions::EXPAND instead of Gtk::EXPAND
        table.attach(frame, 0, 2, 1, 3, Gtk::AttachOptions::FILL | Gtk::AttachOptions::EXPAND,
            Gtk::AttachOptions::FILL | Gtk::AttachOptions::EXPAND, 1, 1)

        activate = Gtk::Button.new(:label => "Activate")
        activate.set_size_request 50, 30
        # use Gtk::AttachOptions::SHRINK instead of Gtk::SHRINK,
        table.attach(activate, 3, 4, 1, 2, Gtk::AttachOptions::FILL,
            Gtk::AttachOptions::SHRINK, 1, 1)
        
        valign = Gtk::Alignment.new 0, 0, 0, 0
        close = Gtk::Button.new(:label => "Close")
        close.set_size_request 70, 30
        valign.add close
        table.set_row_spacing 1, 3
        table.attach(valign, 3, 4, 2, 3, Gtk::AttachOptions::FILL,
            Gtk::AttachOptions::FILL | Gtk::AttachOptions::EXPAND, 1, 1)
            
        halign2 = Gtk::Alignment.new 0, 1, 0, 0
        help = Gtk::Button.new(:label => "Help")
        help.set_size_request 70, 30
        halign2.add help
        table.set_row_spacing 3, 6
        table.attach(halign2, 0, 1, 4, 5, Gtk::AttachOptions::FILL,
            Gtk::AttachOptions::FILL, 0, 0)
        
        ok = Gtk::Button.new(:label => "OK")
        ok.set_size_request 70, 30
        table.attach(ok, 3, 4, 4, 5, Gtk::AttachOptions::FILL,
            Gtk::AttachOptions::FILL, 0, 0)
                          
        add table
    end
end

Gtk.init
    window = RubyApp.new
Gtk.main
