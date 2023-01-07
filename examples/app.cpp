#include "jlcxx/jlcxx.hpp"

int demo_app();

JLCXX_MODULE DEMO(jlcxx::Module& mod)
{
        mod.method("demo_app", &demo_app);
}
