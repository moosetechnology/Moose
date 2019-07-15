Extension { #name : #PPPossessiveRepeatingParser }

{ #category : #'*PetitIndent' }
PPPossessiveRepeatingParser >> aligned [
	"
		self indentationLevel push,
			parser aligned,
			(#space star, parser aligned) star
		self indentationLevel pop	
	"
	
	^ (self indentationLevel push, 
		((((min == 0) ifTrue: [ parser aligned optional ] ifFalse: [ parser aligned ]),
		 ((#space asParser star, parser aligned) and,  
		  (#space asParser star, parser aligned) ==> [:nodes | nodes second second ]) star) 
		 ==> [:nodes | 
				nodes first ifNil: [ #() ] ifNotNil: [ 
				((OrderedCollection with: nodes first) addAll: nodes second; yourself) asArray ] ]),
	   self indentationLevel pop) ==> #second name: 'aligned'; yourself

]
