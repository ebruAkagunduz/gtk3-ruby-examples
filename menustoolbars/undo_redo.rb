require 'gtk3'


class RubyApp < Gtk::Window

    
    def initialize
        super
    
        set_title "Undo redo"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        @count = 2
        
        init_ui

        set_default_size 250, 200
        set_window_position(:center)
        
        show_all
    end
    
    def init_ui
    
        toolbar = Gtk::Toolbar.new
        toolbar.set_toolbar_style Gtk::Toolbar::Style::ICONS
        # deprecated -> @undo = Gtk::ToolButton.new Gtk::Stock::UNDO
        @undo = Gtk::ToolButton.new(:stock_id => Gtk::Stock::UNDO)
        @redo = Gtk::ToolButton.new(:stock_id => Gtk::Stock::REDO)
        sep = Gtk::SeparatorToolItem.new
        quit = Gtk::ToolButton.new(:stock_id => Gtk::Stock::QUIT)

        toolbar.insert(@undo, 0)
        toolbar.insert(@redo, 1)
        toolbar.insert(sep, 2)
        toolbar.insert(quit, 3)
        
        @undo.signal_connect "clicked" do
            on_undo
        end
         
        @redo.signal_connect "clicked" do
            on_redo
        end
        
        quit.signal_connect "clicked" do
            Gtk.main_quit
        end

        vbox = Gtk::Box.new(:vertical, 2)
        vbox.pack_start(toolbar, :expand => false, :fill => false, :padding => 0)

        self.add vbox

    end
    
    def on_undo

        @count = @count - 1

        if @count <= 0
            @undo.set_sensitive false
            @redo.set_sensitive true
        end
    end


    def on_redo
        @count = @count + 1

        if @count >= 5
            @redo.set_sensitive false
            @undo.set_sensitive true
        end
    end
end

Gtk.init
    window = RubyApp.new
Gtk.main
