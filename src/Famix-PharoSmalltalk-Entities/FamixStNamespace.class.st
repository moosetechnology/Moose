Class {
	#name : #FamixStNamespace,
	#superclass : #FamixStScopingEntity,
	#traits : 'FamixTInvocationsReceiver + FamixTNamespace',
	#classTraits : 'FamixTInvocationsReceiver classTrait + FamixTNamespace classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStNamespace class >> annotation [

	<FMClass: #Namespace super: #FamixStScopingEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #'Famix-Extensions-metrics' }
FamixStNamespace >> abstractness [
	"Abstractness is the ratio between the number of abstract classes and the total number of classes in a package, in the range [0, 1]. 0 means the package is fully concrete, 1 it is fully abstract."
	<FMProperty: #abstractness type: #Number>
	<derived>
	<FMComment: 'Abstractness of a package'>

	| nsClasses |
	nsClasses := self allClasses select: [:c | c isInstanceSide].
	(nsClasses size == 0) ifTrue: [^nil].
	
	^ (nsClasses select: [:c | c isAbstract]) size / (nsClasses size)
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FamixStNamespace >> isNamespace [
	^ true
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FamixStNamespace >> mooseNameOn: aStream [ 
	| parent |
	parent := self belongsTo.
	parent ifNotNil: 
		[ parent mooseNameOn: aStream.
		aStream
			nextPut: $:;
			nextPut: $: ].
	self name ifNotNil: [aStream nextPutAll: self name]
]

{ #category : #'Famix-Extensions' }
FamixStNamespace >> numberOfClasses [
	<FMProperty: #numberOfClasses type: #Number>
	<derived>
	<FMComment: 'The number of classes in a namespace'>
	
	^self
		lookUpPropertyNamed: #numberOfClasses
		computedAs: [self types size]
]

{ #category : #'Famix-Extensions' }
FamixStNamespace >> numberOfClasses: aNumber [

	self privateState propertyAt: #numberOfClasses put: aNumber
]

{ #category : #'Famix-Extensions' }
FamixStNamespace >> numberOfLinesOfCode [
	<FMProperty: #numberOfLinesOfCode type: #Number>
	<derived>
	<FMComment: 'The number of lines of code in a namespace'>
	
	^self
		lookUpPropertyNamed: #numberOfLinesOfCode
		computedAs: [
			self functions inject: (self types inject: 0 into: [ :sum :each | sum + each numberOfLinesOfCode])
				into: [ :sum :each | sum + each numberOfLinesOfCode]]
]

{ #category : #'Famix-Extensions' }
FamixStNamespace >> numberOfLinesOfCode: aNumber [

	self privateState propertyAt: #numberOfLinesOfCode put: aNumber
]

{ #category : #'Famix-Extensions' }
FamixStNamespace >> numberOfMethods [
	<FMProperty: #numberOfMethods type: #Number>
	<derived>
	<FMComment: 'The number of methods in a namespace'>
	
	^self
		lookUpPropertyNamed: #numberOfMethods
		computedAs: [self types inject: 0 into: [ :sum :each | sum + each numberOfMethods ]]
]

{ #category : #'Famix-Extensions' }
FamixStNamespace >> numberOfMethods: aNumber [

	self privateState propertyAt: #numberOfMethods put: aNumber
]
