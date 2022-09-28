#include <erl_nif.h>
#include <Cocoa/Cocoa.h>

static ERL_NIF_TERM bundleinfo_nif_info(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
    NSLog(@"bundleURL=%@", [[NSBundle mainBundle] bundleURL]);
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject: [[NSBundle mainBundle] infoDictionary]
                                            options: NSJSONWritingPrettyPrinted
                                            error: &error];

    if (!jsonData) {
        NSLog(@"Got an error: %@", error);
        return enif_make_atom(env, "error");
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return enif_make_string(env, [jsonString UTF8String], ERL_NIF_LATIN1);
    }
}

static ErlNifFunc nif_funcs[] =
{
    {"info", 0, bundleinfo_nif_info}
};

ERL_NIF_INIT(bundleinfo, nif_funcs, NULL, NULL, NULL, NULL)
