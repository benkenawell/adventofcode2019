# Ben Kenawell's Advent of Code 2019

This year I am taking this opportunity to learn more about the functional programming paradigm in a language that provides functional utilities, like currying and closures, out of the gate and enforces the functional paradigm by disallowing many other approaches.  The language I am using to learn more about functional programming is `Purescript`.  It has been pitched to me (by the internet at large and [r/functionalprogramming](https://www.reddit.com/r/functionalprogramming)) as a slightly lighter version of Haskell.  Haskell appears to be the gold standard for pure functional languages, and has overwhelmed me a bit with all of it's notation.  On the other hand, Purescript appears to be very similar to Haskell in look and feel.  Since I work with node, npm, and typescript on a daily basis, I know a lot of the tooling around node and javascript libraries.  So Purescript seems to be a good compromise between functional programming concepts, and alread knowing the tooling for installing new packages (which I have alrady installed several in the first day).

Although I have begun to use functional concepts in my day to day programming, it is in Typescript.  So starting Purescript has still taken me a couple days to get a project up and running.  I have been learning terminology, skimming past other terminology, and learning to read type signatures, which seems paramount to a working understanding of the funcitonal paradigm.  All this learning, and not enough time in the day, leaves me a few days behind the advent calendar.  I expect this will be true the entire season, but I have learned enough in the first day (which actually took me several days) to make this trade off feel worth it moving forward.

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