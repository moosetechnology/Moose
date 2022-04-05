Class {
	#name : #MooseMetaExplorer,
	#superclass : #GLMBrowserTemplate,
	#category : #'Moose-Finder'
}

{ #category : #fame }
MooseMetaExplorer >> abstractFormattedNameOf: each [
	^ each isAbstract 
		ifTrue: [ Text string: each fullName attribute: TextEmphasis italic ]
		ifFalse: [ Text fromString: each fullName ]
]

{ #category : #building }
MooseMetaExplorer >> buildBrowser [
	browser := GLMTabulator new.
	browser title: 'Famix Explorer' translated.
	browser
		column: #hierarchy;
		column: #properties.
	browser transmit
		to: #hierarchy;
		andShow: [ :a | self hierarchyIn: a ].
	browser transmit
		to: #properties;
		from: #hierarchy;
		andShow: [ :a | 
			self relationsIn: a.
			self propertiesIn: a.
			self methodsIn: a.
			a
				onChangeOfPort: #activePresentation
				act: [ :presentation | 
					(presentation pane port: #activePresentation) value
						ifNotNil: [ :activePresentation | |port| port:=((browser paneNamed: #properties) port: #selection). port silentValue: nil. port value:nil ] ] ].
	browser transmit
		from: #properties port: #strongSelection;
		toOutsidePort: #propertyToSelect.
	browser transmit
		fromOutsidePort: #propertyToSelect;
		to: #hierarchy port: #selection;
		transformed: [ :property | property owner ].
	browser transmit
		fromOutsidePort: #propertyToSelect;
		to: #properties port: #selection.
	browser transmit
		from: #hierarchy;
		toOutsidePort: #selectedEntity.
	browser transmit
		fromOutsidePort: #entityToSelect;
		to: #hierarchy port: #selection.
	browser transmit
		from: #properties;
		toOutsidePort: #selectedAttribute.
	^ browser
]

{ #category : #private }
MooseMetaExplorer >> hierarchyIn: a [
	^ a tree
		title: 'Entities';
		display: [ :all | (all classes select: [ :each | each superclass = FM3Object instance ]) sorted: [ :x :y | x fullName < y fullName ] ];
		children: [ :c | c subclasses sorted: [ :x :y | x fullName < y fullName ] ];
		format: [ :each | self abstractFormattedNameOf: each ];
		tags: [ :each | each package ifNil: [ #() ] ifNotNil: [ each package name ] ];
		morphicSelectionAct: [ :list | list selection implementingClass browse ]
			icon: GLMUIThemeExtraIcons glamorousBrowse
			on: $b
			entitled: 'Browse implementation';
		morphicSelectionAct: [ :list | list selection inspect ] entitled: 'Inspect'
]

{ #category : #private }
MooseMetaExplorer >> methodsIn: a [
	a table
		title: [ :aFM3Class | aFM3Class implementingClass methods size asString , ' Methods' translated ];
		display: [ :aFM3Class | aFM3Class implementingClass methods ];
		sorted: [ :attribute1 :attribute2 | attribute1 name < attribute2 name ];
		column: 'name'
			evaluated: [ :each | 
			each compiledMethod
				ifNil: [ each name ]
				ifNotNil: [ each compiledMethod isDeprecated ifTrue: [ each name asText addAttribute: TextEmphasis struckOut ] ifFalse: [ each selector ] ] ]
			tags: [ :each :aFM3Class | each methodClass ~= aFM3Class ifTrue: [ each methodClass name ] ifFalse: [ OrderedCollection new ] ];
		"column: 'input type'
			evaluated: [ :each | 
			each type name
				,
					(each isMultivalued
						ifTrue: [ ' *' ]
						ifFalse: [ '' ])
				,
					(each isDerived
						ifTrue: [ ' /' ]
						ifFalse: [ '' ]) ];
		column: 'return type' evaluated: [ :each | each opposite ifNil: [ '' ] ifNotNil: [ :opposite | opposite name ] ];
		"
			selectionPopulate: #strongSelection
			on: $o
			entitled: 'Open'
			with: [ :list | list selection opposite ];
		morphicSelectionAct: [ :list | Smalltalk tools browser openOnClass: list selection mmClass implementingClass selector: list selection implementingSelector ]
			icon: GLMUIThemeExtraIcons glamorousBrowse
			on: $b
			entitled: 'Browse implementation';
		morphicSelectionAct: [ :list | list selection inspect ]
			icon: GLMUIThemeExtraIcons glamorousInspect
			on: $i
			entitled: 'Inspect';
		morphicSelectionAct: [ :list | list selection explore ]
			icon: GLMUIThemeExtraIcons glamorousInspect
			on: $I
			entitled: 'Explore'
]

{ #category : #private }
MooseMetaExplorer >> propertiesIn: a [
	^ a table
		title: [ :aFM3Class | aFM3Class allPrimitiveProperties size asString , ' Properties' translated ];
		display: [ :aFM3Class | aFM3Class allPrimitiveProperties ];
		sorted: [ :attribute1 :attribute2 | attribute1 name < attribute2 name ];
		column: 'name'
			evaluated: [ :each | 
			each compiledMethod
				ifNil: [ each name ]
				ifNotNil: [ each compiledMethod isDeprecated ifTrue: [ each name asText addAttribute: TextEmphasis struckOut ] ifFalse: [ each name ] ] ]
			tags: [ :each :aFM3Class | each mmClass ~= aFM3Class ifTrue: [ each mmClass name ] ifFalse: [ OrderedCollection new ] ];
		column: 'type'
			evaluated:
				[ :each | each type name , (each isMultivalued ifTrue: [ ' *' ] ifFalse: [ '' ]) , (each isDerived ifTrue: [ ' /' ] ifFalse: [ '' ]) ];
		morphicSelectionAct: [ :list | Smalltalk tools browser openOnClass: list selection implementingClass selector: list selection implementingSelector ]
			icon: GLMUIThemeExtraIcons glamorousBrowse
			on: $b
			entitled: 'Browse implementation';
		morphicSelectionAct: [ :list | list selection inspect ] icon: (self iconNamed: #glamorousInspect) entitled: 'Inspect'
]

{ #category : #private }
MooseMetaExplorer >> relationsIn: a [
	a table
		title:
				[ :aFM3Class | aFM3Class allComplexProperties size asString , ' Relations' translated ];
		titleAction: [ :any |  ];
		display: [ :aFM3Class | aFM3Class allComplexProperties ];
		sorted: [ :attribute1 :attribute2 | attribute1 name < attribute2 name ];
		column: 'name'
			evaluated: [ :each | 
			each compiledMethod
				ifNil: [ each name ]
				ifNotNil: [ each compiledMethod isDeprecated
						ifTrue: [ each name asText addAttribute: TextEmphasis struckOut ]
						ifFalse: [ each name ] ] ]
			tags: [ :each :aFM3Class | 
				each mmClass ~= aFM3Class
					ifTrue: [ each mmClass name ]
					ifFalse: [ OrderedCollection new ] ];
		column: 'type'
			evaluated: [ :each | 
			each type name
				,
					(each isMultivalued
						ifTrue: [ ' *' ]
						ifFalse: [ '' ])
				,
					(each isDerived
						ifTrue: [ ' /' ]
						ifFalse: [ '' ]) ];
		column: 'opposite'
			evaluated:
				[ :each | each opposite ifNil: [ '' ] ifNotNil: [ :opposite | opposite name ] ];
		selectionPopulate: #strongSelection
			on: $o
			entitled: 'Open'
			with: [ :list | list selection opposite ];
		morphicSelectionAct: [ :list | 
				Smalltalk tools browser
					openOnClass: list selection implementingClass
					selector: list selection implementingSelector ]
			icon: GLMUIThemeExtraIcons glamorousBrowse
			on: $b
			entitled: 'Browse implementation';
		morphicSelectionAct: [ :list | list selection inspect ]
			icon: GLMUIThemeExtraIcons glamorousInspect
			on: $i
			entitled: 'Inspect';
		morphicSelectionAct: [ :list | list selection inspect ]
			icon: GLMUIThemeExtraIcons glamorousInspect
			on: $I
			entitled: 'Explore'
]
