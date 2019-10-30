Class {
	#name : #FamixJavaScopingEntity,
	#superclass : #FamixJavaContainerEntity,
	#traits : 'FamixTGlobalVariableScope + FamixTScopingEntity',
	#classTraits : 'FamixTGlobalVariableScope classTrait + FamixTScopingEntity classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaScopingEntity class >> annotation [

	<FMClass: #ScopingEntity super: #FamixJavaContainerEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'Famix-Extensions-metrics' }
FamixJavaScopingEntity >> abstractness [
	"Abstractness is the ratio between the number of abstract classes and the total number of classes in a package, in the range [0, 1]. 0 means the package is fully concrete, 1 it is fully abstract."
	
	self subclassResponsibility
]

{ #category : #'Famix-Extensions-metrics' }
FamixJavaScopingEntity >> afferentCoupling [
	"Afferent coupling for a module is the number of modules that depend upon this module"
	
	^ self subclassResponsibility
]

{ #category : #'Famix-Extensions' }
FamixJavaScopingEntity >> allClasses [
	| result |
	result := OrderedCollection new.
	self withAllChildScopesDo: [ :each | result addAll: each classes ].
	^ result
]

{ #category : #'Famix-Extensions' }
FamixJavaScopingEntity >> allClassesGroup [
	<navigation: 'All classes'>
	^ FAMIXTypeGroup withAll: self allClasses withDescription: 'All classes from ', self printString
]

{ #category : #'Famix-Extensions-metrics' }
FamixJavaScopingEntity >> bunchCohesion [
	"Computing cohesion (Bunch formula)"

	^ self subclassResponsibility
]

{ #category : #'Famix-Extensions-metrics' }
FamixJavaScopingEntity >> bunchCouplingWith: aScope [
	"Computing coupling (Bunch formula) with aScope"

	^ self subclassResponsibility
]

{ #category : #'Famix-Extensions' }
FamixJavaScopingEntity >> childrenOfMyKind [
	"Polymorphic accessor to children of this scope in a hierarchical structure (package->subpackages, scope->subscopes)"

	^ self children allWithSubTypesOf: self class
]

{ #category : #'Famix-Extensions-metrics' }
FamixJavaScopingEntity >> distance [
	"D = A + I - 1. A package should be balanced between abstractness and instability, i.e., somewhere between abstract and stable or concrete and unstable. This rule defines the main sequence by the equation A + I - 1 = 0. D is the distance to the main sequence."
	
	self subclassResponsibility
]

{ #category : #'Famix-Extensions-metrics' }
FamixJavaScopingEntity >> efferentCoupling [
	"Efferent coupling for a module is the number of modules it depends upon"
	
	^ self subclassResponsibility
]

{ #category : #'Famix-Extensions-metrics' }
FamixJavaScopingEntity >> instability [
	"I =	Ce(P)/(Ce(P)+Ca(P)), in the range [0, 1]. 0 means package is maximally stable (i.e., no dependency to other packages and can not change without big consequences), 1 means it is unstable."
	
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
FamixJavaScopingEntity >> structuralChildren [ 
	^ (OrderedCollection withAll: self childScopes), self classes 
]

{ #category : #'Famix-Extensions' }
FamixJavaScopingEntity >> withAllChildrenOfType: anSTClass [ 
	| all |
	all := OrderedCollection new.	
	self withAllChildScopesDo: [:each | each class = anSTClass ifTrue: [ all add: each ] ].
	^ (Smalltalk at: (anSTClass name, 'Group') asSymbol ifAbsent: [MooseGroup]) withAll: all
]
