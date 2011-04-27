class Printer
  def self.to_csv(input)
  end
end

class Serializer

  attr_accessor :klass

  def klass
    @klass ||= load_class
  end

  def self.serialize(input)
    klass.serialize(input)
  end

  def load_class
    SerializerToCVS
  end


end

class SerializerToCSV
  def self.serialize(input)
    to_csv(input)
  end
end

class SerializerToXML
  def self.serialize(input)
    to_xml(input)
  end
end


class Bootstrap
  def self.setup
    ISerialize.impl = SerializeToCSV
  end
end

class Client
  def foobar
    ISerialize.serialize(nil)
  end
end

class ISerialize
  @@impl

  def self.impl=(klass)
    @@impl=klass
  end

  def self.serialize(input)
    @@impl.serialize(input)
  end
end

class SerializeToCSV
  def self.serialize(input)
    puts "CSV!"
  end
end

class SerializeToJSON
  def self.serialize(input)
    puts "JSON!"
  end
end