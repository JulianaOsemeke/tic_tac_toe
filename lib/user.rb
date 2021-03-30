# frozen_string_literal: true

# Class to make users
class User
  attr_reader :name

  attr_writer :marker

  def initialize(name, marker = 'X')
    name += "\'s" if name[-1] != 's' && !name.empty?
    @name = name
    @marker = marker
  end

  def mark
    @marker
  end
end
