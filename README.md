# Ben Kenawell's Advent of Code 2019

This year I am taking this opportunity to learn more about the functional programming paradigm in a language that provides functional utilities, like currying and closures, out of the gate and enforces the functional paradigm by disallowing many other approaches.  The language I am using to learn more about functional programming is `Purescript`.  It has been pitched to me (by the internet at large and [r/functionalprogramming](https://www.reddit.com/r/functionalprogramming)) as a slightly lighter version of Haskell.  Haskell appears to be the gold standard for pure functional languages, and has overwhelmed me a bit with all of it's notation.  On the other hand, Purescript appears to be very similar to Haskell in look and feel.  Since I work with node, npm, and typescript on a daily basis, I know a lot of the tooling around node and javascript libraries.  So Purescript seems to be a good compromise between functional programming concepts, and alread knowing the tooling for installing new packages (which I have alrady installed several in the first day).

Although I have begun to use functional concepts in my day to day programming, it is in Typescript.  So starting Purescript has still taken me a couple days to get a project up and running.  I have been learning terminology, skimming past other terminology, and learning to read type signatures, which seems paramount to a working understanding of the funcitonal paradigm.  All this learning, and not enough time in the day, leaves me a few days behind the advent calendar.  I expect this will be true the entire season, but I have learned enough in the first day (which actually took me several days) to make this trade off feel worth it moving forward.

---

### Dec 11 update

After hitting a wall with purescript typings, I have decided to move to FSharp.  Here are a couple of reasons I think this is a good transition:
- It has all the clout of the .NET environment
- it is statically typed, but does type inferences.  I don't have to worry about mistyping functions (which I realized I did a few times, especially with the `do` keyword in purescript).  But I still get some static type checking
- better documentation.  Maybe this is a matter of preference/what I'm used to, but I found the [F# language reference](https://docs.microsoft.com/en-us/dotnet/fsharp/language-reference/) to be much more thorough than [purescript's](https://github.com/purescript/documentation/blob/master/language/Syntax.md).  I found module references had actual example too, in addition to type signatures.  Type signatures are great once you get to read them, especially in Purescript, but without examples when I couldn't figure out a type signature there was no help.  Import are a tad more obvious to me in F# as well, but I was getting better at them in purescript (so I'll leave this as a what-I-know bias). Chances are better googling will give me quicker answers too, since more people use F#.

If you have better tutorials or documentation for purescript, (or even Haskell, really. I might get there someday) I'd love to hear it!  Drop it as an issue maybe?  Or fork this repo and PR it into the README?  Or just post it to [r/functionalprogramming](https://www.reddit.com/r/functionalprogramming)

My plan is to use the `fsharpi`, or the interpretive shell, found in the fsharp docker container.  I don't need a whole F# project for advent of code. Although I don't know if that will affect my ability to pull out functions I use everyday into a different module (like I began with purescript). 

## Learnings

If I find time I may go more in depth about what each of these learning are, but it will just start with a list of learnings

### Day 1

- Type signatures, especially as it relates to the documentation found on [Pursuit](https://pursuit.purescript.org)
- importing functions
- logging out
- debug tracing, and how it differs from log output
- Effect Monad, although I don't fully understand how it works, I understand it has to do with side effects
- the `$` operator (I believe it's apply?)
  - I want to understand this operator better though, because it clearly isn't function composition.  But I can't find a function composition operator anywhere in the language.

### Day 2

- Type signatures are hard!  And I don't understand syntatic sugar like `do`
- or it might be I don't understand `bind`, and what it has to do with Monads
- Maybe maybe Maybe maybe Maybe.... How do I effectively work with this type?  It's killing me
- I actually did get me code running for today, it's just not right.  And after days fixing my types and type signatures, I'm giving up.  I'm so many days behind and it's taking too much of my time outside of work.  I don't want to be behind a computer this long!

#### Day 2 Part 2

I feel pretty good about how I was able to leverage the code I did from part 1.  However, I dislike using looping like I have done.  This is not exactly a functional way to solve this problem, and I'm not even breaking out of the loop when I find the right answer.  However, it works and for now that is going to be enough.