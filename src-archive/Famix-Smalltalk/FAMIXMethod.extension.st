Extension { #name : #FAMIXMethod }

{ #category : #'*Famix-Smalltalk' }
FAMIXMethod >> category [
	<MSEProperty: #category type: #String>
	<MSEComment: 'Category of the method'>
	<package: 'Smalltalk'>
	
	^ self privateState attributeAt: #category ifAbsentPut: [ nil ]
]

{ #category : #'*Famix-Smalltalk' }
FAMIXMethod >> category: aString [

	self privateState attributeAt: #category put: aString

	
]

{ #category : #'*Famix-Smalltalk' }
FAMIXMethod >> isCalledInternally [
	^self incomingInvocations
		anySatisfy:
			[:each | each sender isMethod and: [each sender belongsTo == self belongsTo]]
]

{ #category : #'*Famix-Smalltalk' }
FAMIXMethod >> isExtension [
	^self belongsTo packageScope ~~ self packageScope.
]

{ #category : #'*Famix-Smalltalk' }
FAMIXMethod >> isInitializer [
	^ self mooseModel isSmalltalk
		ifTrue: [ (('*initialize*' match: self category) or: [ '*initialize*' match: self name ]) or: [ self isConstructor ] ]
		ifFalse: [ self isConstructor ]
]

{ #category : #'*Famix-Smalltalk' }
FAMIXMethod >> isInternalImplementation [
	<MSEProperty: #isInternalImplementation type: #Boolean>
	<derived>
	<MSEComment: 'Public Interface Layer Method'>
	<package: 'Smalltalk'>
	^ (self isInitializer not and: [ self isCalledInternally ])
		and: [ self isPureAccessor not ]
]

{ #category : #'*Famix-Smalltalk' }
FAMIXMethod >> sourceText [
	self flag: 'This code should be delegated to the FAMIXPharoAnchor'.
	^ (self sourceLanguage isSmalltalk and: [ self class shouldSearchForSmalltalkCodeInImage ])
		ifTrue: [ [ | class |
			"take the normal class"
			class := Smalltalk at: self parentType instanceSide name asSymbol.
			self hasClassScope
				ifFalse: [ class sourceCodeAt: self name asSymbol ]
				ifTrue: [ class class sourceCodeAt: self name asSymbol ]	"dispatch on class or metaclass depending on method scope" ]
				on: Error
				do: [ super sourceText ]	"probably class is not in the system" ]
		ifFalse: [ super sourceText ]
]

{ #category : #'*Famix-Smalltalk' }
FAMIXMethod >> timeStamp [
	<MSEProperty: #timeStamp type: #String>
	<MSEComment: 'TimeStamp of the method with author and time of the last change'>
	<package: 'Smalltalk'>
	
	^ self privateState attributeAt: #timeStamp ifAbsentPut: ['']
]

{ #category : #'*Famix-Smalltalk' }
FAMIXMethod >> timeStamp: aTimeStamp [

	self privateState attributeAt: #timeStamp put: aTimeStamp
]
