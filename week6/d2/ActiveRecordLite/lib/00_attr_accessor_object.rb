class AttrAccessorObject
  def self.my_attr_accessor(*names)
    define_method
  end
end
