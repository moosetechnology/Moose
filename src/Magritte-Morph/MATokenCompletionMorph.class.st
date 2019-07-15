Class {
	#name : #MATokenCompletionMorph,
	#superclass : #MAListMorph,
	#category : #'Magritte-Morph-Model'
}

{ #category : #'private-building' }
MATokenCompletionMorph >> buildMorphView [

	self flag: 'Obviously, the inline conditionals are horrifying. I think the nil check will go away if we set a default value'.
	^ TokenCollectorMorph new
			hResizing: #spaceFill;
			borderColor: #inset;
			borderWidth: 1;
			options: self options;
			objects: (self magritteDescription isMultiple
				ifTrue: [ self value copy ]
				ifFalse: [ self value copy ifNotNil: [ :v | { v } ] ifNil: [ OrderedCollection new ] ]);
			whenObjectsChanged: [ :e | 
				self magritteDescription isMultiple
					ifTrue: [ self value: e ]
					ifFalse: [ self value: e first ] ];
			factory: self magritteDescription initializer;
			yourself
]
