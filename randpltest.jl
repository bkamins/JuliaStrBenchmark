using Compat
using Strs

x = read("randpl.txt", String);

function chars(s)
    i = 0
    for c in s
        i += 1
    end
    i
end

function spaces(s)
    i = 0
    for c in s
        i += c == ' ' ? 0 : 1
    end
    i
end

for s in Any[x, Str(x)]
    println("\nTesting: ", typeof(x))
    @show @time chars(s) # faster on Strs.jl
    @show @time chars(s) # faster on Strs.jl
    @show @time spaces(s) # faster on Strs.jl
    @show @time spaces(s) # faster on Strs.jl
    @show @time split(s, [' ','\n',',','.'])[1] # slower on Strs.jl
    @show @time (ss = split(s, [' ','\n',',','.']))[1] # slower on Strs.jl
    @show @time uppercasefirst.(ss)[1] # slower on Strs.jl
    @show @time uppercasefirst.(ss)[1] # slower on Strs.jl
    @show @time uppercase.(ss)[1] # faster on Strs.jl
    @show @time uppercase.(ss)[1] # faster on Strs.jl
    @show @time join(ss,",")[1] # fails on Strs.jl
    @show @time join(ss,",")[1] # fails on Strs.jl
    @show @time hash.(ss)[1] # slower on Strs.jl
    @show @time hash.(ss)[1] # slower on Strs.jl
end
