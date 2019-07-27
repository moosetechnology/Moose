Class {
	#name : #FmxMBClassTest,
	#superclass : #FmxMBBehaviorTest,
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #accessing }
FmxMBClassTest >> behaviorClass [

	^ FmxMBClass
]

{ #category : #utilities }
FmxMBClassTest >> checkGeneralizationWithAnnotations [

	"check if TstClass is correctly created as a subclass of TstBehavior"

	| generatedBehavior generatedClass annotation |
	generatedBehavior := builder testingEnvironment ask classNamed: 'TstBehavior'.
	generatedClass := builder testingEnvironment ask classNamed: 'TstClass'.
	
	self assert: generatedClass superclass equals: generatedBehavior.
	annotation := generatedClass classSide methodNamed: #annotation.
	self assert: (annotation sourceCode includesSubstring: '<MSEClass: #Class super: #TstBehavior>').
	self assert: (annotation sourceCode includesSubstring: '<generated>').
	

]

{ #category : #accessing }
FmxMBClassTest >> newEntityNamed: aString [

	^ builder newClassNamed: aString
]

{ #category : #tests }
FmxMBClassTest >> testAs [

	"test if #as: creates a trait with correct name and links it to the class"

	| named generatedNamed generatedTNamed |
		
	named := builder newClassNamed: #Named.
	named as: #TNamed.	

	builder generate.

	generatedNamed := builder testingEnvironment ask classNamed: 'TstNamed'.
	generatedTNamed := builder testingEnvironment ask classNamed: 'TstTNamed'.
	
	self assert: generatedTNamed notNil.
	self deny: (generatedNamed superclass = generatedTNamed).
	self assertCollection: generatedNamed traits asArray equals: { generatedTNamed }.
]

{ #category : #tests }
FmxMBClassTest >> testAsPropertyComment [

	"traits should not be renamed during creation of properties"

	| behavior generated generatedTrait method |
		
	behavior := self newEntityNamed: #Named.	
	
	(behavior as: #TNamed property: #from comment: 'comment from') - (behavior as: #TNamed property: #to comment: 'comment to').
	
	builder generate.
	
	generated := builder testingEnvironment ask classNamed: 'TstNamed'.
	generatedTrait := builder testingEnvironment ask classNamed: 'TstTNamed'.
	self assert: generated slots isEmpty.
	self assertCollection: (generatedTrait slots collect: #name) hasSameElements: #(from to).

	method := generatedTrait methodNamed: #from.
	self assert: (method sourceCode includesSubstring: '<MSEComment: ''comment from''>').
	self assert: (method sourceCode includesSubstring: '<generated>').

	method := generatedTrait methodNamed: #to.
	self assert: (method sourceCode includesSubstring: '<MSEComment: ''comment to''>').
	self assert: (method sourceCode includesSubstring: '<generated>').


]

{ #category : #'tests - settings' }
FmxMBClassTest >> testBasicSuperclass [

	"check if a new class has correct superclass (the default one)"

	| generated |
	
	builder newClassNamed: #Comment.	
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstComment'.
	self assert: generated superclass name equals: builder configuration defaultBasicSuperclassName.

]

{ #category : #'tests - settings' }
FmxMBClassTest >> testBasicTrait [

	"test if the trits have correct supperclass"

	| generated |
	
	builder newTraitNamed: #TComment.	
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstTComment'.
	self assert: generated superclass name equals: builder configuration defaultBasicTraitName.

]

{ #category : #tests }
FmxMBClassTest >> testBuilderPackageChange [
	
	"if we set for a builder a packag name, all newely defined entities should use be assigned to this package. If no explicit package name is set, the default one is used."

	| generated |
	
	builder newClassNamed: #Comment.	
	builder configuration packageName: 'Another'.
	builder newClassNamed: #Method.	
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstComment'.
	self assert: generated notNil.
	self assert: generated isClass.
	self assert: generated package name equals: #Tst.
	generated := builder testingEnvironment ask classNamed: 'TstMethod'.
	self assert: generated notNil.
	self assert: generated isClass.
	self assert: generated package name equals: #Another.

]

{ #category : #tests }
FmxMBClassTest >> testBuilderPrefixChange [

	"if we set for a builder a prefix, all newely defined entities should use it. If no explicit prefix is set, the default one is used."

	| generated |
	
	builder newClassNamed: #Comment.	
	builder configuration prefix: 'Another'.
	builder newClassNamed: #Method.	
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstComment'.
	self assert: generated notNil.
	self assert: generated isClass.
	self assert: generated package name equals: #Tst.
	generated := builder testingEnvironment ask classNamed: 'AnotherMethod'.
	self assert: generated notNil.
	self assert: generated isClass.
	self assert: generated package name equals: #Tst.

]

{ #category : #tests }
FmxMBClassTest >> testCommentOnTrait [

	"test assigning of a comment to a trait"

	| simpleTrait generated commentString |
	
	simpleTrait := builder newTraitNamed: #TComment.	
	commentString := 'Simple testing class'.
	simpleTrait comment: commentString.
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstTComment'.
	self assert: generated comment content equals: commentString.
]

{ #category : #'tests - settings' }
FmxMBClassTest >> testCustomBasicTrait [

	"test if #basicTraitName sets the correct superclass of traits"

	| generated |

	builder configuration basicTraitName: #CustomBasicTrait.	
	builder newTraitNamed: #TComment.	
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstTComment'.
	self assert: generated superclass name equals: #CustomBasicTrait.	

]

{ #category : #tests }
FmxMBClassTest >> testCustomPackageForUserClasses [

	"check if package name can by correctly set to a class"

	| generated |
	
	builder configuration packageName: 'Custom'.
	
	builder newClassNamed: #Comment.	
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstComment'.

	self assert: generated package name equals: #Custom.
	
]

{ #category : #tests }
FmxMBClassTest >> testCustomPackageForUserClassesChanged [

	"test correct package assignments to classes"

	| generated generatedAccess  |
	
	builder configuration packageName: 'Custom'.
	builder newClassNamed: #Comment.	

	builder configuration packageName: 'Custom2'.
	builder newClassNamed: #Access.	

	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstComment'.
	generatedAccess := builder testingEnvironment ask classNamed: 'TstAccess'.

	self assert: generated package name equals: #Custom.
	self assert: generatedAccess package name equals: #Custom2.


	
]

{ #category : #'tests - settings' }
FmxMBClassTest >> testCustomSuperclass [

	"test if a custom basic superclass can correctly set"

	| generated |
	
	builder configuration basicSuperclassName: #BasicSuperclass.
	builder newClassNamed: #Comment.
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstComment'.
	self assert: generated superclass name equals: 'BasicSuperclass'.

]

{ #category : #tests }
FmxMBClassTest >> testDefaultPackageForUserClasses [

	"test if the default package name is correctly set to classes"
	
	| generated |
	
	builder newClassNamed: #Comment.	
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstComment'.

	self assert: generated package name equals: #Tst.
	
]

{ #category : #'tests - tags' }
FmxMBClassTest >> testDefaultTagForClass [

	"test if correct default tag name is assigned to classes"

	| generatedTAccess |

	builder newTraitNamed: #TAccess.	

	builder generate.
		
	generatedTAccess := builder testingEnvironment ask classNamed: #TstTAccess.
	self assertCollection: generatedTAccess tags hasSameElements: { builder configuration defaultTraitTag }
]

{ #category : #'tests - tags' }
FmxMBClassTest >> testDirectlyUses [

	| named behavior tNamed tBehavior type |

	named := builder newClassNamed: #Named.	
	behavior := builder newClassNamed: #Behavior.	
	type := builder newClassNamed: #Type.	
	tNamed := builder newTraitNamed: #TNamed.
	tBehavior := builder newTraitNamed: #TBehavior.
	
	behavior --|> named.
	type --|> named.
	named --|> tNamed.
	behavior --|> tBehavior.
	
	self assert: (behavior directlyUses: tBehavior).
	self assert: (named directlyUses: tNamed).
	self deny: (behavior directlyUses: tNamed).
	self deny: (type directlyUses: tNamed).

]

{ #category : #tests }
FmxMBClassTest >> testEmptyComment [

	"check that by default classes do not have any class comment"
	
	| generated |
	
	builder newClassNamed: #Comment.	
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstComment'.
	self assert: generated comment content isEmptyOrNil.
]

{ #category : #tests }
FmxMBClassTest >> testHasTraitGeneralization [
	
	"test message #hasTraitGeneralization:"	
	
	| named tNamed |
		
	named := builder newClassNamed: #Named.	
	tNamed := builder newTraitNamed: #TBehavior.
	
	self deny: (named hasTraitGeneralization: tNamed).
	
	named subclassOf: tNamed.
	
	self assert: (named hasTraitGeneralization: tNamed).
]

{ #category : #tests }
FmxMBClassTest >> testIsContainerOfClassThatUses [

	| tMethod class method |
	tMethod := builder newTraitNamed: #TMethod.
	
	class := builder newClassNamed: #Class.    
	method := builder newClassNamed: #Method.    

	class <>-* method.

	method --|> tMethod.
	
	self assert: (class isContainerOfClassThatUses: tMethod).
]

{ #category : #tests }
FmxMBClassTest >> testMultipleAs [

	"test if we can assign multiple traits to a class using #as: message"

	| named generatedNamed generatedTNamed generatedTSourced  |
		
	named := builder newClassNamed: #Named.
	named as: #TNamed.	
	named as: #TSourced.	

	builder generate.

	generatedNamed := builder testingEnvironment ask classNamed: 'TstNamed'.
	generatedTNamed := builder testingEnvironment ask classNamed: 'TstTNamed'.
	generatedTSourced := builder testingEnvironment ask classNamed: 'TstTSourced'.
	
	self deny: (generatedNamed superclass = generatedTNamed).
	self deny: (generatedNamed superclass = generatedTSourced).
	self assertCollection: generatedNamed traits asArray equals: { generatedTNamed. generatedTSourced }.

]

{ #category : #tests }
FmxMBClassTest >> testMultipleClasses [

	"trivial test if we can generate several different classes"
	
	builder newClassNamed: #Comment.	
	builder newClassNamed: #Method.
	builder newClassNamed: #Package.

	builder generate.
	builder testingEnvironment ask classNamed: 'TstComment'.
	builder testingEnvironment ask classNamed: 'TstMethod'.
	builder testingEnvironment ask classNamed: 'TstPackage'.

]

{ #category : #tests }
FmxMBClassTest >> testPrimaryContainerCombined [

	| tPackage tPackageable method package class env |

	tPackage := builder newTraitNamed: #TPackage.
	tPackageable := builder newTraitNamed: #TPackageable.
	
	tPackage <>-* tPackageable. 

	package := builder newClassNamed: #Package.    
	method := builder newClassNamed: #Method.    
	class := builder newClassNamed: #Class.    

	package --|> tPackage.
	class --|> tPackageable.
	(class <>-* method). 
	method usesWithoutPrimaryContainer: tPackageable.
	
	self assert: package primaryContainerProperties size equals: 0.
	self assert: class primaryContainerProperties size equals: 1.
	self assert: method primaryContainerProperties size equals: 1.
	
	builder generate.
	
	env := builder environment ringEnvironment.
	
	self assert: ((env ask classNamed: #TstPackage) methodNamed: 'belongsTo') isNil.
	self assert: (((env ask classNamed: #TstMethod) methodNamed: 'belongsTo') sourceCode includesSubstring: '^ self class').
	self assert: (((env ask classNamed: #TstClass) methodNamed: 'belongsTo') sourceCode includesSubstring: '^ self package').
]

{ #category : #tests }
FmxMBClassTest >> testPrimaryContainerFromTraits [

	| tMethod tWithMethods method class env |
	
	tMethod := builder newTraitNamed: #TMethod.
	tWithMethods := builder newTraitNamed: #TWithMethods.
	
	tWithMethods <>-* tMethod. 

	class := builder newClassNamed: #Class.    
	method := builder newClassNamed: #Method.    

	class --|> tWithMethods.
	tMethod <|-- method.
	
	self assert: method primaryContainerProperties size equals: 1.
	
	builder generate.
	
	env := builder environment ringEnvironment.
	
	self assert: ((env ask classNamed: #TstClass) methodNamed: 'belongsTo') isNil.
	self assert: (((env ask classNamed: #TstMethod) methodNamed: 'belongsTo') sourceCode includesSubstring: '^ self withMethods').

]

{ #category : #tests }
FmxMBClassTest >> testPrimaryContainerWithoutTraits [

	| method package class env |
	
	package := builder newClassNamed: #Package.    
	method := builder newClassNamed: #Method.    
	class := builder newClassNamed: #Class.    

	(package <>-* class). 
	(class <>-* method). 
	(package <>-* method) withoutPrimaryContainer.

	builder generate.
	
	env := builder environment ringEnvironment.
	
	self assert: ((env ask classNamed: #TstPackage) methodNamed: 'belongsTo') isNil.
	self assert: (((env ask classNamed: #TstMethod) methodNamed: 'belongsTo') sourceCode includesSubstring: '^ self class').
	self assert: (((env ask classNamed: #TstClass) methodNamed: 'belongsTo') sourceCode includesSubstring: '^ self package').
]

{ #category : #'tests - names' }
FmxMBClassTest >> testRelatedOwnerTraitName [

	"test if relatedOwnerTraitName is correctly created from a class name"

	| class |
		
	class := builder newClassNamed: #Variable.	
	self assert: class relatedOwnerTraitName equals: 'TWithVariables'.
		
	class := builder newClassNamed: #Access.	
	self assert: class relatedOwnerTraitName equals: 'TWithAccesses'.

	class := builder newClassNamed: #Method.	
	self assert: class relatedOwnerTraitName equals: 'TWithMethods'.

]

{ #category : #'tests - names' }
FmxMBClassTest >> testRelatedTraitName [

	"test if a related trait name is correctly generated from a class name"

	| class |
		
	class := builder newClassNamed: #Variable.	
	self assert: class relatedTraitName equals: 'TVariable'.
		
	class := builder newClassNamed: #Access.	
	self assert: class relatedTraitName equals: 'TAccess'.

	class := builder newClassNamed: #Method.	
	self assert: class relatedTraitName equals: 'TMethod'.

]

{ #category : #tests }
FmxMBClassTest >> testSimpleClass [
	"check expected parameters of a newely generated class"

	| generated |
	builder newClassNamed: #Comment.
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstComment'.
	self assert: generated notNil.
	self assert: generated isClass.
	self assert: generated superclass name equals: 'MooseEntity'.
	self assert: generated slots isEmpty.
	self assert: generated instanceSide localSelectors isEmpty.
	self assertCollection: generated classSide localSelectors sorted equals: #(annotation #metamodel)
]

{ #category : #tests }
FmxMBClassTest >> testSimpleClassAnnotation [

	"test correct generation of class annotations"

	| generated method |
		
	builder newClassNamed: #Comment.	
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstComment'.
	method := generated classSide methodNamed: #annotation.
	self assert: (method sourceCode includesSubstring: '<MSEClass: #Comment super: #MooseEntity>').
	self assert: (method sourceCode includesSubstring: '<generated>').
	self assert: (method sourceCode includesSubstring: '<package: #Tst>').

]

{ #category : #'tests - names' }
FmxMBClassTest >> testSingularPropertyName [

	"test if singularPropertyName is correctly created from a class name"

	| class |
		
	class := builder newClassNamed: #Variable.	
	self assert: class singularPropertyName equals: 'variable'.
		
	class := builder newClassNamed: #Access.	
	self assert: class singularPropertyName equals: 'access'.

	class := builder newClassNamed: #Method.	
	self assert: class singularPropertyName equals: 'method'.

]

{ #category : #'tests - tags' }
FmxMBClassTest >> testTagForClass [

	| access generatedAccess |

	access := builder newClassNamed: #Access.	
	access tag: #classes.

	builder generate.
		
	generatedAccess := builder testingEnvironment ask classNamed: #TstAccess.
	self assertCollection: generatedAccess tags hasSameElements: { #classes }
]

{ #category : #'tests - tags' }
FmxMBClassTest >> testTagForClassFromBuilder [

	| access generatedAccess comment generatedComment |

	access := builder newClassNamed: #Access.	
	comment := builder newClassNamed: #Comment.	

	builder configuration classTag: #classes.
	comment tag: #support.

	builder generate.
		
	generatedAccess := builder testingEnvironment ask classNamed: #TstAccess.
	generatedComment := builder testingEnvironment ask classNamed: #TstComment.
	self assertCollection: generatedAccess tags hasSameElements: { #classes }.
	self assertCollection: generatedComment tags hasSameElements: { #support }.
]

{ #category : #'tests - tags' }
FmxMBClassTest >> testTagForTraitFromBuilder [

	| tAccess generatedTAccess tComment generatedTComment |

	tAccess := builder newTraitNamed: #TAccess.	
	tComment := builder newTraitNamed: #TComment.	

	builder configuration traitTag: #classes.
	tComment tag: #support.

	builder generate.
		
	generatedTAccess := builder testingEnvironment ask classNamed: #TstTAccess.
	generatedTComment := builder testingEnvironment ask classNamed: #TstTComment.
	self assertCollection: generatedTAccess tags hasSameElements: { #classes }.
	self assertCollection: generatedTComment tags hasSameElements: { #support }.
]

{ #category : #'tests - tags' }
FmxMBClassTest >> testTagForTraits [

	| tAccess generatedTAccess |

	tAccess := builder newTraitNamed: #TAccess.	
	tAccess tag: #support.

	builder generate.
		
	generatedTAccess := builder testingEnvironment ask classNamed: #TstTAccess.
	self assertCollection: generatedTAccess tags hasSameElements: { #support }
]

{ #category : #'tests - tags' }
FmxMBClassTest >> testTestingMethods [

	"test messages isMetamodelClass and isMetamodelTrait"
	
	| named |

	named := builder newClassNamed: #Named.	

	self assert: named isMetamodelClass.
	self deny: named isMetamodelTrait.
	
	
]

{ #category : #tests }
FmxMBClassTest >> testUsesOnlyTrait [
	
	"test message #usesOnlyTrait:"	
	
	| named tNamed tSourced |
		
	named := builder newClassNamed: #Named.	
	tNamed := builder newTraitNamed: #TBehavior.
	tSourced := builder newTraitNamed: #TSourced.
	
	self deny: (named usesOnlyTrait: tNamed).
	named subclassOf: tNamed.
	self assert: (named usesOnlyTrait: tNamed).
	named subclassOf: tSourced.
	self deny: (named usesOnlyTrait: tNamed).

]
