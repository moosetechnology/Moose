
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
  1. Choose a method (not a test) in the model,
  2. Follow incoming invocations and try to find a test method
- **Example model**  
One can build a pharo model with a package (e.g. `Collections-Atomic`) and a test package (e.g. `Collections-Atomic-Tests`)
- **Expected result**  
Very simple exercise with method  `nextOrNil` that is directly invoked by test methods.
There are two implementations of `nextOrNil`, classes `LIFOQueue` and  `WaitfreeQueue`. They are invoked in 15 tests.
Because they are direct invocations, one can use a "Navigation query" or a visualization (e.g. "Navigation tree")

## Methods with a pragma/annotation

- **Goal**  
 Find all methods of some given package(s) that have a given pragma/annotation
- **Indication** 
  1. Find all `AnnotationType` in the model (for example `FamixStAnnotationType` for a model of Pharo code
  2. Restrict further to get one `AnnotationType` (for example on the name "example")
  3. Get all `AnnotationInstance`s
  4. get the `annotatedEntity`-ies of the instances
- **Example model**  
One can build a pharo model with a package (e.g. `Rubric`) and a pragma (e.g. `example`)
- **Expected result** At the time of this writing, there are 3 methods with the `example` pragma: `RubFloatingEditorBuilder>>exampleCommandLauncher` ; `RubFloatingEditorBuilder>>exampleEditableStringMorph` ; `RubTextAreaExamples>>nicolaiAttributeFix`

## Class instantiation

- **Goal**  
Find all instantiations of a class and its subclasses.
- **Indication** 
  1. Select a class
  2. Select its subclasses
  3. Collect their methods
  4. Select the constructor ones (*i.e.* new MyClass() in Java)
  5. Follow constructors incoming invocation
- **Example model**  
You can easily get a Java model using [VerveineJ](https://modularmoose.org/moose-wiki/Developers/Parsers/VerveineJ).
- **Concrete application**  
Try to determine all the widgets creation of a GUI

## Retrieve the REST services of a Java Spring application

- **Goal**  
Retrieve the rest services of a Java Spring application with the possible methods and parameters.
- **Indication**  
  1. Look for the annotation `@Path` in a Java Project
  2. Retrieve the classes annotated with the path annotation and the parameter of the path.
  3. Collect the methods of the classes
  4. Select the methods with a REST annotation (*e.g.*: `@GET`,  `@POST`)
  5. Determine the path for those methods using again the `@Path` annotation (but on methods this time)
- **Example model**  
You can easily get a Java model using [VerveineJ](https://modularmoose.org/moose-wiki/Developers/Parsers/VerveineJ)
