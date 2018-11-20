Class {
	#name : #ImportingContextTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #tests }
ImportingContextTest >> testAllDependentsOf [
	| res1 res2 |
	MooseImportingContext initialize.
	res1 := MooseImportingContext allDependentsOf: MooseImportingContext importingClass.
	self assert: res1 size equals: 2.
	self assert: (res1 includes: MooseImportingContext importingClass).
	res2 := MooseImportingContext allDependentsOf: MooseImportingContext importingImplicitVariable.
	self assert: res2 size equals: 4.
	self assert: (res2 includes: MooseImportingContext importingClass).
	self assert: (res2 includes: MooseImportingContext importingMethod).
	self assert: (res2 includes: MooseImportingContext importingImplicitVariable)
]

{ #category : #tests }
ImportingContextTest >> testShouldComputeTypeOfAttributes [
	| context |

	context :=MooseImportingContext new.
	self deny: (context shouldComputeTypeOfAttributes).
	context computeTypeOfAttributes.
	self assert: (context shouldComputeTypeOfAttributes).
]

{ #category : #tests }
ImportingContextTest >> testShouldImportAllTheRest [
	| context |

	context :=MooseImportingContext new.
	context importClassMethodInheritance.
	self deny: (context shouldImportMethodBody).
	self assert: (context shouldImportClass).
	self assert: (context shouldImport: context importingMethod).
	self assert: (context shouldImport: context importingInheritance).
]

{ #category : #tests }
ImportingContextTest >> testShouldImportClasses [
	| context |

	context :=MooseImportingContext new.
	context importClassMethodInheritance.
	self assert: (context shouldImport: context importingClass).
	self assert: (context shouldImportClass).
	self assert: (context shouldImport: context importingMethod).
	self assert: (context shouldImport: context importingInheritance).
]

{ #category : #tests }
ImportingContextTest >> testShouldImportClassesForInheritance [
	"when I extract inheritance I should also extract the dependents of inheritance, here class
	please see that this test is generic and that we can change the dependencies between 
	entities without breaking it"
	
	| context |
	context :=MooseImportingContext new.
	context importInheritance.
	(context class entityDependencies at: context class importingInheritance)
		do: [:each | self assert: (context shouldImport: each)]
]

{ #category : #tests }
ImportingContextTest >> testShouldImportClassesForMethod [
	| context |

	context := MooseImportingContext new.
	context importClassMethodInheritance.
	self assert: (context shouldImport: context importingClass).
	self assert: (context shouldImportClass).
	self assert: (context shouldImport: context importingMethod).
	self assert: (context shouldImport: context importingInheritance).
]

{ #category : #tests }
ImportingContextTest >> testShouldImportMethodBody [
	
	| context |
	context :=MooseImportingContext new.
	context importArgument.
	self assert: (context shouldImportMethodBody).
]

{ #category : #tests }
ImportingContextTest >> testShouldImportMethodBody2 [
	
	| context |
	context :=MooseImportingContext new.
	context importImplicitVariable.

	self assert: (context shouldImportMethodBody).
]

{ #category : #tests }
ImportingContextTest >> testShouldImportMethodBodyBasedOnMaximum [
	
	| context |
	context :=MooseImportingContext new.
	context importMaximum.
	
	self assert: (context shouldImportMethodBody).
]
