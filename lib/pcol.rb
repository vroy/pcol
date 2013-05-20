require "colorize"

module ColorRotator

  PCOL_COLORS = [:red, :green, :yellow, :blue, :light_red, :light_green, :light_blue].to_enum

  def self.next(color=nil)
    begin
      color = PCOL_COLORS.next
    rescue
      PCOL_COLORS.rewind
      color = PCOL_COLORS.next
    end
  end

end

module Kernel

  def pcol(obj, color=nil)
    puts "#{obj.inspect}".send( color || ColorRotator.next(color) )
  end

end
