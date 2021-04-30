
# Usage scenarios for Moose

These scenarios can be used as exercises to get familiar with Moose.

Ideally, a scenario:
- describes in a short paragraph the goal to achieve
- gives indication on how to get a result
- provides a model exemple (or explains how to get one)
- gives the expected result (if an exemple model is provided)

## Tested methods

- **Goal**  
Find whether a given method seems (static analysis) to be tested
- **Indications**  
(1) Choose a method (not a test) in the model, (2) Follow incoming invocations and try to find a test method
- **Example model**  
One can build a pharo model with a package (e.g. `Collections-Atomic`) and a test package (e.g. `Collections-Atomic-Tests`)
- **Expected result**  
Very simple exercise with method  `nextOrNil` that is directly invoked by test methods.
There are two implementations of `nextOrNil`, classes `LIFOQueue` and  `WaitfreeQueue`. They are invoked in 15 tests.
Because they are direct invocations, one can use a "Navigation query" or a visualization (e.g. "Navigation tree")

## Methods with a pragma

- **Goal**  
 Find all methods of some given package(s) that have a given pragma
- **Example model**  
One can build a pharo model with a package (e.g. `Rubric`) and a pragma (e.g. `example`)
- **Expected result** At the time of this writing, there are 3 methods with the `example` pragma: `RubFloatingEditorBuilder>>exampleCommandLauncher` ; `RubFloatingEditorBuilder>>exampleEditableStringMorph` ; `RubTextAreaExamples>>nicolaiAttributeFix`
