Class {
	#name : #RBVisitorForFAMIX,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'methodEntity',
		'stClass',
		'importer',
		'targetModel'
	],
	#category : #'Famix-Smalltalk-Utils'
}

{ #category : #public }
RBVisitorForFAMIX >> checkThatClassIsStillCorrect [
	"as stClass is lazy acessed we have to check that the stClass is flush when processing a new method on a different class"

	(self stClass isNil or: [ self stClass name ~= self classNameFromMethod ])
		ifTrue: [ stClass := nil ]
]

{ #category : #'private-accessing' }
RBVisitorForFAMIX >> classNameFromMethod [
	"depending wether we are in extraction or not the way class name is accessed is different. This method allows one to deal with such point"
	
	self subclassResponsibility
]

{ #category : #'private-accessing' }
RBVisitorForFAMIX >> compiledMethod [
	
	| selector mooseEntity realSTClass |
	mooseEntity := self methodEntity. 
	selector := mooseEntity name.
	realSTClass := (mooseEntity isClassSide and: [self stClass class ~= TraitedMetaclass])
		ifTrue: [self stClass class]
		ifFalse: [self stClass].
	^ realSTClass compiledMethodAt: selector ifAbsent:[ ]
]

{ #category : #private }
RBVisitorForFAMIX >> famixNameFor: aClass [
	
	^aClass mooseName
]

{ #category : #'private-accessing' }
RBVisitorForFAMIX >> importer [
	
	^importer
]

{ #category : #'private-accessing' }
RBVisitorForFAMIX >> importer: anObject [
	
	importer := anObject
]

{ #category : #private }
RBVisitorForFAMIX >> isDirtySuperInMethod: sel withReceiver: rcvr [
	
	^(sel == self methodEntity name) not and: [rcvr isSuper]
]

{ #category : #private }
RBVisitorForFAMIX >> isSuperInMethod: sel withReceiver: rcvr [
	
	^sel == self methodEntity name and: [rcvr isSuper]
]

{ #category : #obsoleteMethods }
RBVisitorForFAMIX >> methodBodyOn: aReadStream [
	"hook method aReadtream contains the body of the currently analyzed method"
	
	^self
]

{ #category : #'private-accessing' }
RBVisitorForFAMIX >> methodEntity [
	
	^methodEntity
]

{ #category : #'private-accessing' }
RBVisitorForFAMIX >> methodEntity: aMethodEntity [
	
	methodEntity := aMethodEntity
]

{ #category : #public }
RBVisitorForFAMIX >> processMethod: aMethodEntity usingImporter: anImporter inModel: anObject [
	
	| parseTree |
	self targetModel: anObject.
	self importer: anImporter.
	self methodEntity: aMethodEntity.
	self checkThatClassIsStillCorrect.
	
	parseTree := self compiledMethod methodClass parseTreeFor: self compiledMethod selector. 
	parseTree ifNotNil: [self visitMethodNode: parseTree]
	
	"parseTreeOrNil := self stParseTree.
	parseTreeOrNil isNil ifFalse: [self visitNode: parseTreeOrNil]"
]

{ #category : #'private-accessing' }
RBVisitorForFAMIX >> stClass [
	stClass isNil ifTrue: [
		stClass := FamixSmalltalkNameResolver 
			smalltalkClassFromFamixClassName: self classNameFromMethod
			ifAbsent: [nil] ].
	^ stClass
]

{ #category : #'private-for tests' }
RBVisitorForFAMIX >> stClass: aClass [
	
	stClass := aClass
]

{ #category : #accessing }
RBVisitorForFAMIX >> targetModel [
	
	^targetModel
]

{ #category : #accessing }
RBVisitorForFAMIX >> targetModel: anObject [
	
	targetModel := anObject
]
