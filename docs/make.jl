using Documenter, CacheSim

makedocs(
    sitename="CacheSim.jl",
    pages = [
        "index.md",
        "usage.md",
        "examples.md" 
    ]
)

deploydocs(
    repo = "github.com/paralab/CacheSim.jl.git",
)