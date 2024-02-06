module SioyekTranslateChatGPT
    # Precompilation: https://discourse.julialang.org/t/how-do-you-make-standalone-programs-in-julia/105218/17

    using PrecompileTools

    const DRIVER_FILE = @__FILE__
    function __init__()
        if abspath(PROGRAM_FILE) == DRIVER_FILE
            main(ARGS)
        end
    end

    function main(ARGS ::Vector{String})
        sioyekPath = ARGS[1]
        toRun = Cmd([sioyekPath, "--execute-command", "set_status_string", "--execute-command-data", "a\nb\nc"])
        run(toRun)
    end
    
    @setup_workload begin
        precompile_args = ["randomPath"]
        @compile_workload begin
            main(precompile_args)
        end
    end

end