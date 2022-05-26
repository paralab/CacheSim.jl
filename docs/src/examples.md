# Examples

## Basics

This is a simple example in which a 3-level cache is built directly and a few accesses are performed.

```
using CacheSim

# Build each level starting from the last
L3 = build_cache("L3", 64, 9216, 16, write_back=1, write_allocate=1);
L2 = build_cache("L2", 64, 512, 8, write_back=1, write_allocate=1, load_from=L3, store_to=L3);
L1 = build_cache("L1", 64, 64, 8, write_back=1, write_allocate=1, load_from=L2, store_to=L2);

# Simulate a few accesses
cache_load(L1, 4321, 8);  # miss in all levels
cache_store(L1, 512, 128);# miss in all levels (using write_allocate)
cache_load(L1, 512, 16);  # hit in L1

print_stats(L1);
```

## Using a cache definition file

Similar to above, but the cache info is read from a file. The file is named "cachedef" and contains the following text:
```
3
name=L1,sets=64,ways=8,cl_size=64,replacement_policy_id=1,write_back=1,write_allocate=1,load_from=L2,store_to=L2
name=L2,sets=512,ways=8,cl_size=64,replacement_policy_id=1,write_back=1,write_allocate=1,load_from=L3,store_to=L3
name=L3,sets=9216,ways=16,cl_size=64,replacement_policy_id=1,write_back=1,write_allocate=1
```
And the Julia script is:
```
using CacheSim

# Build cache using definition from the file cachedef
L1 = get_cacheSim_from_file("cachedef");

# Simulate a few accesses
cache_load(L1, 4321, 8);  # miss in all levels
cache_store(L1, 512, 128);# miss in all levels (using write_allocate)
cache_load(L1, 512, 16);  # hit in L1

print_stats(L1);
```