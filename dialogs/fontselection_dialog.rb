require 'gtk3'


class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title "FontSelectionDialog"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        init_ui

        set_default_size 300, 150
        set_window_position(:center)
        
        show_all
    end
    
    def init_ui
    
        set_border_width 10
        @label = Gtk::Label.new "The only victory over love is flight."
        button = Gtk::Button.new(:label => "Select font")
        
        button.signal_connect "clicked" do
            on_clicked
        end

        fix = Gtk::Fixed.new
        fix.put button, 100, 30
        fix.put @label, 30, 90
        add fix

    end
    
    def on_clicked
        # deprecated fdia = Gtk::FontSelectionDialog.new "Select font name"
        fdia = Gtk::FontChooserDialog.new(:title => "Select font name", :parent => nil)
        response = fdia.run
              
        # deprecated if response == Gtk::Dialog::RESPONSE_OK, you can use Gtk::ResponseType::OK
        if response == Gtk::ResponseType::OK
            # deprecated -> font_desc = Pango::FontDescription.new fdia.font_name
            font_desc_ = Pango::FontDescription.new fdia.font_desc
            if font_desc_
                # deprecated -> @label.modify_font font_desc
                @label.override_font(font_desc_)
            end
        end
        fdia.destroy
    end     
end

Gtk.init
    window = RubyApp.new
Gtk.main

