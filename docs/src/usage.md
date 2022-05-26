# How to use CacheSim

These are the exported functions and structs. Most common usage will be limited to these.

### Creating a Cache

Begin by creating `Cache` objects. This can be done through a cache definition file using `get_cacheSim_from_file` or directly with the `build_cache` function. When using the file, the entire hierarchy is constructed and the first level Cache is returned. This first level is the one used for all cache operations and it is linked to the other levels automatically. When building cache directly, begin by building the last level and build in order till the first level. Previous levels will be linked by passing them as the `load_from` and `store_to` arguments in `build_cache`. See an example if this isn't clear.

### Simulate Accesses

After creating a cache, use the `cache_load` and `cache_store` functions to simulate memory accesses. Pass the first level cache as an argument along with the starting address and number of bytes.

TODO: I want to have an option to return info about the access including hit/miss and set number for each level involved. This would allow external processing of the access stats.

### Output Stats

At any point the functions `print_stats` or `get_stats_string` will produce a summary of the loads, stores, hits and misses for each cache level.

```@index
Pages = ["usage.md"]
```

```@docs
Cache
cache_load(cache::Cache, addr::Int, bytes::Int)
cache_store(cache::Cache, addr::Int, bytes::Int)
get_cacheSim_from_file(cache_file::String)
build_cache(name::String, cl_size::Int, sets::Int, ways::Int; [kwargs])
print_stats(cache::Cache)
get_stats_string(cache::Cache)
```
