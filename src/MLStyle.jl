module MLStyle

export @match, Pattern, Case, Failed, failed, register_meta_pattern, pattern_matching, @case

include("Err.jl")
include("ADT.jl")
include("Match.jl")
include("MatchExt.jl")
using MLStyle.Err
using MLStyle.ADT
using MLStyle.Match
using MLStyle.MatchExt

end # module