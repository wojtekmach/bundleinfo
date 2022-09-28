#include <erl_nif.h>
#include <Cocoa/Cocoa.h>

static ERL_NIF_TERM bundleinfo_nif_info(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
    printf("bundleURL=%s\n", [[NSString stringWithFormat:@"%@", [[NSBundle mainBundle] bundleURL]] UTF8String]);
    printf("infoDictionary=%s\n", [[NSString stringWithFormat:@"%@", [[NSBundle mainBundle] infoDictionary]] UTF8String]);
    return enif_make_atom(env, "ok");
}

static ErlNifFunc nif_funcs[] =
{
    {"info", 0, bundleinfo_nif_info}
};

ERL_NIF_INIT(bundleinfo, nif_funcs, NULL, NULL, NULL, NULL)
