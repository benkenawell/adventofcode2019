open System.IO

let performOp code x y = 
    match code with
        | 1 -> x + y
        | 2 -> x * y
        | _ -> 0

let readCode arr: int[] =
    let rec readOp (code: int[]) idx = 
        // printfn "code %A %A" code.[idx] idx
        match code.[idx] with
            | 99 -> code
            | _ -> Array.set code code.[idx + 3] (performOp code.[idx] code.[code.[idx+1]] code.[code.[idx+2]])
                   readOp code (idx + 4)
    readOp arr 0

let sillyReplace input =
    Array.set input 1 12
    Array.set input 2 2
    input

let seriousReplace noun verb input =
    Array.set input 1 noun
    Array.set input 2 verb
    input

let test1 = readCode [|1;0;0;0;99|] 
printfn "%A" test1

let test4 =
    "1,1,1,4,99,5,6,0,99".Split(",")
    |> Array.map int
    |> readCode
printfn "%A" test4

let part1 =
    File.ReadAllText("input.txt").Split(',')
    |> Array.map int
    |> sillyReplace
    |> readCode
    |> printfn "%A"

let part2 =
    for noun in 0..99 do
        for verb in 0..99 do
            let test = 
                File.ReadAllText("input.txt").Split(',')
                |> Array.map int
                |> seriousReplace noun verb
                |> readCode
            if test.[0] = 19690720 then
               printfn "%A" test 

printfn "%A" part2