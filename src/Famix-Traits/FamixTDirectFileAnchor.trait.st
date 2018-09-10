Trait {
	#name : #FamixTDirectFileAnchor,
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTDirectFileAnchor classSide >> annotation [

	<MSEClass: #TDirectFileAnchor super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTDirectFileAnchor classSide >> generatedSlotNames [
	<generated>
	'FamixTDirectFileAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTDirectFileAnchor classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTDirectFileAnchor >> sourceText [
	(self startLine isNil and: [ self endLine isNil ]) ifTrue: [ ^ self completeText ].
	
	self sourcesAreReadable ifFalse: [ ^ '' ].
	
	^ self fileReference
		binaryReadStreamDo: [ :in | 
			String
				streamContents: [ :s | 
					[ FAMIXFileAnchorReader readStream: ((ZnCharacterReadStream on: (ZnBufferedReadStream on: in) encoding: self encoding)) for: self into: s ]
						on: MessageNotUnderstood
						do: [ self endLine: nil.
							s ] ] ]
]
