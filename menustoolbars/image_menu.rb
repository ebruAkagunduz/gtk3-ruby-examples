require 'gtk3'


class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title "Image menu"
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
        
        agr = Gtk::AccelGroup.new
        add_accel_group agr

        # deprecated ->  newi = Gtk::ImageMenuItem.new Gtk::Stock::NEW, agr
        newi = Gtk::ImageMenuItem.new(:stock_id => Gtk::Stock::NEW, :accel_group => agr)
        key, mod = Gtk::Accelerator.parse "N"
        # deprecated ->  newi.add_accelerator("activate", agr, key, 
        #   mod, Gtk::ACCEL_VISIBLE)
        newi.add_accelerator("activate", agr, key,
           mod, Gtk::AccelFlags::VISIBLE)
        filemenu.append newi

        # deprecated -> openm = Gtk::ImageMenuItem.new Gtk::Stock::OPEN, agr
        openm = Gtk::ImageMenuItem.new(:stock_id => Gtk::Stock::OPEN, :accel_group => agr)
        key, mod = Gtk::Accelerator.parse "O"
        openm.add_accelerator("activate", agr, key, 
            mod, Gtk::AccelFlags::VISIBLE)
        filemenu.append openm

        sep = Gtk::SeparatorMenuItem.new
        filemenu.append sep

        # deprecated -> exit = Gtk::ImageMenuItem.new Gtk::Stock::QUIT, agr
        exit = Gtk::ImageMenuItem.new(:stock_id => Gtk::Stock::QUIT, :accel_group => agr)
        key, mod = Gtk::Accelerator.parse "Q"
        # you can use ":visible" instead of Gtk::AccelFlags::VISIBLE
        exit.add_accelerator("activate", agr, key, 
            mod, :visible)

        exit.signal_connect "activate" do
            Gtk.main_quit
        end
        filemenu.append exit

        mb.append filem

        vbox = Gtk::Box.new(:vertical, 2)
        vbox.pack_start(mb, :expand => false, :fill => false, :padding => 0)

        add vbox
    end
end

Gtk.init
    window = RubyApp.new
Gtk.main
