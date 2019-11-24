require "erb"

class View
  attr_reader :template, :locals

  def initialize(template, **locals)
    @template = template
    @locals   = locals
  end

  def render
    # make sure we don't fuck up the original / real binding
    binding_with_locals = binding.dup

    # add all the locals to the binding we are rendering with
    locals.each do |name, value|
      binding_with_locals.local_variable_set(name, value)
    end

    # trim_mode: "<>" === trim extra newlines around interpolation tags
    # Couldn't get it to work with Ruby 2.5??
    # looks like trim_mode used this way (keyword arg) needs Ruby 2.6
    #
    # Also, Using 2.5 I had to load the template from a file - it
    # did not like the syntax below (again, works with 2.6)
    ERB.new(<<~ERB, trim_mode: '<>').result(binding_with_locals)
    Bank Balances:

    <% users.each do |user| %>
      - <%= user.name %>:  <%= number_to_currency(user.amount) %>
    <% end %>

    Grand total: <%= number_to_currency users.sum(&:amount) %>
    ERB

  end

  private
  # Helpers - in the real world, we would set these up inside modules
  # then mix those into our views; but for test purposes, this is sufficient

  def number_to_currency(n)
    "$%.2f" % [n/100.0]
  end
end