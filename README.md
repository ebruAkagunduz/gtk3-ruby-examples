gtk3-ruby-examples
==================

This repo contains Gtk3 - Ruby examples. I got Gtk2 - Ruby examples from http://zetcode.com/gui/rubygtk/. 
I converted Gtk2 examples to Gtk3 at Zet Code and I added them to this repo also I added Gtk2 and Gtk3 syntax differences to Readme.



### Horizontal And Vertical Scales

```Ruby
# deprecated -> scale = Gtk::HScale.new
# use Gtk::Scale.new(:horizontal, *args)
scale = Gtk::Scale.new(:horizontal)
```

### Button
```Ruby
# deprecated -> button = Gtk::Button.new "About"
button = Gtk::Button.new(:label => "About")
```

### Color Selection Dialog
```Ruby
# deprecated -> cdia = Gtk::ColorSelectionDialog.new "Select color"
cdia = Gtk::ColorSelectionDialog.new(:title => "Select color")

colorsel = cdia.color_selection
# color = colorsel.current_color, .current_color returns Gtk::Color but it should return Gdk::RGBA
color = colorsel.current_rgba
```

###  Font Selection Dialog
```Ruby
# deprecated fdia = Gtk::FontSelectionDialog.new "Select font name"
fdia = Gtk::FontChooserDialog.new(:title => "Select font name", :parent => nil)
```

### Dialog Response Type
```Ruby
# deprecated if response == Gtk::Dialog::RESPONSE_OK, you can use Gtk::ResponseType::OK
if response == Gtk::ResponseType::OK
```

### Pango Font Description
```Ruby
# deprecated -> font_desc = Pango::FontDescription.new fdia.font_name
font_desc_ = Pango::FontDescription.new fdia.font_desc

@label = Gtk::Label.new "The only victory over love is flight."
# deprecated -> @label.modify_font font_desc
@label.override_font(font_desc_)

```

### Message Dialog
```Ruby
# deprecated ->  md = Gtk::MessageDialog.new(self, Gtk::Dialog::MODAL |
# Gtk::Dialog::DESTROY_WITH_PARENT, Gtk::MessageDialog::ERROR, 
# Gtk::MessageDialog::BUTTONS_CLOSE, "Error loading file")
md = Gtk::MessageDialog.new(:parent => nil, :flags => :destroy_with_parent,
                            :type => :info, :buttons_type => :close, 
                            :message => "Download completed")
                            
# deprecated -> Gtk::MessageDialog::ERROR, you should use :error
# deprecated -> Gtk::MessageDialog::QUESTION, you should use :question
# deprecated -> Gtk::MessageDialog::WARNING, you should use :warning
```

### Window 
```Ruby
window = Gtk::Window.new
# deprecated -> window.set_window_position Gtk::Window::POS_CENTER
# you can use :center or Gtk::Window::Position::CENTER
window.set_window_position(Gtk::Window::Position::CENTER)


# deprecated -> window.modify_bg Gtk::STATE_NORMAL, Gdk::Color.new(6400, 6400, 6440) 
window.override_background_color = :normal, Gdk::Color.new(6400, 6400, 6440)
```

### Vertical And Horizontal Box
```Ruby
# deprecated -> vbox = Gtk::VBox.new false, 5 
vbox = Gtk::Box.new(:vertical, 5)
# deprecated -> hbox = Gtk::HBox.new true, 3

# deprecated -> vbox.pack_start halign, false, false, 3
# 'Gtk::Box#pack_start(child, :expand => true, :fill => true, :padding => 0)'
vbox.pack_start(halign, :expand => false, :fill => false, :padding => 3) 

```

### Table
```Ruby
# deprecated -> table.attach Gtk::Button.new("Cls"), 0, 1, 0, 1
table.attach Gtk::Button.new(:label => "Cls"), 0, 1, 0, 1


# use Gtk::AttachOptions::FILL instead of Gtk::FILL
table.attach(halign, 0, 1, 0, 1, Gtk::AttachOptions::FILL,
             Gtk::AttachOptions::FILL, 0, 0)

# use Gtk::AttachOptions::EXPAND instead of Gtk::EXPAND
# use Gtk::AttachOptions::SHRINK instead of Gtk::SHRINK
```

### PixBuf & Image
```Ruby
bardejov = Gdk::Pixbuf.new(:file => "sample_image.jpg")
# deprecated -> image1 = Gtk::Image.new bardejov
# all options
# image1 = Gtk::Image.new(:stock => nil, :icon_name => nil, :icon_set => nil, 
# :gicon => nil, :file => nil, :pixbuf => bardejov, :animation => nil, :size => nil)
image1 = Gtk::Image.new(:pixbuf => bardejov)


# deprecated ->  newi = Gtk::ImageMenuItem.new Gtk::Stock::NEW, agr
newi = Gtk::ImageMenuItem.new(:stock_id => Gtk::Stock::NEW, :accel_group => agr)

# deprecated -> newi.add_accelerator("activate", agr, key, 
#                                    mod, Gtk::ACCEL_VISIBLE)
# you can use ":visible" instead of Gtk::AccelFlags::VISIBLE
newi.add_accelerator("activate", agr, key,
                     mod, Gtk::AccelFlags::VISIBLE)
                     
```

### Tool Button & Bar
```Ruby
# deprecated -> newtb = Gtk::ToolButton.new Gtk::Stock::NEW
newtb = Gtk::ToolButton.new(:stock_id => Gtk::Stock::NEW)

# deprecated -> toolbar.insert 0, newtb
toolbar.insert(newtb, 0)
```


### Draw
```Ruby
darea = Gtk::DrawingArea.new  
# deprecated -> @darea.signal_connect("expose-event"){..}
darea.signal_connect('draw'){...}
```

### Combo Box
```Ruby
# deprecated -> cb = Gtk::ComboBox.new
cb = Gtk::ComboBoxText.new
```

### Combo Box Entry
```Ruby
#Gtk::ComboBoxEntry' has been deprecated

box = Gtk::ComboBoxText.new(is_text_only=true)

```
