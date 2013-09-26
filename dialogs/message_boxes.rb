require 'gtk3'


class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title "Messages"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        init_ui

        set_default_size 250, 100
        set_window_position(:center)
        
        show_all
    end
    
    def init_ui
    
        table = Gtk::Table.new 2, 2, true
        
        # deprecated -> info = Gtk::Button.new "Information"
        info = Gtk::Button.new(:label => "Information")
        warn = Gtk::Button.new(:label => "Warning")
        ques = Gtk::Button.new(:label => "Question")
        erro = Gtk::Button.new(:label => "Error")

        info.signal_connect "clicked" do
            on_info
        end    
        
        warn.signal_connect "clicked" do
            on_warn
        end
        
        ques.signal_connect "clicked" do
            on_ques
        end
        
        erro.signal_connect "clicked" do
            on_erro
        end
        
        table.attach info, 0, 1, 0, 1
        table.attach warn, 1, 2, 0, 1
        table.attach ques, 0, 1, 1, 2
        table.attach erro, 1, 2, 1, 2
        
        add table

    end
    
    def on_info
        # deprecated ->  md = Gtk::MessageDialog.new(self, Gtk::Dialog::MODAL |
        # Gtk::Dialog::DESTROY_WITH_PARENT, Gtk::MessageDialog::ERROR, 
        # Gtk::MessageDialog::BUTTONS_CLOSE, "Error loading file")
        md = Gtk::MessageDialog.new(:parent => self, :flags => :destroy_with_parent,
                                    :type => :info, :buttons_type => :close, 
                                    :message => "Download completed")
        md.run
        md.destroy
    end
        
        
    def on_erro
        # deprecated -> Gtk::MessageDialog::ERROR, you should use :error
        md = Gtk::MessageDialog.new(:parent => self, :flags => :modal,
                                    :type => :error, :buttons_type => :close, 
                                    :message => "Error loading file")
        md.run
        md.destroy
    end
    
    
    def on_ques
        # deprecated -> Gtk::MessageDialog::QUESTION, you should use :question
        md = Gtk::MessageDialog.new(:parent => self, :flags => :destroy_with_parent,
                                    :type => :question, :buttons_type => :close,
                                    :message => "Are you sure to quit?")
        md.run
        md.destroy
    end
    
    def on_warn
        # deprecated -> Gtk::MessageDialog::WARNING, you should use :warning
        md = Gtk::MessageDialog.new(:parent => self, :flags => :destroy_with_parent,
                                    :type =>  :warning, :buttons_type => :close,
                                    :message => "Unallowed operation")
        md.run
        md.destroy
    end
end

Gtk.init
    window = RubyApp.new
Gtk.main
