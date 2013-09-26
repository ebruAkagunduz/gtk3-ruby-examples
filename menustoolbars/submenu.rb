require 'gtk3'


class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title "Submenu"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        init_ui

        set_default_size 250, 200
        # deprecated -> set_window_position Gtk::Window::POS_CENTER
        set_window_position(:center)
        show_all
    end
    
    def init_ui
    
       # deprecated -> modify_bg Gtk::STATE_NORMAL, Gdk::Color.new(6400, 6400, 6440)
        override_background_color(:normal, Gdk::RGBA.new(6400, 6400, 6440, 6440))
        mb = Gtk::MenuBar.new

        filemenu = Gtk::Menu.new
        filem = Gtk::MenuItem.new "File"
        filem.set_submenu filemenu

        mb.append filem
        
        imenu = Gtk::Menu.new

        importm = Gtk::MenuItem.new "Import"
        importm.set_submenu imenu

        inews = Gtk::MenuItem.new "Import news feed..."
        ibookmarks = Gtk::MenuItem.new "Import bookmarks..."
        imail = Gtk::MenuItem.new "Import mail..."

        imenu.append inews
        imenu.append ibookmarks
        imenu.append imail

        filemenu.append importm
        
        exit = Gtk::MenuItem.new "Exit"
        exit.signal_connect "activate" do
            Gtk.main_quit
        end
        
        filemenu.append exit

        # deprecated -> vbox = Gtk::VBox.new false, 2
        vbox = Gtk::Box.new(:vertical, 2)
        # deprecated -> vbox.pack_start mb, false, false, 0
        vbox.pack_start(mb, :expand => false, :fill => false, :padding => 0)

        add vbox
    end
end

Gtk.init
    window = RubyApp.new
Gtk.main
