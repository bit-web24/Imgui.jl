# Load the module and generate the functions
module Imgui
  using CxxWrap
  @wrapmodule("../lib/libui.so", :DEMO)

  function __init__()
    @initcxx
  end
end

# Call demo_app function and show the app (with return value)
@show Imgui.demo_app()
