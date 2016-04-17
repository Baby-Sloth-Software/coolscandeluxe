class Product < ActiveRecord::Base

  def self.find_product_by_range(crgb_hash)
    green = {c: (3800..4300), r: (800..1200), g: (1900..2100), b: (1000..1300)}
    red = {c: (4200..4800), r: (2500..2900), g: (700..1200), b: (700..1200)}
    blue = {c: (7900..8400), r: (1200..1600), g: (2800..3200), b: (3400..4200)}

    rcolor = 'green' if green[:c] === crgb_hash[:c_value] && green[:r] === crgb_hash[:r_value] && green[:g] === crgb_hash[:g_value] && green[:b] === crgb_hash[:b_value]
    rcolor = 'red' if red[:c] === crgb_hash[:c_value] && red[:r] === crgb_hash[:r_value] && red[:g] === crgb_hash[:g_value] && red[:b] === crgb_hash[:b_value]
    rcolor = 'blue' if blue[:c] === crgb_hash[:c_value] && blue[:r] === crgb_hash[:r_value] && blue[:g] === crgb_hash[:g_value] && blue[:b] === crgb_hash[:b_value]
    rcolor ||= ''
    rcolor
  end

end
