Extension { #name : #Object }

{ #category : #'*Magritte-Model' }
Object >> basicMagritteDescription [
	^ MAPragmaBuilder for: self
]

{ #category : #'*Magritte-Model' }
Object >> descriptionContainer [
	"Return the default description container."
	<magritteContainer>
	^ MAPriorityContainer new
		label: self class label;
		yourself
]

{ #category : #'*Magritte-Model' }
Object >> initializeMagritte [
	"Initializes the receiving object with the default values of its description."

	self magritteDescription do: [ :each |
		each isReadonly
			ifFalse: [ self write: each default using: each ] ]
]

{ #category : #'*Magritte-Model' }
Object >> isDescription [
	^ false
]

{ #category : #'*Magritte-Model' }
Object >> magritteActionDescriptions [

	^ self uniqueActionSelectors collect: [ :each | self perform: each ]
]

{ #category : #'*Magritte-Model' }
Object >> magritteDescription [
	|basicDescription builders|
	basicDescription := self basicMagritteDescription.
	^basicDescription
]

{ #category : #'*Magritte-Model' }
Object class >> magritteTemplate [
	"Allow subclasses to have a prototype instance for creating a Magritte description (especially reference description)."
	^self new
]

{ #category : #'*Magritte-Model' }
Object >> mementoClass [
	"Return a class to be used to remember or cache the receiver, namely a memento object."

	^ MACheckedMemento
]

{ #category : #'*Magritte-Model' }
Object >> readUsing: aDescription [
	"Dispatch the read-access to the receiver using the accessor of aDescription."

	^ aDescription accessor read: self
]

{ #category : #'*Magritte-Model' }
Object >> uniqueActionSelectors [

	| descriptionPragmas selectors |	
	descriptionPragmas := Pragma 
		allNamed: #magritteActionDescription
		from: self class to: Object.
		
	selectors := descriptionPragmas collect: [ :each | each method selector ].
	
	^ Set withAll: selectors
]

{ #category : #'*Magritte-Model' }
Object >> write: anObject using: aDescription [
	"Dispatch the write-access to the receiver of anObject using the accessor of aDescription."

	aDescription accessor write: anObject to: self
]
