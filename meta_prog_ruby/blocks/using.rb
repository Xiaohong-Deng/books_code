module Kernel
  # the purpose of 'using' is to ensure that no matter Exception is raised
  # or not, the resource will be disposed to avoid security leak
  def using(resource)
    begin
      # using must take a block otherwise raise exception
      yield
    ensure
      # using assume resource has a method called dispose
      resource.dispose
    end
  end
end
