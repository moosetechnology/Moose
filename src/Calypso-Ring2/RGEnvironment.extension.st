Extension { #name : #RGEnvironment }

{ #category : #'*Calypso-Ring2' }
RGEnvironment >> associationsDo: aBlock [

	self bindings do: aBlock
]

{ #category : #'*Calypso-Ring2' }
RGEnvironment >> at: aSymbol [

	^ self ask behaviorNamed: aSymbol
]

{ #category : #'*Calypso-Ring2' }
RGEnvironment >> bindings [

	"TODO:"

	| dict |
	
	dict := Dictionary new.
	self globalVariablesDo: [ :each | 
		each name -> each ].
	
	^ dict.
]

{ #category : #'*Calypso-Ring2' }
RGEnvironment >> browse [

	 | clyEnv clyNavEnv browser |

	clyEnv := ClyRing2Environment new.
	clyEnv environment: self.

	clyNavEnv := (ClyNavigationEnvironment over: clyEnv)
		addPlugin: ClyDefaultSystemEnvironmentPlugin new;
	   attachToSystem.

	browser := ClyFullBrowser new 
		navigationEnvironment: clyNavEnv.
	browser addPlugin: ClyStandardBrowserPlugin new.

	^ browser open.
]

{ #category : #'*Calypso-Ring2' }
RGEnvironment >> classNames [

	"TODO:"
	^ self allClasses collect: #name.
]

{ #category : #'*Calypso-Ring2' }
RGEnvironment >> hasBindingThatBeginsWith: aString [
	"Use the cached class and non-class names for better performance."

	| aName searchBlock |
	searchBlock := [ :element |
		(element beginsWith: aString)
			ifTrue: [ 0 ]
			ifFalse: [
				aString < element
					ifTrue: [ -1 ]
					ifFalse: [ 1 ] ] ].
	aName := self classNames 
		findBinary: searchBlock
		ifNone: [nil].
	aName ifNotNil: [ ^true ].
	aName := self nonClassNames 
		findBinary: searchBlock
		ifNone: [nil].
	^aName notNil
]

{ #category : #'*Calypso-Ring2' }
RGEnvironment >> nonClassNames [

	"TODO:"
	^ #()
]
