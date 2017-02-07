package Gtk3;
$Gtk3::VERSION = '0.021';
use strict;
use warnings;
use Carp qw/croak/;
use Cairo::GObject;
use Glib::Object::Introspection;
use Exporter;

our @ISA = qw(Exporter);

my $_GTK_BASENAME = 'Gtk';
my $_GTK_VERSION = '3.0';
my $_GTK_PACKAGE = 'Gtk3';

my $_GDK_BASENAME = 'Gdk';
my $_GDK_VERSION = '3.0';
my $_GDK_PACKAGE = 'Gtk3::Gdk';

my $_GDK_PIXBUF_BASENAME = 'GdkPixbuf';
my $_GDK_PIXBUF_VERSION = '2.0';
my $_GDK_PIXBUF_PACKAGE = 'Gtk3::Gdk';

my $_PANGO_BASENAME = 'Pango';
my $_PANGO_VERSION = '1.0';
my $_PANGO_PACKAGE = 'Pango';

# - gtk customization ------------------------------------------------------- #

my %_GTK_NAME_CORRECTIONS = (
  'Gtk3::stock_add' => 'Gtk3::Stock::add',
  'Gtk3::stock_add_static' => 'Gtk3::Stock::add_static',
  'Gtk3::stock_list_ids' => 'Gtk3::Stock::list_ids',
  'Gtk3::stock_lookup' => 'Gtk3::Stock::lookup',
  'Gtk3::stock_set_translate_func' => 'Gtk3::Stock::set_translate_func',
);
my @_GTK_FLATTEN_ARRAY_REF_RETURN_FOR = qw/
  Gtk3::ActionGroup::list_actions
  Gtk3::Builder::get_objects
  Gtk3::CellLayout::get_cells
  Gtk3::Container::get_children
  Gtk3::SizeGroup::get_widgets
  Gtk3::Stock::list_ids
  Gtk3::TreePath::get_indices
  Gtk3::TreeView::get_columns
  Gtk3::UIManager::get_action_groups
  Gtk3::UIManager::get_toplevels
  Gtk3::Window::list_toplevels
/;
my @_GTK_HANDLE_SENTINEL_BOOLEAN_FOR = qw/
  Gtk3::Stock::lookup
  Gtk3::TextBuffer::get_selection_bounds
  Gtk3::TreeModel::get_iter
  Gtk3::TreeModel::get_iter_first
  Gtk3::TreeModel::get_iter_from_string
  Gtk3::TreeModel::iter_children
  Gtk3::TreeModel::iter_nth_child
  Gtk3::TreeModel::iter_parent
  Gtk3::TreeModelFilter::convert_child_iter_to_iter
  Gtk3::TreeModelSort::convert_child_iter_to_iter
  Gtk3::TreeSelection::get_selected
  Gtk3::TreeView::get_dest_row_at_pos
  Gtk3::TreeView::get_path_at_pos
  Gtk3::TreeView::get_tooltip_context
  Gtk3::TreeView::get_visible_range
  Gtk3::TreeViewColumn::cell_get_position
/;
my @_GTK_USE_GENERIC_SIGNAL_MARSHALLER_FOR = (
  ['Gtk3::Editable', 'insert-text'],
  ['Gtk3::Dialog',   'response',    \&Gtk3::Dialog::_gtk3_perl_response_converter],
  ['Gtk3::InfoBar',  'response',    \&Gtk3::Dialog::_gtk3_perl_response_converter],
);

# GtkResponseType: id <-> nick
my $_GTK_RESPONSE_ID_TO_NICK = sub {
  my ($id) = @_;
  {
    local $@;
    my $nick = eval { Glib::Object::Introspection->convert_enum_to_sv (
                        'Gtk3::ResponseType', $id) };
    return $nick if defined $nick;
  }
  return $id;
};
my $_GTK_RESPONSE_NICK_TO_ID = sub {
  my ($nick) = @_;
  {
    local $@;
    my $id = eval { Glib::Object::Introspection->convert_sv_to_enum (
                      'Gtk3::ResponseType', $nick) };
    return $id if defined $id;
  }
  return $nick;
};

# Converter for GtkDialog's "response" signal.
sub Gtk3::Dialog::_gtk3_perl_response_converter {
  my ($dialog, $id) = @_;
  return ($dialog, $_GTK_RESPONSE_ID_TO_NICK->($id));
}

# GtkIconSize: id <-> nick
my $_GTK_ICON_SIZE_ID_TO_NICK = sub {
  my ($id) = @_;
  {
    local $@;
    my $nick = eval { Glib::Object::Introspection->convert_enum_to_sv (
                        'Gtk3::IconSize', $id) };
    return $nick if defined $nick;
  }
  {
    my $nick = Gtk3::IconSize::get_name ($id);
    return $nick if defined $nick;
  }
  return $id;
};
my $_GTK_ICON_SIZE_NICK_TO_ID = sub {
  my ($nick) = @_;
  {
    local $@;
    my $id = eval { Glib::Object::Introspection->convert_sv_to_enum (
                      'Gtk3::IconSize', $nick) };
    return $id if defined $id;
  }
  {
    my $id = Gtk3::IconSize::from_name ($nick);
    return $id if $id;# if it's not zero
  }
  return $nick;
};

# - gdk customization ------------------------------------------------------- #

my @_GDK_HANDLE_SENTINEL_BOOLEAN_FOR = qw/
  Gtk3::Gdk::Event::get_axis
  Gtk3::Gdk::Event::get_button
  Gtk3::Gdk::Event::get_click_count
  Gtk3::Gdk::Event::get_coords
  Gtk3::Gdk::Event::get_keycode
  Gtk3::Gdk::Event::get_keyval
  Gtk3::Gdk::Event::get_scroll_direction
  Gtk3::Gdk::Event::get_scroll_deltas
  Gtk3::Gdk::Event::get_state
  Gtk3::Gdk::Event::get_root_coords
/;
my %_GDK_REBLESSERS = (
  'Gtk3::Gdk::Event' => \&Gtk3::Gdk::Event::_rebless,
);

my %_GDK_EVENT_TYPE_TO_PACKAGE = (
  'expose' => 'Expose',
  'motion-notify' => 'Motion',
  'button-press' => 'Button',
  '2button-press' => 'Button',
  '3button-press' => 'Button',
  'button-release' => 'Button',
  'key-press' => 'Key',
  'key-release' => 'Key',
  'enter-notify' => 'Crossing',
  'leave-notify' => 'Crossing',
  'focus-change' => 'Focus',
  'configure' => 'Configure',
  'property-notify' => 'Property',
  'selection-clear' => 'Selection',
  'selection-request' => 'Selection',
  'selection-notify' => 'Selection',
  'proximity-in' => 'Proximity',
  'proximity-out' => 'Proximity',
  'drag-enter' => 'DND',
  'drag-leave' => 'DND',
  'drag-motion' => 'DND',
  'drag-status' => 'DND',
  'drop-start' => 'DND',
  'drop-finished' => 'DND',
  'client-event' => 'Client',
  'visibility-notify' => 'Visibility',
  'no-expose' => 'NoExpose',
  'scroll' => 'Scroll',
  'window-state' => 'WindowState',
  'setting' => 'Setting',
  'owner-change' => 'OwnerChange',
  'grab-broken' => 'GrabBroken',
  'damage' => 'Expose',
  # added in 3.4:
  'touch-begin' => 'Touch',
  'touch-update' => 'Touch',
  'touch-end' => 'Touch',
  'touch-cancel' => 'Touch',
  # added in 3.6:
  'double-button-press' => 'Button',
  'triple-button-press' => 'Button',
);

# Make all of the above sub-types inherit from Gtk3::Gdk::Event.
{
  no strict qw(refs);
  my %seen;
  foreach (grep { !$seen{$_}++ } values %_GDK_EVENT_TYPE_TO_PACKAGE) {
    push @{'Gtk3::Gdk::Event' . $_ . '::ISA'}, 'Gtk3::Gdk::Event';
  }
}

sub Gtk3::Gdk::Event::_rebless {
  my ($event) = @_;
  my $package = 'Gtk3::Gdk::Event';
  if (exists $_GDK_EVENT_TYPE_TO_PACKAGE{$event->type}) {
    $package .= $_GDK_EVENT_TYPE_TO_PACKAGE{$event->type};
  }
  return bless $event, $package;
}

# - gdk-pixbuf customization ------------------------------------------------ #

my @_GDK_PIXBUF_FLATTEN_ARRAY_REF_RETURN_FOR = qw/
  Gtk3::Gdk::Pixbuf::get_formats
/;

# - Wiring ------------------------------------------------------------------ #

sub import {
  my $class = shift;

  Glib::Object::Introspection->setup (
    basename => $_GTK_BASENAME,
    version => $_GTK_VERSION,
    package => $_GTK_PACKAGE,
    name_corrections => \%_GTK_NAME_CORRECTIONS,
    flatten_array_ref_return_for => \@_GTK_FLATTEN_ARRAY_REF_RETURN_FOR,
    handle_sentinel_boolean_for => \@_GTK_HANDLE_SENTINEL_BOOLEAN_FOR,
    use_generic_signal_marshaller_for => \@_GTK_USE_GENERIC_SIGNAL_MARSHALLER_FOR);

  Glib::Object::Introspection->setup (
    basename => $_GDK_BASENAME,
    version => $_GDK_VERSION,
    package => $_GDK_PACKAGE,
    handle_sentinel_boolean_for => \@_GDK_HANDLE_SENTINEL_BOOLEAN_FOR,
    reblessers => \%_GDK_REBLESSERS);

  Glib::Object::Introspection->setup (
    basename => $_GDK_PIXBUF_BASENAME,
    version => $_GDK_PIXBUF_VERSION,
    package => $_GDK_PIXBUF_PACKAGE,
    flatten_array_ref_return_for => \@_GDK_PIXBUF_FLATTEN_ARRAY_REF_RETURN_FOR);

  Glib::Object::Introspection->setup (
    basename => $_PANGO_BASENAME,
    version => $_PANGO_VERSION,
    package => $_PANGO_PACKAGE);

  Glib::Object::Introspection->_register_boxed_synonym (
    "cairo", "RectangleInt", "gdk_rectangle_get_type");

  # FIXME: This uses an undocumented interface for overloading to avoid the
  # need for a package declaration.
  Gtk3::Gdk::Atom->overload::OVERLOAD (
    '==' => sub { ${$_[0]} == ${$_[1]} },
    '!=' => sub { ${$_[0]} != ${$_[1]} },
    fallback => 1);

  my $init = 0;
  my @unknown_args = ($class);
  foreach (@_) {
    if (/^-?init$/) {
      $init = 1;
    } else {
      push @unknown_args, $_;
    }
  }

  if ($init) {
    Gtk3::init ();
  }

  # call into Exporter for the unrecognized arguments; handles exporting and
  # version checking
  Gtk3->export_to_level (1, @unknown_args);
}

# - Overrides --------------------------------------------------------------- #

sub Gtk3::CHECK_VERSION {
  return not defined Gtk3::check_version(@_ == 4 ? @_[1..3] : @_);
}

sub Gtk3::check_version {
  Glib::Object::Introspection->invoke ($_GTK_BASENAME, undef, 'check_version',
                                       @_ == 4 ? @_[1..3] : @_);
}

# Names "STOP" and "PROPAGATE" here are per the GtkWidget event signal
# descriptions.  In some other flavours of signals the jargon is "handled"
# instead of "stop".  "Handled" matches g_signal_accumulator_true_handled(),
# though that function doesn't rate a mention in the Gtk docs.  There's
# nothing fixed in the idea of "true means cease emission" (whether it's
# called "stop" or "handled").  You can just as easily have false for cease
# (the way the underlying GSignalAccumulator func in fact operates).  The
# upshot being don't want to attempt to be too universal with the names
# here; "EVENT" is meant to hint at the context or signal flavour they're
# for use with.
sub Gtk3::EVENT_PROPAGATE() { !1 };
sub Gtk3::EVENT_STOP() { 1 };

sub Gtk3::init {
  my $rest = Glib::Object::Introspection->invoke (
               $_GTK_BASENAME, undef, 'init',
               [$0, @ARGV]);
  @ARGV = @{$rest}[1 .. $#$rest]; # remove $0
  return;
}

sub Gtk3::init_check {
  my ($success, $rest) = Glib::Object::Introspection->invoke (
                           $_GTK_BASENAME, undef, 'init_check',
                           [$0, @ARGV]);
  @ARGV = @{$rest}[1 .. $#$rest]; # remove $0
  return $success;
}

sub Gtk3::main {
  # Ignore any arguments passed in.
  Glib::Object::Introspection->invoke ($_GTK_BASENAME, undef, 'main');
}

sub Gtk3::main_level {
  # Ignore any arguments passed in.
  return Glib::Object::Introspection->invoke ($_GTK_BASENAME, undef, 'main_level');
}

sub Gtk3::main_quit {
  # Ignore any arguments passed in.
  Glib::Object::Introspection->invoke ($_GTK_BASENAME, undef, 'main_quit');
}

{
  my $global_about_dialog = undef;
  my $about_dialog_key = '__gtk3_about_dialog';

  sub Gtk3::show_about_dialog {
    # For backwards-compatibility, optionally accept and discard a class
    # argument.
    my $parent_or_class = shift;
    my $parent = defined $parent_or_class && $parent_or_class eq 'Gtk3'
               ? shift
               : $parent_or_class;
    my %props = @_;
    my $dialog = defined $parent
               ? $parent->{$about_dialog_key}
               : $global_about_dialog;

    if (!$dialog) {
      $dialog = Gtk3::AboutDialog->new;
      $dialog->signal_connect (delete_event => sub { $dialog->hide_on_delete });
      $dialog->signal_connect (response => sub { $dialog->hide });
      foreach my $prop (keys %props) {
        $dialog->set ($prop => $props{$prop});
      }
      if ($parent) {
        $dialog->set_modal (Glib::TRUE);
        $dialog->set_transient_for ($parent);
        $dialog->set_destroy_with_parent (Glib::TRUE);
        $parent->{$about_dialog_key} = $dialog;
      } else {
        $global_about_dialog = $dialog;
      }
    }

    $dialog->present;
  }
}

sub Gtk3::ActionGroup::add_actions {
  my ($self, $entries, $user_data) = @_;

  croak 'actions must be a reference to an array of action entries'
    unless (ref($entries) eq 'ARRAY');

  croak 'action array is empty'
    unless (@$entries);

  my $process = sub {
    my ($p) = @_;
    my ($name, $stock_id, $label, $accelerator, $tooltip, $callback);

    if (ref($p) eq 'ARRAY') {
      $name        = $p->[0];
      $stock_id    = $p->[1];
      $label       = $p->[2];
      $accelerator = $p->[3];
      $tooltip     = $p->[4];
      $callback    = $p->[5];
    } elsif (ref($p) eq 'HASH') {
      $name        = $p->{name};
      $stock_id    = $p->{stock_id};
      $label       = $p->{label};
      $accelerator = $p->{accelerator};
      $tooltip     = $p->{tooltip};
      $callback    = $p->{callback};
    } else {
      croak 'action entry must be a reference to a hash or an array';
    }

    if (defined($label)) {
      $label   = $self->translate_string($label);
    }
    if (defined($tooltip)) {
      $tooltip = $self->translate_string($tooltip);
    }

    my $action = Gtk3::Action->new ($name, $label, $tooltip, $stock_id);

    if ($callback) {
      $action->signal_connect ('activate', $callback, $user_data);
    }
    $self->add_action_with_accel ($action, $accelerator);
  };

  for my $e (@$entries) {
    $process->($e);
  }
}

sub Gtk3::ActionGroup::add_toggle_actions {
  my ($self, $entries, $user_data) = @_;

  croak 'entries must be a reference to an array of toggle action entries'
    unless (ref($entries) eq 'ARRAY');

  croak 'toggle action array is empty'
    unless (@$entries);

  my $process = sub {
    my ($p) = @_;
    my ($name, $stock_id, $label, $accelerator, $tooltip,
      $callback, $is_active);

    if (ref($p) eq 'ARRAY') {
      $name        = $p->[0];
      $stock_id    = $p->[1];
      $label       = $p->[2];
      $accelerator = $p->[3];
      $tooltip     = $p->[4];
      $callback    = $p->[5];
      $is_active   = $p->[6];
    } elsif (ref($p) eq 'HASH') {
      $name        = $p->{name};
      $stock_id    = $p->{stock_id};
      $label       = $p->{label};
      $accelerator = $p->{accelerator};
      $tooltip     = $p->{tooltip};
      $callback    = $p->{callback};
      $is_active   = $p->{is_active};
    } else {
      croak 'action entry must be a hash or an array';
    }

    if (defined($label)) {
      $label   = $self->translate_string($label);
    }
    if (defined($tooltip)) {
      $tooltip = $self->translate_string($tooltip);
    }

    my $action = Gtk3::ToggleAction->new (
      $name, $label, $tooltip, $stock_id);
    $action->set_active ($is_active) if defined $is_active;

    if ($callback) {
      $action->signal_connect ('activate', $callback, $user_data);
    }

    $self->add_action_with_accel ($action, $accelerator);
  };

  for my $e (@$entries) {
    $process->($e);
  }
}

sub Gtk3::ActionGroup::add_radio_actions {
  my ($self, $entries, $value, $on_change, $user_data) = @_;

  croak 'radio_action_entries must be a reference to '
    . 'an array of action entries'
    unless (ref($entries) eq 'ARRAY');

  croak 'radio action array is empty'
    unless (@$entries);

  my $first_action = undef;

  my $process = sub {
    my ($group, $p) = @_;
    my ($name, $stock_id, $label, $accelerator, $tooltip, $entry_value);

    if (ref($p) eq 'ARRAY') {
      $name        = $p->[0];
      $stock_id    = $p->[1];
      $label       = $p->[2];
      $accelerator = $p->[3];
      $tooltip     = $p->[4];
      $entry_value = $p->[5];
    } elsif (ref($p) eq 'HASH') {
      $name        = $p->{name};
      $stock_id    = $p->{stock_id};
      $label       = $p->{label};
      $accelerator = $p->{accelerator};
      $tooltip     = $p->{tooltip};
      $entry_value = $p->{value};
    } else {
      croak 'radio action entries neither hash nor array';
    }

    if (defined($label)) {
      $label   = $self->translate_string($label);
    }
    if (defined($tooltip)) {
      $tooltip = $self->translate_string($tooltip);
    }

    my $action = Gtk3::RadioAction->new (
      $name, $label, $tooltip, $stock_id, $entry_value);

    $action->join_group($group);

    if ($value == $entry_value) {
      $action->set_active(Glib::TRUE);
    }
    $self->add_action_with_accel($action, $accelerator);
    return $action;
  };

  for my $e (@$entries) {
    my $group = $process->($first_action, $e);
    if (!$first_action) {
      $first_action = $group;
    }
  }

  if ($first_action && $on_change) {
    $first_action->signal_connect ('changed', $on_change, $user_data);
  }
}

sub Gtk3::Builder::add_objects_from_file {
  my ($builder, $filename, @rest) = @_;
  my $ref = _rest_to_ref (\@rest);
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'Builder', 'add_objects_from_file',
    $builder, $filename, $ref);
}

sub Gtk3::Builder::add_objects_from_string {
  my ($builder, $string, @rest) = @_;
  my $ref = _rest_to_ref (\@rest);
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'Builder', 'add_objects_from_string',
    $builder, $string, -1, $ref); # wants length in bytes
}

sub Gtk3::Builder::add_from_string {
  my ($builder, $string) = @_;
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'Builder', 'add_from_string',
    $builder, $string, -1); # wants length in bytes
}

# Copied from Gtk2.pm
sub Gtk3::Builder::connect_signals {
  my $builder = shift;
  my $user_data = shift;

  my $do_connect = sub {
    my ($object,
        $signal_name,
        $user_data,
        $connect_object,
        $flags,
        $handler) = @_;
    my $func = ($flags & 'after') ? 'signal_connect_after' : 'signal_connect';
    # we get connect_object when we're supposed to call
    # signal_connect_object, which ensures that the data (an object)
    # lives as long as the signal is connected.  the bindings take
    # care of that for us in all cases, so we only have signal_connect.
    # if we get a connect_object, just use that instead of user_data.
    $object->$func($signal_name => $handler,
                   $connect_object || $user_data);
  };

  # $builder->connect_signals ($user_data)
  # $builder->connect_signals ($user_data, $package)
  if ($#_ <= 0) {
    my $package = shift;
    $package = caller unless defined $package;

    $builder->connect_signals_full(sub {
      my ($builder,
          $object,
          $signal_name,
          $handler_name,
          $connect_object,
          $flags) = @_;

      no strict qw/refs/;

      my $handler = $handler_name;
      if (ref $package) {
        $handler = sub { $package->$handler_name(@_) };
      } else {
        if ($package && $handler !~ /::/) {
          $handler = $package.'::'.$handler_name;
        }
      }

      $do_connect->($object, $signal_name, $user_data, $connect_object,
                    $flags, $handler);
    });
  }

  # $builder->connect_signals ($user_data, %handlers)
  else {
    my %handlers = @_;

    $builder->connect_signals_full(sub {
      my ($builder,
          $object,
          $signal_name,
          $handler_name,
          $connect_object,
          $flags) = @_;

      return unless exists $handlers{$handler_name};

      $do_connect->($object, $signal_name, $user_data, $connect_object,
                    $flags, $handlers{$handler_name});
    });
  }
}

{
  no strict 'refs';
  my @button_classes = ([Button => 'new_with_mnemonic'],
                        [CheckButton => 'new_with_mnemonic'],
                        [ColorButton => 'new_with_color'],
                        [FontButton => 'new_with_font'],
                        [ToggleButton => 'new_with_mnemonic']);
  foreach my $button_pair (@button_classes) {
    my ($button_class, $button_ctor) = @$button_pair;
    *{'Gtk3::' . $button_class . '::new'} = sub {
      my ($class, $thing) = @_;
      if (defined $thing) {
        return $class->$button_ctor ($thing);
      } else {
        return Glib::Object::Introspection->invoke (
          $_GTK_BASENAME, $button_class, 'new', @_);
      }
    }
  }
}

sub Gtk3::CheckMenuItem::new {
  my ($class, $mnemonic) = @_;
  if (defined $mnemonic) {
    return $class->new_with_mnemonic ($mnemonic);
  }
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'CheckMenuItem', 'new', @_);
}

sub Gtk3::Container::get_focus_chain {
  my ($container) = @_;
  my ($is_set, $widgets) = Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'Container', 'get_focus_chain',
    $container);
  return () unless $is_set;
  return @$widgets;
}

sub Gtk3::Container::set_focus_chain {
  my ($container, @rest) = @_;
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'Container', 'set_focus_chain',
    $container, _rest_to_ref (\@rest));
}

sub Gtk3::CssProvider::load_from_data {
  my ($self, $data) = @_;
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'CssProvider', 'load_from_data',
    $self, _unpack_unless_array_ref ($data));
}

# Gtk3::Dialog / Gtk3::InfoBar methods due to overlap
{
  no strict qw(refs);
  foreach my $dialog_package (qw/Dialog InfoBar/) {
    *{'Gtk3::' . $dialog_package . '::add_action_widget'} = sub {
      Glib::Object::Introspection->invoke (
        $_GTK_BASENAME, $dialog_package, 'add_action_widget',
        $_[0], $_[1], $_GTK_RESPONSE_NICK_TO_ID->($_[2]));
    };
    *{'Gtk3::' . $dialog_package . '::add_button'} = sub {
      Glib::Object::Introspection->invoke (
        $_GTK_BASENAME, $dialog_package, 'add_button',
        $_[0], $_[1], $_GTK_RESPONSE_NICK_TO_ID->($_[2]));
    };
    *{'Gtk3::' . $dialog_package . '::add_buttons'} = sub {
      my ($dialog, @rest) = @_;
      for (my $i = 0; $i < @rest; $i += 2) {
        $dialog->add_button ($rest[$i], $rest[$i+1]);
      }
    };
    *{'Gtk3::' . $dialog_package . '::response'} = sub {
      return Glib::Object::Introspection->invoke (
        $_GTK_BASENAME, $dialog_package, 'response',
        $_[0], $_GTK_RESPONSE_NICK_TO_ID->($_[1]));
    };
    *{'Gtk3::' . $dialog_package . '::set_default_response'} = sub {
      Glib::Object::Introspection->invoke (
        $_GTK_BASENAME, $dialog_package, 'set_default_response',
        $_[0], $_GTK_RESPONSE_NICK_TO_ID->($_[1]));
    };
    *{'Gtk3::' . $dialog_package . '::set_response_sensitive'} = sub {
      Glib::Object::Introspection->invoke (
        $_GTK_BASENAME, $dialog_package, 'set_response_sensitive',
        $_[0], $_GTK_RESPONSE_NICK_TO_ID->($_[1]), $_[2]);
    };
  }
}

sub Gtk3::Dialog::get_response_for_widget {
  my $id = Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'Dialog', 'get_response_for_widget', @_);
  return $_GTK_RESPONSE_ID_TO_NICK->($id);
}

sub Gtk3::Dialog::get_widget_for_response {
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'Dialog', 'get_widget_for_response',
    $_[0], $_GTK_RESPONSE_NICK_TO_ID->($_[1]));
}

sub Gtk3::Dialog::new {
  my ($class, $title, $parent, $flags, @rest) = @_;
  if (@_ == 1) {
    return Glib::Object::Introspection->invoke (
      $_GTK_BASENAME, 'Dialog', 'new', @_);
  } elsif ((@_ < 4) || (@rest % 2)){
    croak ("Usage: Gtk3::Dialog->new ()\n" .
           "  or Gtk3::Dialog->new (TITLE, PARENT, FLAGS, ...)\n" .
           "  where ... is a series of button text and response id pairs");
  } else {
    my $dialog = Gtk3::Dialog->new;
    defined $title and $dialog->set_title ($title);
    defined $parent and $dialog->set_transient_for ($parent);
    $flags & 'modal' and $dialog->set_modal (Glib::TRUE);
    $flags & 'destroy-with-parent' and $dialog->set_destroy_with_parent (Glib::TRUE);
    $dialog->add_buttons (@rest);
    return $dialog;
  }
}

sub Gtk3::Dialog::new_with_buttons {
  &Gtk3::Dialog::new;
}

sub Gtk3::Dialog::run {
  my $id = Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'Dialog', 'run', @_);
  return $_GTK_RESPONSE_ID_TO_NICK->($id);
}

sub Gtk3::Dialog::set_alternative_button_order {
  my ($dialog, @rest) = @_;
  return unless @rest;
  Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'Dialog', 'set_alternative_button_order_from_array',
    $dialog, [map { $_GTK_RESPONSE_NICK_TO_ID->($_) } @rest]);
}

sub Gtk3::Editable::insert_text {
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'Editable', 'insert_text',
    @_ == 4 ? @_ : (@_[0,1], -1, $_[2])); # wants length in bytes
}

sub Gtk3::FileChooserDialog::new {
  my ($class, $title, $parent, $action, @varargs) = @_;

  if (@varargs % 2) {
    croak 'Usage: Gtk2::FileChooserDialog->new' .
          ' (title, parent, action, backend, button-text =>' .
          " response-id, ...)\n";
  }

  my $result = Glib::Object::new (
    $class,
    title => $title,
    action => $action,
  );

  if ($parent) {
    $result->set_transient_for ($parent);
  }

  for (my $i = 0; $i < @varargs; $i += 2) {
    $result->add_button ($varargs[$i], $varargs[$i+1]);
  }

  return $result;
}

sub Gtk3::HBox::new {
  my ($class, $homogeneous, $spacing) = @_;
  $homogeneous = 0 unless defined $homogeneous;
  $spacing = 5 unless defined $spacing;
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'HBox', 'new', $class, $homogeneous, $spacing);
}

# Gtk3::Image
{
  no strict qw(refs);
  foreach my $ctor (qw/new_from_stock new_from_icon_set new_from_icon_name new_from_gicon/) {
    *{'Gtk3::Image::' . $ctor} = sub {
      my ($class, $thing, $size) = @_;
      return Glib::Object::Introspection->invoke (
        $_GTK_BASENAME, 'Image', $ctor, $class, $thing,
        $_GTK_ICON_SIZE_NICK_TO_ID->($size));
    }
  }
  foreach my $getter (qw/get_stock get_icon_set get_icon_name get_gicon/) {
    *{'Gtk3::Image::' . $getter} = sub {
      my ($image) = @_;
      my ($thing, $size) = Glib::Object::Introspection->invoke (
        $_GTK_BASENAME, 'Image', $getter, $image);
      return ($thing, $_GTK_ICON_SIZE_ID_TO_NICK->($size));
    }
  }
  foreach my $setter (qw/set_from_stock set_from_icon_set set_from_icon_name set_from_gicon/) {
    *{'Gtk3::Image::' . $setter} = sub {
      my ($image, $thing, $size) = @_;
      Glib::Object::Introspection->invoke (
        $_GTK_BASENAME, 'Image', $setter, $image, $thing,
        $_GTK_ICON_SIZE_NICK_TO_ID->($size));
    }
  }
}

sub Gtk3::ImageMenuItem::new {
  my ($class, $mnemonic) = @_;
  if (defined $mnemonic) {
    return $class->new_with_mnemonic ($mnemonic);
  }
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'ImageMenuItem', 'new', @_);
}

sub Gtk3::InfoBar::new {
  my ($class, @buttons) = @_;
  if (@_ == 1) {
    return Glib::Object::Introspection->invoke (
      $_GTK_BASENAME, 'InfoBar', 'new', @_);
  } elsif (@buttons % 2) {
    croak "Usage: Gtk3::InfoBar->new_with_buttons (button-text => response_id, ...)\n";
  } else {
    my $infobar = Gtk3::InfoBar->new;
    for (my $i = 0; $i < @buttons; $i += 2) {
      $infobar->add_button ($buttons[$i], $buttons[$i+1]);
    }
    return $infobar;
  }
}

sub Gtk3::InfoBar::new_with_buttons {
  &Gtk3::InfoBar::new;
}

sub Gtk3::LinkButton::new {
  my ($class, $uri, $label) = @_;
  if (defined $label) {
    return Gtk3::LinkButton->new_with_label ($uri, $label);
  } else {
    return Glib::Object::Introspection->invoke (
      $_GTK_BASENAME, 'LinkButton', 'new', @_);
  }
}

sub Gtk3::ListStore::new {
  return _common_tree_model_new ('ListStore', @_);
}

# Reroute 'get' to Gtk3::TreeModel instead of Glib::Object.
sub Gtk3::ListStore::get {
  return Gtk3::TreeModel::get (@_);
}

sub Gtk3::ListStore::insert_with_values {
  my ($model, $position, @columns_and_values) = @_;
  my ($columns, $values) = _unpack_keys_and_values (\@columns_and_values);
  if (not defined $columns) {
    croak ("Usage: Gtk3::ListStore::insert_with_values (\$model, \$position, \\\@columns, \\\@values)\n",
           " -or-: Gtk3::ListStore::insert_with_values (\$model, \$position, \$column1 => \$value1, ...)");
  }
  my @wrapped_values = ();
  foreach my $i (0..$#{$columns}) {
    my $column_type = $model->get_column_type ($columns->[$i]);
    push @wrapped_values,
         Glib::Object::Introspection::GValueWrapper->new (
           $column_type, $values->[$i]);
  }
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'ListStore', 'insert_with_valuesv', # FIXME: missing rename-to annotation?
    $model, $position, $columns, \@wrapped_values);
}

sub Gtk3::ListStore::set {
  return _common_tree_model_set ('ListStore', @_);
}

sub Gtk3::Menu::popup {
  my $self = shift;
  $self->popup_for_device (undef, @_);
}

sub Gtk3::Menu::popup_for_device {
  my ($menu, $device, $parent_menu_shell, $parent_menu_item, $func, $data, $button, $activate_time) = @_;
  my $real_func = $func ? sub {
    my @stuff = eval { $func->(@_) };
    if ($@) {
      warn "*** menu position callback ignoring error: $@";
    }
    if (@stuff == 3) {
      return (@stuff);
    } elsif (@stuff == 2) {
      return (@stuff, Glib::FALSE); # provide a default for push_in
    } else {
      warn "*** menu position callback must return two integers " .
           "(x, y) or two integers and a boolean (x, y, push_in)";
      return (0, 0, Glib::FALSE);
    }
  } : undef;
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'Menu', 'popup_for_device',
    $menu, $device, $parent_menu_shell, $parent_menu_item, $real_func, $data, $button, $activate_time);
}

sub Gtk3::MenuItem::new {
  my ($class, $mnemonic) = @_;
  if (defined $mnemonic) {
    return $class->new_with_mnemonic ($mnemonic);
  }
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'MenuItem', 'new', @_);
}

sub Gtk3::MessageDialog::new {
  my ($class, $parent, $flags, $type, $buttons, $format, @args) = @_;
  my $dialog = Glib::Object::new ($class, message_type => $type,
                                          buttons => $buttons);
  if (defined $format) {
    # sprintf can handle empty @args
    my $msg = sprintf $format, @args;
    $dialog->set (text => $msg);
  }
  if (defined $parent) {
    $dialog->set_transient_for ($parent);
  }
  if ($flags & 'modal') {
    $dialog->set_modal (Glib::TRUE);
  }
  if ($flags & 'destroy-with-parent') {
    $dialog->set_destroy_with_parent (Glib::TRUE);
  }
  return $dialog;
}

# Gtk3::RadioAction, Gtk3::RadioButton, Gtk3::RadioMenuItem and
# Gtk3::RadioToolButton constructors.
{
  no strict qw(refs);

  my $group_converter = sub {
    my ($ctor, $group_or_member, $package) = @_;
    local $@;
    # undef => []
    if (!defined $group_or_member) {
      return ($ctor, []);
    }
    # [] => []
    elsif (eval { $#$group_or_member == -1 }) {
      return ($ctor, []);
    }
    # [member1, ...] => member1
    elsif (eval { $#$group_or_member >= 0 }) {
      my $member = $group_or_member->[0];
      if (defined $member) {
        return ($ctor . '_from_widget', $member);
      }
      return ($ctor, []);
    }
    # member => member
    elsif (eval { $group_or_member->isa ('Gtk3::' . $package) }) {
      return ($ctor . '_from_widget', $group_or_member);
    }
    else {
      croak ('Unhandled group or member argument encountered');
    }
  };

  # Gtk3::RadioAction/Gtk3::RadioButton/Gtk3::RadioMenuItem/Gtk3::RadioToolButton
  foreach my $package (qw/RadioAction RadioButton RadioMenuItem RadioToolButton/) {
    *{'Gtk3::' . $package . '::set_group'} = sub {
      my ($button, $group) = @_;
      my $real_group = $group;
      if (eval { $#$group >= 0 }) {
        $real_group = $group->[0];
      }
      $button->set (group => $real_group);
    };
  }

  # Gtk3::RadioButton/Gtk3::RadioMenuItem
  foreach my $package (qw/RadioButton RadioMenuItem/) {
    foreach my $ctor (qw/new new_with_label new_with_mnemonic/) {
      # Avoid using the list-based API, as G:O:I does not support the memory
      # ownership semantics.  Use the item-based API instead.
      *{'Gtk3::' . $package . '::' . $ctor} = sub {
        my ($class, $group_or_member, @rest) = @_;
        my ($real_ctor, $real_group_or_member) =
          $group_converter->($ctor, $group_or_member, $package);
        return Glib::Object::Introspection->invoke (
          $_GTK_BASENAME, $package, $real_ctor,
          $class, $real_group_or_member, @rest);
      };

      # Work around <https://bugzilla.gnome.org/show_bug.cgi?id=679563>.
      *{'Gtk3::' . $package . '::' . $ctor . '_from_widget'} = sub {
        my ($class, $member, @rest) = @_;
        my $real_ctor = $ctor;
        my $real_group_or_member = $member;
        if (!defined $member) {
          $real_group_or_member = [];
        } else {
          $real_ctor .= '_from_widget';
        }
        return Glib::Object::Introspection->invoke (
          $_GTK_BASENAME, $package, $real_ctor,
          $class, $real_group_or_member, @rest);
      };
    }
  }

  # GtkRadioToolButton
  foreach my $ctor (qw/new new_from_stock/) {
    # Avoid using the list-based API, as G:O:I does not support the memory
    # ownership semantics.  Use the item-based API instead.
    *{'Gtk3::RadioToolButton::' . $ctor} = sub {
      my ($class, $group_or_member, @rest) = @_;
      my ($real_ctor, $real_group_or_member) =
        $group_converter->($ctor, $group_or_member, 'RadioToolButton');
      $real_ctor =~ s/_from_stock_from_/_with_stock_from_/; # you gotta be kidding me...
      return Glib::Object::Introspection->invoke (
        $_GTK_BASENAME, 'RadioToolButton', $real_ctor,
        $class, $real_group_or_member, @rest);
    };
  }
}

sub Gtk3::RecentChooserDialog::new {
  my ($class, $title, $parent, @buttons) = @_;
  my $dialog = Glib::Object::new ($class, title => $title);
  for (my $i = 0; $i < @buttons; $i += 2) {
    $dialog->add_button ($buttons[$i], $buttons[$i+1]);
  }
  if (defined $parent) {
    $dialog->set_transient_for ($parent);
  }
  return $dialog;
}

sub Gtk3::RecentChooserDialog::new_for_manager {
  my ($class, $title, $parent, $mgr, @buttons) = @_;
  my $dialog = Glib::Object::new ($class, title => $title,
    recent_manager => $mgr);
  for (my $i = 0; $i < @buttons; $i += 2) {
    $dialog->add_button ($buttons[$i], $buttons[$i+1]);
  }
  if (defined $parent) {
    $dialog->set_transient_for ($parent);
  }
  return $dialog;
}

sub Gtk3::TextBuffer::create_tag {
  my ($buffer, $tag_name, @rest) = @_;
  if (@rest % 2) {
    croak ('Usage: $buffer->create_tag ($tag_name, $property1 => $value1, ...');
  }
  my $tag = Gtk3::TextTag->new ($tag_name);
  my $tag_table = $buffer->get_tag_table;
  $tag_table->add ($tag);
  for (my $i = 0 ; $i < @rest ; $i += 2) {
    $tag->set_property ($rest[$i], $rest[$i+1]);
  }
  return $tag;
}

sub Gtk3::TextBuffer::insert {
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'TextBuffer', 'insert',
    @_ == 4 ? @_ : (@_[0,1,2], -1)); # wants length in bytes
}

sub Gtk3::TextBuffer::insert_at_cursor {
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'TextBuffer', 'insert_at_cursor',
    @_ == 3 ? @_ : (@_[0,1], -1)); # wants length in bytes
}

sub Gtk3::TextBuffer::insert_interactive {
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'TextBuffer', 'insert_interactive',
    @_ == 5 ? @_ : (@_[0,1,2], -1, $_[3])); # wants length in bytes
}

sub Gtk3::TextBuffer::insert_interactive_at_cursor {
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'TextBuffer', 'insert_interactive_at_cursor',
    @_ == 4 ? @_ : (@_[0,1], -1, $_[2])); # wants length in bytes
}

sub Gtk3::TextBuffer::insert_with_tags {
  my ($buffer, $iter, $text, @tags) = @_;
  my $start_offset = $iter->get_offset;
  $buffer->insert ($iter, $text);
  my $start = $buffer->get_iter_at_offset ($start_offset);
  foreach my $tag (@tags) {
    $buffer->apply_tag ($tag, $start, $iter);
  }
}

sub Gtk3::TextBuffer::insert_with_tags_by_name {
  my ($buffer, $iter, $text, @tag_names) = @_;
  my $start_offset = $iter->get_offset;
  $buffer->insert ($iter, $text);
  my $tag_table = $buffer->get_tag_table;
  my $start = $buffer->get_iter_at_offset ($start_offset);
  foreach my $tag_name (@tag_names) {
    my $tag = $tag_table->lookup ($tag_name);
    if (!$tag) {
      warn "no tag with name $tag_name";
    } else {
      $buffer->apply_tag ($tag, $start, $iter);
    }
  }
}

sub Gtk3::TextBuffer::set_text {
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'TextBuffer', 'set_text',
    @_ == 3 ? @_ : (@_[0,1], -1)); # wants length in bytes
}

sub Gtk3::TreeModel::get {
  my ($model, $iter, @columns) = @_;
  if (!@columns) {
    @columns = (0..($model->get_n_columns-1));
  }
  my @values = map { $model->get_value ($iter, $_) } @columns;
  return @values[0..$#values];
}

# Not needed anymore once <https://bugzilla.gnome.org/show_bug.cgi?id=646742>
# is fixed.
sub Gtk3::TreeModelFilter::new {
  my ($class, $child_model, $root) = @_;
  Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'TreeModel', 'filter_new', $child_model, $root);
}

# Reroute 'get' to Gtk3::TreeModel instead of Glib::Object.
sub Gtk3::TreeModelFilter::get {
  return Gtk3::TreeModel::get (@_);
}

# Not needed anymore once <https://bugzilla.gnome.org/show_bug.cgi?id=646742>
# is fixed.
sub Gtk3::TreeModelSort::new_with_model {
  my ($class, $child_model) = @_;
  Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'TreeModel', 'sort_new_with_model', $child_model);
}

# Reroute 'get' to Gtk3::TreeModel instead of Glib::Object.
sub Gtk3::TreeModelSort::get {
  return Gtk3::TreeModel::get (@_);
}

sub Gtk3::TreePath::new {
  my ($class, @args) = @_;
  my $method = (@args == 1) ? 'new_from_string' : 'new';
  Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'TreePath', $method, @_);
}

sub Gtk3::TreePath::new_from_indices {
  my ($class, @indices) = @_;
  my $path = Gtk3::TreePath->new;
  foreach (@indices) {
    $path->append_index ($_);
  }
  return $path;
}

sub Gtk3::TreeStore::new {
  return _common_tree_model_new ('TreeStore', @_);
}

# Reroute 'get' to Gtk3::TreeModel instead of Glib::Object.
sub Gtk3::TreeStore::get {
  return Gtk3::TreeModel::get (@_);
}

sub Gtk3::TreeStore::insert_with_values {
  my ($model, $parent, $position, @columns_and_values) = @_;
  my ($columns, $values) = _unpack_keys_and_values (\@columns_and_values);
  if (not defined $columns) {
    croak ("Usage: Gtk3::TreeStore::insert_with_values (\$model, \$parent, \$position, \\\@columns, \\\@values)\n",
           " -or-: Gtk3::TreeStore::insert_with_values (\$model, \$parent, \$position, \$column1 => \$value1, ...)");
  }
  my @wrapped_values = ();
  foreach my $i (0..$#{$columns}) {
    my $column_type = $model->get_column_type ($columns->[$i]);
    push @wrapped_values,
         Glib::Object::Introspection::GValueWrapper->new (
           $column_type, $values->[$i]);
  }
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'TreeStore', 'insert_with_values',
    $model, $parent, $position, $columns, \@wrapped_values);
}

sub Gtk3::TreeStore::set {
  return _common_tree_model_set ('TreeStore', @_);
}

sub Gtk3::TreeView::new {
  my ($class, @args) = @_;
  my $method = (@args == 1) ? 'new_with_model' : 'new';
  Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'TreeView', $method, @_);
}

sub Gtk3::TreeView::insert_column_with_attributes {
  my ($tree_view, $position, $title, $cell, @rest) = @_;
  if (@rest % 2) {
    croak ('Usage: $tree_view->insert_column_with_attributes (position, title, cell_renderer, attr1 => col1, ...)');
  }
  my $column = Gtk3::TreeViewColumn->new;
  my $n = $tree_view->insert_column ($column, $position);
  $column->set_title ($title);
  $column->pack_start ($cell, Glib::TRUE);
  for (my $i = 0; $i < @rest; $i += 2) {
    $column->add_attribute ($cell, $rest[$i], $rest[$i+1]);
  }
  return $n;
}

sub Gtk3::TreeViewColumn::new_with_attributes {
  my ($class, $title, $cell, @rest) = @_;
  if (@rest % 2) {
    croak ('Usage: Gtk3::TreeViewColumn->new_with_attributes (title, cell_renderer, attr1 => col1, ...)');
  }
  my $object = $class->new;
  $object->set_title ($title);
  $object->pack_start ($cell, Glib::TRUE);
  for (my $i = 0; $i < @rest; $i += 2) {
    $object->add_attribute ($cell, $rest[$i], $rest[$i+1]);
  }
  return $object;
}

# Gtk3::TreeViewColumn::set_attributes and Gtk3::CellLayout::set_attributes
{
  no strict 'refs';
  foreach my $package (qw/TreeViewColumn CellLayout/) {
    *{'Gtk3::' . $package . '::set_attributes'} = sub {
      my ($object, $cell, @rest) = @_;
      if (@rest % 2) {
        croak ('Usage: $object->set_attributes (cell_renderer, attr1 => col1, ...)');
      }
      $object->clear_attributes ($cell);
      for (my $i = 0; $i < @rest; $i += 2) {
        $object->add_attribute ($cell, $rest[$i], $rest[$i+1]);
      }
    }
  }
}

sub Gtk3::UIManager::add_ui_from_string {
  my ($manager, $string) = @_;
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'UIManager', 'add_ui_from_string',
    $manager, $string, -1); # wants length in bytes
}

sub Gtk3::VBox::new {
  my ($class, $homogeneous, $spacing) = @_;
  $homogeneous = 0 unless defined $homogeneous;
  $spacing = 5 unless defined $spacing;
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'VBox', 'new', $class, $homogeneous, $spacing);
}

sub Gtk3::Widget::render_icon {
  my ($widget, $stock_id, $size, $detail) = @_;
  Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'Widget', 'render_icon', $widget, $stock_id,
    $_GTK_ICON_SIZE_NICK_TO_ID->($size), $detail);
}

sub Gtk3::Window::new {
  my ($class, $type) = @_;
  $type = 'toplevel' unless defined $type;
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, 'Window', 'new', $class, $type);
}

# Gdk

sub Gtk3::Gdk::RGBA::new {
  my ($class, @rest) = @_;
  # Handle Gtk3::Gdk::RGBA->new (r, g, b, a) specially.
  if (4 == @rest) {
    my %data;
    @data{qw/red green blue alpha/} = @rest;
    return Glib::Boxed::new ($class, \%data);
  }
  # Fall back to Glib::Boxed::new.
  return Glib::Boxed::new ($class, @rest);
}

sub Gtk3::Gdk::RGBA::parse {
  my $have_instance;
  {
    local $@;
    $have_instance = eval { $_[0]->isa ('Gtk3::Gdk::RGBA') };
  }
  # This needs to be switched around if/when
  # <https://bugzilla.gnome.org/show_bug.cgi?id=682125> is fixed.
  if ($have_instance) {
    return Glib::Object::Introspection->invoke (
      $_GDK_BASENAME, 'RGBA', 'parse', @_);
  } else {
    my $instance = Gtk3::Gdk::RGBA->new;
    my $success = Glib::Object::Introspection->invoke (
      $_GDK_BASENAME, 'RGBA', 'parse',
      $instance, @_);
    return $success ? $instance : undef;
  }
}

sub Gtk3::Gdk::Window::new {
  my ($class, $parent, $attr, $attr_mask) = @_;
  if (not defined $attr_mask) {
    $attr_mask = Gtk3::Gdk::WindowAttributesType->new ([]);
    if (exists $attr->{title})                                         { $attr_mask |= 'GDK_WA_TITLE' }
    if (exists $attr->{x})                                             { $attr_mask |= 'GDK_WA_X' }
    if (exists $attr->{y})                                             { $attr_mask |= 'GDK_WA_Y' }
    if (exists $attr->{cursor})                                        { $attr_mask |= 'GDK_WA_CURSOR' }
    if (exists $attr->{visual})                                        { $attr_mask |= 'GDK_WA_VISUAL' }
    if (exists $attr->{wmclass_name} && exists $attr->{wmclass_class}) { $attr_mask |= 'GDK_WA_WMCLASS' }
    if (exists $attr->{override_redirect})                             { $attr_mask |= 'GDK_WA_NOREDIR' }
    if (exists $attr->{type_hint})                                     { $attr_mask |= 'GDK_WA_TYPE_HINT' }
    if (!Gtk3::CHECK_VERSION (3, 4, 4)) {
      # Before 3.4.4 or 3.5.6, the attribute mask parameter lacked proper
      # annotations, hence we numerify it here.  FIXME: This breaks
      # encapsulation.
      $attr_mask = $$attr_mask;
    }
  }
  return Glib::Object::Introspection->invoke (
    $_GDK_BASENAME, 'Window', 'new',
    $class, $parent, $attr, $attr_mask);
}

# GdkPixbuf

sub Gtk3::Gdk::Pixbuf::get_pixels {
  my $pixel_aref = Glib::Object::Introspection->invoke (
    $_GDK_PIXBUF_BASENAME, 'Pixbuf', 'get_pixels', @_);
  return pack 'C*', @{$pixel_aref};
}

sub Gtk3::Gdk::Pixbuf::new_from_data {
  my ($class, $data, $colorspace, $has_alpha, $bits_per_sample, $width, $height, $rowstride) = @_;
  # FIXME: do we need to keep $real_data alive and then release it in a destroy
  # notify callback?
  my $real_data = _unpack_unless_array_ref ($data);
  return Glib::Object::Introspection->invoke (
    $_GDK_PIXBUF_BASENAME, 'Pixbuf', 'new_from_data',
    $class, $real_data, $colorspace, $has_alpha, $bits_per_sample, $width, $height, $rowstride,
    undef, undef);
}

sub Gtk3::Gdk::Pixbuf::new_from_inline {
  my ($class, $data, $copy_pixels) = @_;
  $copy_pixels = Glib::TRUE unless defined $copy_pixels;
  return Glib::Object::Introspection->invoke (
    $_GDK_PIXBUF_BASENAME, 'Pixbuf', 'new_from_inline',
    $class, _unpack_unless_array_ref ($data), $copy_pixels);
}

sub Gtk3::Gdk::Pixbuf::new_from_xpm_data {
  my ($class, @data) = @_;
  my $real_data;
  {
    local $@;
    $real_data = (@data == 1 && eval { @{$data[0]} })
               ? $data[0]
               : \@data;
  }
  return Glib::Object::Introspection->invoke (
    $_GDK_PIXBUF_BASENAME, 'Pixbuf', 'new_from_xpm_data',
    $class, $real_data);
}

# Version check for the new annotations described in
# <https://bugzilla.gnome.org/show_bug.cgi?id=670372>.
my $HAVE_GDK_PIXBUF_2_31_2 = sub {
  return (Gtk3::Gdk::PIXBUF_MAJOR () == 2 && Gtk3::Gdk::PIXBUF_MINOR () > 31) ||
         (Gtk3::Gdk::PIXBUF_MAJOR () == 2 && Gtk3::Gdk::PIXBUF_MINOR () == 31 && Gtk3::Gdk::PIXBUF_MICRO () >= 2);
};

sub Gtk3::Gdk::Pixbuf::save {
  my ($pixbuf, $filename, $type, @rest) = @_;
  my ($keys, $values) = _unpack_keys_and_values (\@rest);
  if (not defined $keys) {
    croak ("Usage: \$pixbuf->save (\$filename, \$type, \\\@keys, \\\@values)\n",
           " -or-: \$pixbuf->save (\$filename, \$type, \$key1 => \$value1, ...)");
  }
  my $method = $HAVE_GDK_PIXBUF_2_31_2->() ? 'save' : 'savev';
  Glib::Object::Introspection->invoke (
    $_GDK_PIXBUF_BASENAME, 'Pixbuf', $method,
    $pixbuf, $filename, $type, $keys, $values);
}

sub Gtk3::Gdk::Pixbuf::save_to_buffer {
  my ($pixbuf, $type, @rest) = @_;
  my ($keys, $values) = _unpack_keys_and_values (\@rest);
  if (not defined $keys) {
    croak ("Usage: \$pixbuf->save_to_buffer (\$type, \\\@keys, \\\@values)\n",
           " -or-: \$pixbuf->save_to_buffer (\$type, \$key1 => \$value1, ...)");
  }
  my $method = $HAVE_GDK_PIXBUF_2_31_2->() ? 'save_to_buffer' : 'save_to_bufferv';
  my (undef, $buffer) =
    Glib::Object::Introspection->invoke (
      $_GDK_PIXBUF_BASENAME, 'Pixbuf', $method,
      $pixbuf, $type, $keys, $values);
  return $buffer;
}

sub Gtk3::Gdk::Pixbuf::save_to_callback {
  my ($pixbuf, $save_func, $user_data, $type, @rest) = @_;
  my ($keys, $values) = _unpack_keys_and_values (\@rest);
  if (not defined $keys) {
    croak ("Usage: \$pixbuf->save_to_callback (\$save_func, \$user_data, \$type, \\\@keys, \\\@values)\n",
           " -or-: \$pixbuf->save_to_callback (\$save_func, \$user_data, \$type, \$key1 => \$value1, ...)");
  }
  my $method = $HAVE_GDK_PIXBUF_2_31_2->() ? 'save_to_callback' : 'save_to_callbackv';
  Glib::Object::Introspection->invoke (
    $_GDK_PIXBUF_BASENAME, 'Pixbuf', $method,
    $pixbuf, $save_func, $user_data, $type, $keys, $values);
}

# Pango

sub Pango::Layout::set_text {
  return Glib::Object::Introspection->invoke (
    $_PANGO_BASENAME, 'Layout', 'set_text',
    @_ == 3 ? @_ : (@_[0,1], -1)); # wants length in bytes
}

# - Fixes ------------------------------------------------------------------- #

# Compatibility with perl 5.20 and non-dot locales.  Wrap all functions that
# might end up calling setlocale() such that POSIX::setlocale() is also called
# to ensure perl knows about the current locale.  See the discussion in
# <https://rt.perl.org/Public/Bug/Display.html?id=121930>,
# <https://rt.perl.org/Public/Bug/Display.html?id=121317>,
# <https://rt.perl.org/Public/Bug/Display.html?id=120723>.
if ($^V ge v5.20.0) {
  require POSIX;
  no strict 'refs';
  no warnings 'redefine';

  my $disable_setlocale = 0;
  *{'Gtk3::disable_setlocale'} = sub {
    $disable_setlocale = 1;
    Glib::Object::Introspection->invoke (
      $_GTK_BASENAME, undef, 'disable_setlocale', @_);
  };

  # These two already have overrides.
  foreach my $function (qw/Gtk3::init Gtk3::init_check/) {
    my $orig = \&{$function};
    *{$function} = sub {
      if (!$disable_setlocale) {
        POSIX::setlocale (POSIX::LC_ALL (), '');
      }
      $orig->(@_);
    };
  }

  foreach my $function (qw/init_with_args parse_args/) {
    *{'Gtk3::' . $function} = sub {
      if (!$disable_setlocale) {
        POSIX::setlocale (POSIX::LC_ALL (), '');
      }
      Glib::Object::Introspection->invoke (
        $_GTK_BASENAME, undef, $function, @_);
    };
  }
}

# - Helpers ----------------------------------------------------------------- #

sub _common_tree_model_new {
  my ($package, $class, @types) = @_;
  my $real_types;
  {
    local $@;
    $real_types = (@types == 1 && eval { @{$types[0]} })
                ? $types[0]
                : \@types;
  }
  return Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, $package, 'new',
    $class, $real_types);
}

sub _common_tree_model_set {
  my ($package, $model, $iter, @columns_and_values) = @_;
  my ($columns, $values) = _unpack_keys_and_values (\@columns_and_values);
  if (not defined $columns) {
    croak ("Usage: Gtk3::${package}::set (\$model, \$iter, \\\@columns, \\\@values)\n",
           " -or-: Gtk3::${package}::set (\$model, \$iter, \$column1 => \$value1, ...)");
  }
  my @wrapped_values = ();
  foreach my $i (0..$#{$columns}) {
    my $column_type = $model->get_column_type ($columns->[$i]);
    push @wrapped_values,
         Glib::Object::Introspection::GValueWrapper->new (
           $column_type, $values->[$i]);
  }
  Glib::Object::Introspection->invoke (
    $_GTK_BASENAME, $package, 'set',
    $model, $iter, $columns, \@wrapped_values);
}

sub _unpack_keys_and_values {
  my ($keys_and_values) = @_;
  my (@keys, @values);
  my $have_array_refs;
  {
    local $@;
    $have_array_refs =
      @$keys_and_values == 2 && eval { @{$keys_and_values->[0]} };
  }
  if ($have_array_refs) {
    @keys = @{$keys_and_values->[0]};
    @values = @{$keys_and_values->[1]};
  } elsif (@$keys_and_values % 2 == 0) {
    my %keys_to_vals = @$keys_and_values;
    @keys = keys %keys_to_vals;
    @values = values %keys_to_vals;
  } else {
    return ();
  }
  return (\@keys, \@values);
}

sub _unpack_unless_array_ref {
  my ($data) = @_;
  local $@;
  return eval { @{$data} }
    ? $data
    : [unpack 'C*', $data];
}

sub _rest_to_ref {
  my ($rest) = @_;
  local $@;
  if (scalar @$rest == 1 && eval { defined $rest->[0]->[0] }) {
    return $rest->[0];
  } else {
    return $rest;
  }
}

1;

__END__

# - Docs -------------------------------------------------------------------- #

=head1 NAME

Gtk3 - Perl interface to the 3.x series of the gtk+ toolkit

=head1 SYNOPSIS

  use Gtk3 -init;
  my $window = Gtk3::Window->new ('toplevel');
  my $button = Gtk3::Button->new ('Quit');
  $button->signal_connect (clicked => sub { Gtk3::main_quit });
  $window->add ($button);
  $window->show_all;
  Gtk3::main;

=head1 ABSTRACT

Perl bindings to the 3.x series of the gtk+ toolkit.  This module allows you to
write graphical user interfaces in a Perlish and object-oriented way, freeing
you from the casting and memory management in C, yet remaining very close in
spirit to original API.

=head1 DESCRIPTION

The Gtk3 module allows a Perl developer to use the gtk+ graphical user
interface library.  Find out more about gtk+ at L<http://www.gtk.org>.

The gtk+ reference manual is also a handy companion when writing Gtk3 programs
in Perl: L<http://developer.gnome.org/gtk3/stable/>.  The Perl bindings follow
the C API very closely, and the C reference documentation should be considered
the canonical source.

To discuss Gtk3 and ask questions join gtk-perl-list@gnome.org at
L<http://mail.gnome.org/mailman/listinfo/gtk-perl-list>.

Also have a look at the gtk2-perl website and sourceforge project page,
L<http://gtk2-perl.sourceforge.net>.

=head2 Porting from Gtk2 to Gtk3

The majority of the API has not changed, so as a first approximation you can
run C<< s/Gtk2/Gtk3/ >> on your application.  A big exception to this rule is
APIs that were deprecated in gtk+ 2.x -- these were all removed from gtk+ 3.0
and thus from L<Gtk3>.  The migration guide at
L<http://developer.gnome.org/gtk3/stable/migrating.html> describes what to use
instead.  Apart from this, here is a list of some other incompatible
differences between L<Gtk2> and L<Gtk3>:

=over

=item * The call syntax for class-static methods is now always
C<< Gtk3::Stock::lookup >> instead of C<< Gtk3::Stock->lookup >>.

=item * The %Gtk2::Gdk::Keysyms hash is gone; instead of C<<
Gtk2::Gdk::Keysyms{XYZ} >>, use C<< Gtk3::Gdk::KEY_XYZ >>.

=item * The Gtk2::Pango compatibility wrapper was not carried over; simply use
the namespace "Pango" everywhere.  It gets set up automatically when loading
L<Gtk3>.

=item * The types Gtk3::Allocation and Gtk3::Gdk::Rectangle are now aliases for
Cairo::RectangleInt, and as such they are represented as plain hashes with
keys 'width', 'height', 'x' and 'y'.

=item * Gtk3::Editable: Callbacks connected to the "insert-text" signal do not
have as many options anymore as they had in Gtk2.  Changes to arguments will
not be propagated to the next signal handler, and only the updated position can
and must be returned.

=item * Gtk3::Menu: The position callback passed to popup() does not receive x
and y parameters anymore.

=item * Gtk3::RadioAction: The constructor now follows the C API.

=item * Gtk3::TreeModel: iter_next() is now a method that is modifying the iter
directly, instead of returning a new one.  rows_reordered() and the
"rows-reordered" signal are currently unusable.

=item * Gtk3::TreeSelection: get_selected_rows() now returns two values: an
array ref containing the selected paths, and the model.  get_user_data() is not
available currently.

=item * Gtk3::TreeSortable: get_sort_column_id() has an additional boolean
return value.

=item * Gtk3::TreeStore, Gtk3::ListStore: reorder() is currently unusable.

=item * Gtk3::Gdk::Atom: The constructor new() is not provided anymore, and the
class function intern() must now be called as C<< Gtk3::Gdk::Atom::intern
(name, only_if_exists) >>.

=item * Implementations of Gtk3::TreeModel: Gtk3::TreeIter now has a
constructor called new() expecting C<< key => value >> pairs;
new_from_arrayref() does not exist anymore.  To access the contents of
Gtk3::TreeIter, use stamp(), user_data(), user_data2() and user_data3();
to_arrayref() does not exist anymore.  GET_ITER(), ITER_CHILDREN(),
ITER_NTH_CHILD() and ITER_PARENT() must return an additional boolean value.
ITER_NEXT() must modify the iter and return a boolean rather than return a new
iter.  GET_VALUE() must return the value wrapped with C<<
Glib::Object::Introspection::GValueWrapper->new >>.

=item * Implementations of Gtk3::CellLayout: GET_CELLS() now needs to return an
array ref instead of a list.

=back

Note also that Gtk3::CHECK_VERSION will always fail when passed 2.y.z, so if
you have any existing version checks in your code, you will most likely need to
remove them.

=head1 SEE ALSO

=over

=item L<Glib>

=item L<Glib::Object::Introspection>

=back

=head1 AUTHORS

=encoding utf8

=over

=item Torsten Schönfeld <kaffeetisch@gmx.de>

=back

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011-2013 by Torsten Schoenfeld <kaffeetisch@gmx.de>

This library is free software; you can redistribute it and/or modify it under
the terms of the GNU Library General Public License as published by the Free
Software Foundation; either version 2.1 of the License, or (at your option) any
later version.

=cut
