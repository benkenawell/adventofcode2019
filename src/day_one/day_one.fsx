open System.IO

let fuel mass =
    let needed = mass / 3 - 2
    match needed with
        | x when x > 0 -> x
        | _ -> 0

let rec fuelWeight acc x =
    match x with
        | y when y <= 0 -> acc
        | _ -> fuelWeight (acc + x) (fuel x)

let sumFuel = Array.fold (fun acc ele -> acc + ele) 0

let part1Test = Array.map fuel [| 12; 14; 1969; 100756 |]
let part1 = 
    File.ReadAllLines("input.txt")
    |> Array.map (fuel << int)
    |> sumFuel
let part2Test = Array.map ((fuelWeight 0) << fuel) [| 12; 14; 1969; 100756 |]
let part2 = 
    File.ReadAllLines("input.txt")
    |> Array.map ((fuelWeight 0) << fuel << int)
    |> sumFuel


printfn "%A" part1
printfn "%A" part2