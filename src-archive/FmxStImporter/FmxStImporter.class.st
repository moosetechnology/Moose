Class {
	#name : #FmxStImporter,
	#superclass : #SmalltalkImporter,
	#instVars : [
		'factory'
	],
	#category : #FmxStImporter
}

{ #category : #'private-entity-creation' }
FmxStImporter >> basicClassCreation: aClass [
	| class anchor |
	class := classes at: aClass put: self factory classEntity new.
	class name: (aClass name replaceAll: Character space with: $_).
	class isStub: true.
	importingContext shouldImportNamespace
		ifTrue: [ class typeContainer: (self ensureNamespace: aClass environment) ].
	anchor := self factory sourceAnchor new
		element: class;
		pharoEntity: aClass;
		yourself.
	class sourceAnchor: anchor.
	self addEntity: anchor.
	^ class
]

{ #category : #'private-entity-creation' }
FmxStImporter >> createAttribute: name for: aClass [ 
	| attribute realName possibleTypes |
	realName := self 
		nameForInstanceVariable: name
		class: aClass.
	attribute := (self scopeOfClass: aClass) 
		at: realName
		bind: FmxStAttribute new.
	attribute isStub: true.
	attribute name: realName asSymbol.
	importingContext shouldMergeClassAndMetaclass 
		ifTrue: [ attribute parentType: (self ensureClass: aClass instanceSide) ]
		ifFalse: [ attribute parentType: (self ensureClass: aClass) ].
	attribute hasClassScope: aClass isMeta.
	attribute beProtected.
	"now we use RoelTyper to see a unique type can be retrieve for this attribute: "
	importingContext shouldComputeTypeOfAttributes 
		ifTrue: [
			possibleTypes := (TypeCollector typeInstvar: name asSymbol ofClassWithLookup: aClass ) types. 
			possibleTypes size = 1
				ifTrue: [attribute declaredType: (self ensureClass: possibleTypes first theNonMetaClass) ].
			].
	^ attribute
]

{ #category : #'private-entity-creation' }
FmxStImporter >> createClass: aClass [ 
	| class inheritance |
	
	importingContext shouldMergeClassAndMetaclass 
		ifFalse: [ class := self basicClassCreation: aClass ]
		ifTrue: 
			[ aClass isMeta 
				ifTrue: [ class := self ensureClass: aClass soleInstance. classes at: aClass put: class ]
				ifFalse: [ class := self basicClassCreation: aClass ] ].
	importingContext shouldImportPackage ifTrue: 
		[ class parentPackage: (self ensurePackage: (aClass package)) ].
	importingContext shouldImportInheritance ifTrue: 
		[ (aClass superclass ~~ nil and: 
			[ importingContext shouldMergeClassAndMetaclass 
				ifFalse: [ true ]
				ifTrue: [ aClass isMeta not ] ]) 
					ifTrue: [ inheritance := self addEntity: self factory inheritance new.
							inheritance superclass: (self ensureClass: aClass superclass).
							inheritance subclass: class ]
		].
	aClass isMeta ifFalse: [ self ensureClass: aClass class ].
	importingContext shouldImportAttribute
		ifTrue:
			[aClass instVarNames
				do: [:eachName | self ensureAttribute: eachName for: aClass].
			"since the classVar of a class are not the same as the classVar of the class class"
			
			"with latest pharo class classVar = class class classVar so we should not need that anymore"
			aClass isMeta 
				ifTrue: [aClass soleInstance classVarNames
							do: [:eachClassVarName | self ensureClassVarAttribute: eachClassVarName for: aClass soleInstance]]
				ifFalse: [ aClass classVarNames
							do: [:eachClassVarName | self ensureClassVarAttribute: eachClassVarName for: aClass]]].
	^ class
]

{ #category : #'private-entity-creation' }
FmxStImporter >> createClassVarAttribute: name for: aClass [ 
	"a classVar always belongs to the base class"
	| attribute |
	
	attribute := FmxStAttribute new.
	(self scopeOfClass: aClass) 
		at: name
		bind: attribute.
	(self scopeOfClass: aClass class)
		at: name 
		bind: attribute.
	attribute isStub: true.
	attribute name: name asSymbol.
	attribute parentType: (self ensureClass: aClass theNonMetaClass).
	attribute hasClassScope: true.
	attribute beSharedVariable.
	attribute beProtected.
	^ attribute
]

{ #category : #'private-entity-creation' }
FmxStImporter >> createGlobalVariable: name value: value [ 
	 
	| global declaredType | 
	global := globals 
		at: name 
		put: FmxStGlobalVariable new. 
	global name: name. 
	global declaredType: (self ensureClass: value class ).
	^ global
]

{ #category : #'private-entity-creation' }
FmxStImporter >> createMethod: aCompiledMethod [
	| method thisClass anchor |
	method := methods at: aCompiledMethod put: self factory method new.
	method name: aCompiledMethod selector.
	method isAbstract: false.
	thisClass := aCompiledMethod methodClass.
	method parentType: (self ensureClass: thisClass).
	method signature: aCompiledMethod signature.
	"here we have two possibilities for the parentPackage of the method: 
	=> the method belong to a package extension, we should refer to this extending packages 
	=> if not, we should not refer to package of the class"
	"parentPackage := aCompiledMethod methodClass package."
	aCompiledMethod methodClass extendingPackages
		do: [ :aRPackage | 
			(aCompiledMethod isExtensionInPackage: aRPackage)
				ifTrue: [ method parentPackage: (self ensurePackage: aRPackage) ] ].
	method hasClassScope: aCompiledMethod methodClass isMeta.
	method
		category:
			(aCompiledMethod methodClass organization
				categoryOfElement: aCompiledMethod selector).
	method isPublic: true.
	method timeStamp: aCompiledMethod timeStamp.
	importingContext shouldImportMethodBody
		ifTrue: [ | visitor |
			visitor := FmxStMethodVisitor on: self.
			visitor runWith: aCompiledMethod and: method ].
	anchor := self factory sourceAnchor new
		element: method;
		pharoEntity: aCompiledMethod;
		yourself.
	method sourceAnchor: anchor.
	self addEntity: anchor.
	^ method
]

{ #category : #'private-entity-creation' }
FmxStImporter >> createNamespace: aNamespace [ 
	
	| namespace |
	namespace := namespaces
		at: aNamespace asString asSymbol
		put: self factory namespace new.
	namespace name: 'Smalltalk'.
	^namespace
]

{ #category : #'private-entity-creation' }
FmxStImporter >> createPackage: aPackageModel [
	
	| package |
	package := packages
		at: aPackageModel
		put: self factory package new.
	package name: aPackageModel name.
	package isStub: true.
	^package
]

{ #category : #'private-entity-creation' }
FmxStImporter >> createSpecialVariable: name forClass: aClass [

	| attribute |
	attribute := (self scopeOfClass: aClass) at: name bind: FmxStImplicitVariable new.
	attribute name: name.
	attribute container: (self ensureClass: aClass).	
	^attribute
]

{ #category : #'private-entity-creation' }
FmxStImporter >> createSpecialVariable: name forFamixMethod: aFamixMethod [

	| attribute |
	attribute := "(self scopeOfClass: aClass) at: name bind:" FmxStImplicitVariable new.
	attribute name: name.
	attribute parentBehaviouralEntity: aFamixMethod.
	^attribute
]

{ #category : #'private-entity-creation' }
FmxStImporter >> createUnknownVariable: name [

	| unknown |
	unknown := globals
		at: name
		put: FmxStUnknownVariable new.
	unknown name: name.
	^unknown
]

{ #category : #'private-entity-creation' }
FmxStImporter >> factory [

	^ factory
]

{ #category : #'private-entity-creation' }
FmxStImporter >> importClass: aClass [ 
	 
	| class comment | 
	importingContext shouldImportClass 
		ifTrue: 
			[class := self ensureClass: aClass. 
			class isStub: false.
			importingContext shouldImportAttribute 
				ifTrue: [ class attributes do: [ :each | each isStub: false ] ].
			importingContext shouldImportPackage ifTrue: [
				class parentPackage isStub: false ].
			importingContext shouldImportSubclasses ifTrue: [aClass subclasses do: [:each | self ensureClass: each]]. 
			importingContext shouldImportMethod 
				ifTrue: 
					[aClass methods do: [:each | self ensureMethod: each]. 
					self checkAbstractClass: class]. 
			importingContext shouldImportComment 
				ifTrue: 
					[aClass hasComment 
						ifTrue: 
							[comment := self addEntity: self factory comment new. 
							comment content: aClass comment asString. 
							comment container: class]]. 
			aClass isMeta ifFalse: [self importClass: aClass class]]
]

{ #category : #'private-entity-creation' }
FmxStImporter >> initialize [

	super initialize.
	factory := EntityClassFactory new. 
]
