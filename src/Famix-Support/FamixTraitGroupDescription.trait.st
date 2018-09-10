Trait {
	#name : #FamixTraitGroupDescription,
	#category : #'Famix-Support'
}

{ #category : #'as yet unclassified' }
FamixTraitGroupDescription classSide >> add: aTraitGroupMemeber to: aView [

	| group slots |

	group := FamixTraitGroupDescription traitGroupOf: aTraitGroupMemeber.

	slots := Set new.
	group do: [ :aTrait |
	(aTrait slots select: #isFMRelationSlot) do: [ :aSlot |
			(slots includes: (aSlot inverseName asString -> aSlot name asString))
				ifFalse: [ slots add: (aSlot name asString -> aSlot inverseName asString) ]] ].
	
	aView
		classname: [ :each | each name withoutPrefix: 'FamixT' ];
		instanceVariables: [:each | each slots collect: #name].
	aView attributeShape color: Color black.
	aView methodShape color: Color black.
	aView classNameShape color: Color black.
	aView lineShape color: Color black.
	aView boxShape borderColor: Color black.
	aView
		layout packed.
		aView addObjects: group.
	aView shape line
		color: Color blue;
		withHorizontalAttachPoint.
	aView edgesDo: [ :edges | 
		group do: [ :each | 
			slots do: [ :aSlot |
				edges connectFrom: aSlot key to: aSlot value. ] ] ].
	^ aView.
]

{ #category : #'as yet unclassified' }
FamixTraitGroupDescription classSide >> groupRepresentatives [

	| allTraits representatives grouped |
	
	allTraits := 'Famix-Traits' asPackage definedClasses select: #isTrait.
	representatives := Set new.
	grouped := Set new.
	
	allTraits do: [ :each |
		(grouped includes: each) ifFalse: [ 
			representatives add: each.
			grouped addAll: (self traitGroupOf: each) ]].
	
	^ representatives asSortedCollection: [ :a :b | (self traitGroupNameOf: a) <= (self traitGroupNameOf: b) ]
	
	
]

{ #category : #planttext }
FamixTraitGroupDescription classSide >> isContainer: aSlot [

	^ (aSlot definingClass methodNamed: aSlot name) hasPragmaNamed: #container
]

{ #category : #'world menu' }
FamixTraitGroupDescription classSide >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'Famix traits groups')
		order: 1.0; 
		parent: #Moose;
		label: 'Famix trait groups';
		help: 'Famix traits groups browser';
		action:[ self openGroupsBrowser];
		withSeparatorAfter
]

{ #category : #planttext }
FamixTraitGroupDescription classSide >> normalizeName: aString [

	^ aString withoutPrefix: 'FamixT'
]

{ #category : #'as yet unclassified' }
FamixTraitGroupDescription classSide >> openGroupsBrowser [

	| data browser |
	
	<script>
	
	data := FamixTraitGroupDescription groupRepresentatives.

	browser := GLMTabulator new.
	browser 
		column: #traits;
		column: #uml.
	browser transmit to: #traits; andShow: [ :a |
		a tree
			format: [ :x | self traitGroupNameOf: x]].
	browser transmit to: #uml; from: #traits; andShow: [ :a | 
			a roassal2 
				initializeView: [ RTUMLClassBuilder new ];
				painting: [ :view :input | 
					FamixTraitGroupDescription add: input to: view.
				 ] ].
	browser openOn: data.
	

]

{ #category : #planttext }
FamixTraitGroupDescription classSide >> plantTextForAllTraits [

	^ String streamContents: [ :s |
		FamixTraitGroupDescription groupRepresentatives do: [ :each |
			FamixTraitGroupDescription 
				printPlantTextOf: each to: s ] ]
]

{ #category : #planttext }
FamixTraitGroupDescription classSide >> plantTextStringOf: aTraitGroupMemeber [

	^ String streamContents: [ :s | 
		self printPlantTextOf: aTraitGroupMemeber to: s
	]
]

{ #category : #planttext }
FamixTraitGroupDescription classSide >> printPlantTextOf: aTraitGroupMemeber to: s [

		| group slots processedSlots |
		
		group := FamixTraitGroupDescription traitGroupOf: aTraitGroupMemeber.

		slots := Set new.
		group do: [ :aTrait |
			(aTrait slots select: #isFMRelationSlot) do: [ :aSlot |
				(slots includes: (aSlot inverseName asString -> aSlot name asString))
					ifFalse: [ slots add: (aSlot name asString -> aSlot inverseName asString) ]] ].

		s << '@startuml'; lf.
		s << 'skinparam shadowing false'; lf.
		s << 'skinparam monochrome true'; lf.
		
		s << 'skinparam class {
	BackgroundColor White
}'; lf.
		s << 'hide empty members'; lf.
		
		group do: [ :aTrait |
			s << 'class ' << (self normalizeName: aTrait name); << ' << (T,orchid) >> {'; lf.
			(aTrait localMethods select: [ :e | e hasPragmaNamed: #MSEProperty:type: ]) do: [ :propertyMethod |
				s tab; << '+'; << propertyMethod selector.
				(propertyMethod hasPragmaNamed: #derived) ifTrue: [
					s << '()' ].
				s lf].
			s << ' }'; lf ].

		processedSlots := Set new.

		group do: [ :aTrait |
			(aTrait slots select: #isFMRelationSlot) do: [ :aSlot |
				
				(processedSlots includes: aSlot) ifFalse: [ 
				
				s << (self normalizeName: aSlot definingClass name).
				s << ' "'.
				aSlot inverseSlot isToOneSlot ifFalse: [ s << '* ' ].
				s << aSlot inverseSlot name ; << '" '.
				
				(self isContainer: aSlot inverseSlot) 
					ifTrue: [ s << 'o' ].
				s << '--'.
				(self isContainer: aSlot) 
					ifTrue: [ s << 'o' ].
				
				s << ' "'.
				aSlot isToOneSlot ifFalse: [ s << '* ' ].
				s << aSlot name ; << '" '.				
				s << (self normalizeName: aSlot inverseSlot definingClass name); lf.
				
				processedSlots addAll: { aSlot. aSlot inverseSlot }.
				 ] ] ].
				
		s << '@enduml'; lf

]

{ #category : #'as yet unclassified' }
FamixTraitGroupDescription classSide >> traitGroupNameOf: groupRepresentative [

	| traits |
	
	traits := self traitGroupOf: groupRepresentative.
	
	^ (traits detectMin: [ :each | each name size ]) name withoutPrefix: #FamixT
]

{ #category : #'as yet unclassified' }
FamixTraitGroupDescription classSide >> traitGroupOf: aTrait [

	| unresolved resolved |

	unresolved := IdentitySet new.
	resolved := IdentitySet new.
	unresolved add: aTrait.

	[	unresolved := unresolved copyWithoutAll: resolved.
		unresolved isEmpty ] whileFalse: [ 
			unresolved copy do: [ :trait |
				resolved add: trait.
				unresolved addAll: ((trait slots select: #isFMRelationSlot) collect: #targetClass) ] ].

	^ resolved.


]

{ #category : #'as yet unclassified' }
FamixTraitGroupDescription classSide >> viewOf: aTraitGroupMemeber [

	| aView |
	
	aView := RTUMLClassBuilder new.
	^ self add: aTraitGroupMemeber to: aView

]
