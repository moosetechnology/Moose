Class {
	#name : #MooseMonticelloMethodPopulator,
	#superclass : #MooseMonticelloVisitor,
	#instVars : [
		'entities',
		'scope'
	],
	#category : #'Moose-MonticelloImporter'
}

{ #category : #accessing }
MooseMonticelloMethodPopulator >> addEntity: entity [ 
	entities add: entity
]

{ #category : #'compatibility with visitor' }
MooseMonticelloMethodPopulator >> createGlobalVariable: name value: value [ 
	 
	| global | 
	global := self globals 
		at: name 
		put: FAMIXGlobalVariable new. 
	global name: name. 
	Smalltalk at: name ifPresent: [:each | global declaredType: each class mooseName].
	^global
]

{ #category : #'compatibility with visitor' }
MooseMonticelloMethodPopulator >> createSpecialVariable: name forClass: aClass [

	| attribute |
	attribute := (self scopeOfClass: aClass) at: name bind: FAMIXImplicitVariable new.
	attribute name: name.
	attribute container: aClass.	
	^attribute
]

{ #category : #'public-entity-creation' }
MooseMonticelloMethodPopulator >> ensureAnnotationType: aRBPragmaNode [ 
	^self importer ensureAnnotationType: aRBPragmaNode.
]

{ #category : #'compatibility with visitor' }
MooseMonticelloMethodPopulator >> ensureClass: classNameSymbol [ 

	^ importer ensureClassNamed: classNameSymbol
]

{ #category : #'compatibility with visitor' }
MooseMonticelloMethodPopulator >> ensureGlobalVariable: name value: value [ 
	 
	^ importer ensureGlobalVariable: name value: value 
]

{ #category : #'public-entity-creation' }
MooseMonticelloMethodPopulator >> ensureImplicitVariable: name inClass: aClass [
	
	^(self scopeOfClass: aClass)
		at: name
		ifAbsent:
			[self
				createSpecialVariable: name
				forClass: aClass]
]

{ #category : #'compatibility with visitor' }
MooseMonticelloMethodPopulator >> ensureImplicitVariable: aByteSymbol inFamixMethod: aFAMIXMethod [ 
	 ^ importer ensureImplicitVariable: aByteSymbol inFamixMethod: aFAMIXMethod 
]

{ #category : #'compatibility with visitor' }
MooseMonticelloMethodPopulator >> ensureNamespace: aName [
	^ nil
]

{ #category : #'compatibility with visitor' }
MooseMonticelloMethodPopulator >> ensureUnknownVariable: name [
	^ importer ensureUnknownVariable: name
	
"	^globals
		at: name
		ifAbsent: [self createUnknownVariable: name]
"
]

{ #category : #accessing }
MooseMonticelloMethodPopulator >> entities [
	^ entities
]

{ #category : #accessing }
MooseMonticelloMethodPopulator >> factory [

	^ importer factory
]

{ #category : #initialization }
MooseMonticelloMethodPopulator >> initialize [
	super initialize.
	entities := OrderedCollection new
]

{ #category : #'private-entity-creation' }
MooseMonticelloMethodPopulator >> scopeOfClass: aClass [
	^ importer scopeOfClass: aClass
]

{ #category : #accessing }
MooseMonticelloMethodPopulator >> setInfoOn: famixMethod withSource: sourceAsString [
	"sourceAsString is the source code of famixMethod"

	| visitor |
	visitor := MonticelloMethodVisitor on: self.
	visitor 
			runWithSource: sourceAsString
			and: famixMethod 
]

{ #category : #visiting }
MooseMonticelloMethodPopulator >> visitMethodDefinition: definition [ 
	| famixMethod classOnWhichItIsDefined |
	famixMethod := FAMIXMethod new.
	famixMethod name: definition selector.
	famixMethod signature: definition selector.
	famixMethod hasClassScope: definition classIsMeta.
	"note that maybe the class does not exist yet, this happens if the method is an extension"
	classOnWhichItIsDefined := importer ensureClassNamed: definition className.
	classOnWhichItIsDefined addMethod: famixMethod.
	famixMethod parentType: classOnWhichItIsDefined.
	famixMethod category: definition category asSymbol.
	famixMethod isPublic: true.
	famixMethod sourceAnchor: (FAMIXSourceTextAnchor new source: definition source).
	famixMethod 
		propertyNamed: #timestamp
		put: definition timeStamp.
	importer targetModel add: famixMethod.
	self 
		setInfoOn: famixMethod
		withSource: definition source.
	^ famixMethod
]
