# using julia to run cmake commands with proper values
using CxxWrap

prefix_path = CxxWrap.prefix_path()
run(`cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$prefix_path ./`)
run(`cmake --build . --config Release`)
