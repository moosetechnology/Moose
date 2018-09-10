Class {
	#name : #FamixMetamodelBuilderClassTest,
	#superclass : #FmxMBBehaviorTest,
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #accessing }
FamixMetamodelBuilderClassTest >> behaviorClass [

	^ FmxMBClass
]

{ #category : #utilities }
FamixMetamodelBuilderClassTest >> checkGeneralizationWithAnnotations [

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
FamixMetamodelBuilderClassTest >> newEntityNamed: aString [

	^ builder newClassNamed: aString
]

{ #category : #tests }
FamixMetamodelBuilderClassTest >> testAs [

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
FamixMetamodelBuilderClassTest >> testAsPropertyComment [

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
FamixMetamodelBuilderClassTest >> testBasicSuperclass [

	"check if a new class has correct superclass (the default one)"

	| generated |
	
	builder newClassNamed: #Comment.	
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstComment'.
	self assert: generated superclass name equals: builder defaultBasicSuperclassName.

]

{ #category : #'tests - settings' }
FamixMetamodelBuilderClassTest >> testBasicTrait [

	"test if the trits have correct supperclass"

	| generated |
	
	builder newTraitNamed: #TComment.	
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstTComment'.
	self assert: generated superclass name equals: builder defaultBasicTraitName.

]

{ #category : #tests }
FamixMetamodelBuilderClassTest >> testBuilderPackageChange [
	
	"if we set for a builder a packag name, all newely defined entities should use be assigned to this package. If no explicit package name is set, the default one is used."

	| generated |
	
	builder newClassNamed: #Comment.	
	builder packageName: 'Another'.
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
FamixMetamodelBuilderClassTest >> testBuilderPrefixChange [

	"if we set for a builder a prefix, all newely defined entities should use it. If no explicit prefix is set, the default one is used."

	| generated |
	
	builder newClassNamed: #Comment.	
	builder prefix: 'Another'.
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
FamixMetamodelBuilderClassTest >> testCommentOnTrait [

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
FamixMetamodelBuilderClassTest >> testCustomBasicTrait [

	"test if #basicTraitName sets the correct superclass of traits"

	| generated |

	builder basicTraitName: #CustomBasicTrait.	
	builder newTraitNamed: #TComment.	
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstTComment'.
	self assert: generated superclass name equals: #CustomBasicTrait.	

]

{ #category : #tests }
FamixMetamodelBuilderClassTest >> testCustomPackageForUserClasses [

	"check if package name can by correctly set to a class"

	| generated |
	
	builder packageName: 'Custom'.
	
	builder newClassNamed: #Comment.	
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstComment'.

	self assert: generated package name equals: #Custom.
	
]

{ #category : #tests }
FamixMetamodelBuilderClassTest >> testCustomPackageForUserClassesChanged [

	"test correct package assignments to classes"

	| generated generatedAccess  |
	
	builder packageName: 'Custom'.
	builder newClassNamed: #Comment.	

	builder packageName: 'Custom2'.
	builder newClassNamed: #Access.	

	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstComment'.
	generatedAccess := builder testingEnvironment ask classNamed: 'TstAccess'.

	self assert: generated package name equals: #Custom.
	self assert: generatedAccess package name equals: #Custom2.


	
]

{ #category : #'tests - settings' }
FamixMetamodelBuilderClassTest >> testCustomSuperclass [

	"test if a custom basic superclass can correctly set"

	| generated |
	
	builder basicSuperclassName: #BasicSuperclass.
	builder newClassNamed: #Comment.
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstComment'.
	self assert: generated superclass name equals: 'BasicSuperclass'.

]

{ #category : #tests }
FamixMetamodelBuilderClassTest >> testDefaultPackageForUserClasses [

	"test if the default package name is correctly set to classes"
	
	| generated |
	
	builder newClassNamed: #Comment.	
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstComment'.

	self assert: generated package name equals: #Tst.
	
]

{ #category : #'tests - tags' }
FamixMetamodelBuilderClassTest >> testDefaultTagForClass [

	"test if correct default tag name is assigned to classes"

	| generatedTAccess |

	builder newTraitNamed: #TAccess.	

	builder generate.
		
	generatedTAccess := builder testingEnvironment ask classNamed: #TstTAccess.
	self assertCollection: generatedTAccess tags hasSameElements: { builder defaultTraitTag }
]

{ #category : #tests }
FamixMetamodelBuilderClassTest >> testEmptyComment [

	"check that by default classes do not have any class comment"
	
	| generated |
	
	builder newClassNamed: #Comment.	
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstComment'.
	self assert: generated comment content isEmptyOrNil.
]

{ #category : #tests }
FamixMetamodelBuilderClassTest >> testHasTraitGeneralization [
	
	"test message #hasTraitGeneralization:"	
	
	| named tNamed |
		
	named := builder newClassNamed: #Named.	
	tNamed := builder newTraitNamed: #TBehavior.
	
	self deny: (named hasTraitGeneralization: tNamed).
	
	named subclassOf: tNamed.
	
	self assert: (named hasTraitGeneralization: tNamed).
]

{ #category : #tests }
FamixMetamodelBuilderClassTest >> testMultipleAs [

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
FamixMetamodelBuilderClassTest >> testMultipleClasses [

	"trivial test if we can generate several different classes"
	
	builder newClassNamed: #Comment.	
	builder newClassNamed: #Method.
	builder newClassNamed: #Package.

	builder generate.
	builder testingEnvironment ask classNamed: 'TstComment'.
	builder testingEnvironment ask classNamed: 'TstMethod'.
	builder testingEnvironment ask classNamed: 'TstPackage'.

]

{ #category : #'tests - names' }
FamixMetamodelBuilderClassTest >> testOwnerPropertyName [

	"test if ownerPropertyName is correctly created from a class name"

	| class |
		
	class := builder newClassNamed: #Variable.	
	self assert: class ownerPropertyName equals: 'variableOwner'.
		
	class := builder newClassNamed: #Access.	
	self assert: class ownerPropertyName equals: 'accessOwner'.

	class := builder newClassNamed: #Method.	
	self assert: class ownerPropertyName equals: 'methodOwner'.

]

{ #category : #'tests - names' }
FamixMetamodelBuilderClassTest >> testPluralRelationName [

	"test if pluralRelationName is correctly created from a class name"

	| class |
		
	class := builder newClassNamed: #Variable.	
	self assert: class pluralRelationName equals: 'variables'.
		
	class := builder newClassNamed: #Access.	
	self assert: class pluralRelationName equals: 'accesses'.

	class := builder newClassNamed: #Method.	
	self assert: class pluralRelationName equals: 'methods'.

]

{ #category : #'tests - names' }
FamixMetamodelBuilderClassTest >> testRelatedOwnerTraitName [

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
FamixMetamodelBuilderClassTest >> testRelatedTraitName [

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
FamixMetamodelBuilderClassTest >> testSimpleClass [

	"check expected parameters of a newely generated class"

	| simpleClass generated |
	
	simpleClass := builder newClassNamed: #Comment.	
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstComment'.
	self assert: generated notNil.
	self assert: generated isClass.
	self assert: generated superclass name equals: 'MooseEntity'.
	self assert: generated slots isEmpty.
	self assert: generated instanceSide localSelectors isEmpty.	
	self assertCollection: generated classSide localSelectors sorted equals: #(annotation #metamodel #requirements).
]

{ #category : #tests }
FamixMetamodelBuilderClassTest >> testSimpleClassAnnotation [

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
FamixMetamodelBuilderClassTest >> testSingularPropertyName [

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
FamixMetamodelBuilderClassTest >> testTagForClass [

	| access generatedAccess |

	access := builder newClassNamed: #Access.	
	access tag: #classes.

	builder generate.
		
	generatedAccess := builder testingEnvironment ask classNamed: #TstAccess.
	self assertCollection: generatedAccess tags hasSameElements: { #classes }
]

{ #category : #'tests - tags' }
FamixMetamodelBuilderClassTest >> testTagForClassFromBuilder [

	| access generatedAccess comment generatedComment |

	access := builder newClassNamed: #Access.	
	comment := builder newClassNamed: #Comment.	

	builder classTag: #classes.
	comment tag: #support.

	builder generate.
		
	generatedAccess := builder testingEnvironment ask classNamed: #TstAccess.
	generatedComment := builder testingEnvironment ask classNamed: #TstComment.
	self assertCollection: generatedAccess tags hasSameElements: { #classes }.
	self assertCollection: generatedComment tags hasSameElements: { #support }.
]

{ #category : #'tests - tags' }
FamixMetamodelBuilderClassTest >> testTagForTraitFromBuilder [

	| tAccess generatedTAccess tComment generatedTComment |

	tAccess := builder newTraitNamed: #TAccess.	
	tComment := builder newTraitNamed: #TComment.	

	builder traitTag: #classes.
	tComment tag: #support.

	builder generate.
		
	generatedTAccess := builder testingEnvironment ask classNamed: #TstTAccess.
	generatedTComment := builder testingEnvironment ask classNamed: #TstTComment.
	self assertCollection: generatedTAccess tags hasSameElements: { #classes }.
	self assertCollection: generatedTComment tags hasSameElements: { #support }.
]

{ #category : #'tests - tags' }
FamixMetamodelBuilderClassTest >> testTagForTraits [

	| tAccess generatedTAccess |

	tAccess := builder newTraitNamed: #TAccess.	
	tAccess tag: #support.

	builder generate.
		
	generatedTAccess := builder testingEnvironment ask classNamed: #TstTAccess.
	self assertCollection: generatedTAccess tags hasSameElements: { #support }
]

{ #category : #'tests - tags' }
FamixMetamodelBuilderClassTest >> testTestingMethods [

	"test messages isMetamodelClass and isMetamodelTrait"
	
	| named |

	named := builder newClassNamed: #Named.	

	self assert: named isMetamodelClass.
	self deny: named isMetamodelTrait.
	
	
]

{ #category : #tests }
FamixMetamodelBuilderClassTest >> testUsesOnlyTrait [
	
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
