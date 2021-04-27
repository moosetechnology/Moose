"
Description
--------------------

I am a browser to visualize current traits from famix.
"
Class {
	#name : #FamixTraitGroupVisualizationBrowser,
	#superclass : #Object,
	#category : #'Moose-Finder'
}

{ #category : #'world menu' }
FamixTraitGroupVisualizationBrowser class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ (MooseModel developerTool: self menuCommandOn: aBuilder)
		  order: 30;
		  help: 'Analyse usage of metamodel traits in metamodel concepts';
		  withSeparatorAfter;
		  yourself
]

{ #category : #'world menu' }
FamixTraitGroupVisualizationBrowser class >> menuLabel [
	^'Metamodel traits usage'
]

{ #category : #'instance creation' }
FamixTraitGroupVisualizationBrowser class >> open [
	<script>
	self new openGroupsBrowser
]

{ #category : #adding }
FamixTraitGroupVisualizationBrowser >> add: aTraitGroupMemeber to: aView [
	| group slots |
	group := self traitGroupOf: aTraitGroupMemeber.
	slots := Set new.
	group
		do: [ :aTrait | 
			(aTrait slots select: #isFMRelationSlot)
				do: [ :aSlot | 
					(slots includes: aSlot inverseName asString -> aSlot name asString)
						ifFalse: [ slots add: aSlot name asString -> aSlot inverseName asString ] ] ].
	aView
		classname: [ :each | each name withoutPrefix: 'FamixT' ];
		instanceVariables: [ :each | each slots collect: #name ].
	aView attributeShape color: Color black.
	aView methodShape color: Color black.
	aView classNameShape color: Color black.
	aView lineShape color: Color black.
	aView boxShape borderColor: Color black.
	aView layout packed.
	aView addObjects: group.
	aView shape line
		color: Color blue;
		withHorizontalAttachPoint.
	aView edgesDo: [ :edges | group do: [ :each | slots do: [ :aSlot | edges connectFrom: aSlot key to: aSlot value ] ] ].
	^ aView
]

{ #category : #accessing }
FamixTraitGroupVisualizationBrowser >> groupRepresentatives [
	| allTraits representatives grouped |
	allTraits := 'Famix-Traits' asPackage definedClasses select: #isTrait.
	representatives := Set new.
	grouped := Set new.
	allTraits
		do: [ :each | 
			(grouped includes: each)
				ifFalse: [ representatives add: each.
					grouped addAll: (self traitGroupOf: each) ] ].
	^ representatives asSortedCollection: [ :a :b | (self traitGroupNameOf: a) <= (self traitGroupNameOf: b) ]
]

{ #category : #'as yet unclassified' }
FamixTraitGroupVisualizationBrowser >> openGroupsBrowser [
	<script>
	| browser |
	browser := GLMTabulator new.
	browser
		column: #traits;
		column: #uml.
	browser transmit
		to: #traits;
		andShow: [ :a | a tree format: [ :x | self traitGroupNameOf: x ] ].
	browser transmit
		to: #uml;
		from: #traits;
		andShow: [ :a | 
			a roassal2
				initializeView: [ RTUMLClassBuilder new ];
				painting: [ :view :input | self add: input to: view ] ].
	browser openOn: self groupRepresentatives
]

{ #category : #accessing }
FamixTraitGroupVisualizationBrowser >> traitGroupNameOf: groupRepresentative [
	^ ((self traitGroupOf: groupRepresentative) detectMin: [ :each | each name size ]) name withoutPrefix: #FamixT
]

{ #category : #accessing }
FamixTraitGroupVisualizationBrowser >> traitGroupOf: aTrait [
	| unresolved resolved |
	unresolved := IdentitySet new.
	resolved := IdentitySet new.
	unresolved add: aTrait.
	[ unresolved := unresolved copyWithoutAll: resolved.
	unresolved isEmpty ]
		whileFalse: [ unresolved copy
				do: [ :trait | 
					resolved add: trait.
					unresolved addAll: ((trait slots select: #isFMRelationSlot) collect: #targetClass) ] ].
	^ resolved
]
