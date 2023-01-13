# Load the module and generate the functions
module ImGui
  using CxxWrap
  @wrapmodule("../lib/libui.so", :IMJULIA)

  function __init__()
    @initcxx
  end
end

# Call demo_app function and show the app (with return value)
ImGui.demo_app()
