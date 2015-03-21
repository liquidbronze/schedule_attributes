class IceCube::Rule
  def ==(other)
    to_hash == other.try(:to_hash)
  end
end

class IceCube::Schedule
  def ==(other)
    to_hash == other.try(:to_hash)
  end
end
