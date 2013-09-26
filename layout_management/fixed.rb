# it works
require 'gtk3'

class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title "Fixed"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        init_ui

        set_default_size 300, 280
        window_position = :center
        
        show_all
    end
    
    def init_ui
        # deprecated -> modify_bg Gtk::STATE_NORMAL, Gdk::Color.new(6400, 6400, 6440) 
        override_background_color = :normal, Gdk::Color.new(6400, 6400, 6440)
               
        begin       
            bardejov = Gdk::Pixbuf.new(:file => "sample_image.jpg")
            rotunda = Gdk::Pixbuf.new("sample_image.jpg")
            mincol = Gdk::Pixbuf.new("sample_image.jpg")
        rescue IOError => e
            puts e
            puts "cannot load images"
            exit
        end
        # deprecated -> image1 = Gtk::Image.new bardejov
        # all options
        # image1 = Gtk::Image.new(:stock => nil, :icon_name => nil, :icon_set => nil, 
        # :gicon => nil, :file => nil, :pixbuf => bardejov, :animation => nil, :size => nil)
        image1 = Gtk::Image.new(:pixbuf => bardejov)
        image2 = Gtk::Image.new(:pixbuf => rotunda)
        image3 = Gtk::Image.new(:pixbuf => mincol)
        
        fixed = Gtk::Fixed.new
        
        fixed.put image1, 20, 20
        fixed.put image2, 40, 160
        fixed.put image3, 170, 50
  
        add fixed
        
    end
end

Gtk.init
    window = RubyApp.new
Gtk.main
