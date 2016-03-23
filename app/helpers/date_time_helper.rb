module DateTimeHelper
  def convert() date
    somedate = DateTime.new(date["start(1i)"],
                            date["start(2i)"],
                            date["start(3i)"],
                            date["start(4i)"],
                            date["start(5i)"])
    return somedate
  end
end
