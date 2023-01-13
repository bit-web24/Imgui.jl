# using julia to run cmake commands with proper values

if length(ARGS) == 0
	using CxxWrap
	prefix_path = CxxWrap.prefix_path()
	if !isdir("build")
		mkdir("build")
	end
	run(`cmake -DCMAKE_PREFIX_PATH=$prefix_path . -Bbuild/`)
	run(`cmake --build build/`)
elseif length(ARGS) >=1
	if ARGS[1] == "clean"
		run(`rm build/ lib/ -rfd examples/imgui.ini`)
	end
end
