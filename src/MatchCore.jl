# This file is automatically generated by MLStyle Boostrap Tools.

module MatchCore
using MLStyle
using MLStyle.Toolz.List
using MLStyle.Err
using MLStyle.Render
export Failed, failed
struct Failed
end
const failed = Failed()
export Qualifier
Qualifier = Function
export internal, invasive, share_with, share_through
internal = ((my_mod, umod)->begin
            my_mod === umod
        end)
invasive = ((my_mod, umod)->begin
            true
        end)
share_with(ms::Set{Module}) = begin
        (_, umod)->begin
                umod in ms
            end
    end
export qualifier_test
function qualifier_test(qualifiers::Set{Qualifier}, use_mod, def_mod)
    any(qualifiers) do q
        q(def_mod, use_mod)
    end
end
export PDesc
struct PDesc
    predicate::Function
    rewrite::Function
    qualifiers::Set{Qualifier}
end
PDesc(; predicate, rewrite, qualifiers) = begin
        PDesc(predicate, rewrite, qualifiers)
    end
const PATTERNS = Vector{Tuple{Module, PDesc}}()
export register_pattern
function register_pattern(pdesc::PDesc, defmod::Module)
    push!(PATTERNS, (defmod, pdesc))
end
function get_pattern(case, use_mod::Module)
    for (def_mod, desc) = PATTERNS
        if qualifier_test(desc.qualifiers, use_mod, def_mod) && desc.predicate(case)
            return desc.rewrite
        end
    end
end
const INTERNAL_COUNTER = Dict{Module, Int}()
function remove_module_patterns(mod::Module)
    delete!(INTERNAL_COUNTER, mod)
end
function get_name_of_module(m::Module)::String
    string(m)
end
export mangle
function mangle(mod::Module)
    get!(INTERNAL_COUNTER, mod) do 
            0
        end |> (id->begin
                INTERNAL_COUNTER[mod] = id + 1
                mod_name = get_name_of_module(mod)
                gensym("$(mod_name) $(id)")
            end)
end
export gen_match, @match
begin
    macro match(target, cbl)
        gen_match(target, cbl, __source__, __module__) |> esc
    end
end
function gen_match(target, cbl, init_loc::LineNumberNode, mod::Module)
    branches = begin
            begin
                let _mangled_sym_420 = cbl
                    begin
                        begin
                            _mangled_sym_419 = begin
                                    function _mangled_sym_424(_mangled_sym_421::Expr)
                                        nothing
                                        Expr
                                        begin
                                            let (_mangled_sym_422, _mangled_sym_423) = ((_mangled_sym_421).head, (_mangled_sym_421).args)
                                                begin
                                                    if (===)(_mangled_sym_422, :block)
                                                        function _mangled_sym_426(_mangled_sym_425::(AbstractArray){_mangled_sym_427, 1}) where _mangled_sym_427
                                                            nothing
                                                            begin
                                                                if (length)(_mangled_sym_425) >= 0
                                                                    _mangled_sym_428 = view(_mangled_sym_425, 1:(length)(_mangled_sym_425) - 0)
                                                                    begin
                                                                        let branches = _mangled_sym_428
                                                                            begin
                                                                                _mangled_sym_430 = true
                                                                                for _mangled_sym_429 = _mangled_sym_428
                                                                                    if begin
                                                                                                _mangled_sym_443 = begin
                                                                                                        function _mangled_sym_434(_mangled_sym_431::Expr)
                                                                                                            nothing
                                                                                                            Expr
                                                                                                            begin
                                                                                                                let (_mangled_sym_432, _mangled_sym_433) = ((_mangled_sym_431).head, (_mangled_sym_431).args)
                                                                                                                    begin
                                                                                                                        if (===)(_mangled_sym_432, :call)
                                                                                                                            function _mangled_sym_436(_mangled_sym_435::(AbstractArray){_mangled_sym_437, 1}) where _mangled_sym_437
                                                                                                                                nothing
                                                                                                                                begin
                                                                                                                                    if (length)(_mangled_sym_435) === 3
                                                                                                                                        _mangled_sym_438 = _mangled_sym_435[1]
                                                                                                                                        begin
                                                                                                                                            if (===)(_mangled_sym_438, :(=>))
                                                                                                                                                _mangled_sym_439 = _mangled_sym_435[2]
                                                                                                                                                begin
                                                                                                                                                    let a = _mangled_sym_439
                                                                                                                                                        begin
                                                                                                                                                            _mangled_sym_440 = _mangled_sym_435[3]
                                                                                                                                                            begin
                                                                                                                                                                let b = _mangled_sym_440
                                                                                                                                                                    nothing
                                                                                                                                                                end
                                                                                                                                                            end
                                                                                                                                                        end
                                                                                                                                                    end
                                                                                                                                                end
                                                                                                                                            else
                                                                                                                                                (MLStyle.MatchCore).failed
                                                                                                                                            end
                                                                                                                                        end
                                                                                                                                    else
                                                                                                                                        (MLStyle.MatchCore).failed
                                                                                                                                    end
                                                                                                                                end
                                                                                                                            end
                                                                                                                            function _mangled_sym_436(_)
                                                                                                                                nothing
                                                                                                                                (MLStyle.MatchCore).failed
                                                                                                                            end
                                                                                                                            _mangled_sym_436(_mangled_sym_433)
                                                                                                                        else
                                                                                                                            (MLStyle.MatchCore).failed
                                                                                                                        end
                                                                                                                    end
                                                                                                                end
                                                                                                            end
                                                                                                        end
                                                                                                        function _mangled_sym_434(_mangled_sym_431)
                                                                                                            nothing
                                                                                                            (MLStyle.MatchCore).failed
                                                                                                        end
                                                                                                        _mangled_sym_434(_mangled_sym_429)
                                                                                                    end
                                                                                                if _mangled_sym_443 === (MLStyle.MatchCore).failed
                                                                                                    function _mangled_sym_442(_mangled_sym_441::LineNumberNode)
                                                                                                        nothing
                                                                                                        LineNumberNode
                                                                                                        nothing
                                                                                                    end
                                                                                                    function _mangled_sym_442(_mangled_sym_441)
                                                                                                        nothing
                                                                                                        (MLStyle.MatchCore).failed
                                                                                                    end
                                                                                                    _mangled_sym_442(_mangled_sym_429)
                                                                                                else
                                                                                                    _mangled_sym_443
                                                                                                end
                                                                                            end !== nothing
                                                                                        _mangled_sym_430 = false
                                                                                        break
                                                                                    end
                                                                                end
                                                                                if _mangled_sym_430
                                                                                    branches
                                                                                else
                                                                                    (MLStyle.MatchCore).failed
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                else
                                                                    (MLStyle.MatchCore).failed
                                                                end
                                                            end
                                                        end
                                                        function _mangled_sym_426(_)
                                                            nothing
                                                            (MLStyle.MatchCore).failed
                                                        end
                                                        _mangled_sym_426(_mangled_sym_423)
                                                    else
                                                        (MLStyle.MatchCore).failed
                                                    end
                                                end
                                            end
                                        end
                                    end
                                    function _mangled_sym_424(_mangled_sym_421)
                                        nothing
                                        (MLStyle.MatchCore).failed
                                    end
                                    _mangled_sym_424(_mangled_sym_420)
                                end
                            if _mangled_sym_419 === (MLStyle.MatchCore).failed
                                begin
                                    begin
                                        _mangled_sym_419 = throw(SyntaxError("Malformed syntax, expect `begin a => b; ... end` as match's branches., at " * string(init_loc)))
                                        if _mangled_sym_419 === (MLStyle.MatchCore).failed
                                            begin
                                                begin
                                                    (throw)((InternalException)("Non-exhaustive pattern found, at #= /home/redbq/github/MLStyle.jl/bootstrap/MatchCore.jl:124 =#!"))
                                                end
                                            end
                                        else
                                            _mangled_sym_419
                                        end
                                    end
                                end
                            else
                                _mangled_sym_419
                            end
                        end
                    end
                end
            end
        end
    loc = init_loc
    branches_located = map(branches) do each
                begin
                    begin
                        let _mangled_sym_445 = each
                            begin
                                begin
                                    _mangled_sym_444 = begin
                                            function _mangled_sym_451(_mangled_sym_448::Expr)
                                                nothing
                                                Expr
                                                begin
                                                    let (_mangled_sym_449, _mangled_sym_450) = ((_mangled_sym_448).head, (_mangled_sym_448).args)
                                                        begin
                                                            if (===)(_mangled_sym_449, :call)
                                                                function _mangled_sym_453(_mangled_sym_452::(AbstractArray){_mangled_sym_454, 1}) where _mangled_sym_454
                                                                    nothing
                                                                    begin
                                                                        if (length)(_mangled_sym_452) === 3
                                                                            _mangled_sym_455 = _mangled_sym_452[1]
                                                                            begin
                                                                                if (===)(_mangled_sym_455, :(=>))
                                                                                    _mangled_sym_456 = _mangled_sym_452[2]
                                                                                    begin
                                                                                        let pattern = _mangled_sym_456
                                                                                            begin
                                                                                                _mangled_sym_457 = _mangled_sym_452[3]
                                                                                                begin
                                                                                                    let body = _mangled_sym_457
                                                                                                        (pattern, body, loc)
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                else
                                                                                    (MLStyle.MatchCore).failed
                                                                                end
                                                                            end
                                                                        else
                                                                            (MLStyle.MatchCore).failed
                                                                        end
                                                                    end
                                                                end
                                                                function _mangled_sym_453(_)
                                                                    nothing
                                                                    (MLStyle.MatchCore).failed
                                                                end
                                                                _mangled_sym_453(_mangled_sym_450)
                                                            else
                                                                (MLStyle.MatchCore).failed
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                            function _mangled_sym_451(_mangled_sym_448)
                                                nothing
                                                (MLStyle.MatchCore).failed
                                            end
                                            _mangled_sym_451(_mangled_sym_445)
                                        end
                                    if _mangled_sym_444 === (MLStyle.MatchCore).failed
                                        begin
                                            begin
                                                _mangled_sym_444 = begin
                                                        function _mangled_sym_447(_mangled_sym_446::LineNumberNode)
                                                            nothing
                                                            LineNumberNode
                                                            begin
                                                                let curloc = _mangled_sym_446
                                                                    begin
                                                                        loc = curloc
                                                                        nothing
                                                                    end
                                                                end
                                                            end
                                                        end
                                                        function _mangled_sym_447(_mangled_sym_446)
                                                            nothing
                                                            (MLStyle.MatchCore).failed
                                                        end
                                                        _mangled_sym_447(_mangled_sym_445)
                                                    end
                                                if _mangled_sym_444 === (MLStyle.MatchCore).failed
                                                    begin
                                                        begin
                                                            _mangled_sym_444 = throw(SyntaxError("Malformed ast template, should be formed as `a => b`, at " * string(last_lnode) * "."))
                                                            if _mangled_sym_444 === (MLStyle.MatchCore).failed
                                                                begin
                                                                    begin
                                                                        (throw)((InternalException)("Non-exhaustive pattern found, at #= /home/redbq/github/MLStyle.jl/bootstrap/MatchCore.jl:132 =#!"))
                                                                    end
                                                                end
                                                            else
                                                                _mangled_sym_444
                                                            end
                                                        end
                                                    end
                                                else
                                                    _mangled_sym_444
                                                end
                                            end
                                        end
                                    else
                                        _mangled_sym_444
                                    end
                                end
                            end
                        end
                    end
                end
            end |> (xs->begin
                    filter((x->begin
                                x !== nothing
                            end), xs)
                end)
    final = let loc_str = string(init_loc), exc_throw = Expr(:call, InternalException, "Non-exhaustive pattern found, at " * loc_str * "!")
            @format [init_loc, throw, exc_throw] quote
                    
                    begin
                        init_loc
                        throw(exc_throw)
                    end
                end
        end
    result = mangle(mod)
    tag_sym = mangle(mod)
    foldr(branches_located, init=final) do (pattern, body, loc), last
            expr = (mk_pattern(tag_sym, pattern, mod))(body)
            @format [result, expr, loc, MatchCore, last] quote
                    
                    begin
                        loc
                        result = expr
                        if result === $MatchCore.failed
                            last
                        else
                            result
                        end
                    end
                end
        end |> (main_logic->begin
                @format [tag_sym, target, main_logic] quote
                        
                        begin
                            let tag_sym = target
                                main_logic
                            end
                        end
                    end
            end)
end
export mk_pattern
function mk_pattern(tag_sym::Symbol, case::Any, mod::Module)
    rewrite = get_pattern(case, mod)
    if rewrite !== nothing
        return rewrite(tag_sym, case, mod)
    end
    case = string(case)
    throw $ PatternUnsolvedException("invalid usage or unknown case $(case)")
end
end