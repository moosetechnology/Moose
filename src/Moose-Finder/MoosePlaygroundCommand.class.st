Class {
	#name : #MoosePlaygroundCommand,
	#superclass : #GLMFallbackScrollListBrick,
	#category : #'Moose-Finder'
}

{ #category : #actions }
MoosePlaygroundCommand >> hideActionsOf: aRowBrick [
	aRowBrick subbricks select: [ :each | each isKindOf: GLMHintableActionButtonBrick ] thenDo: [ :each | each visible: false ]
]

{ #category : #initialization }
MoosePlaygroundCommand >> initialize [
	super initialize.
	
	self
		emptyBrick: self newEmptyText;
		maxHeight: 350;
		height: [ :b | b band height ];
		width: 250
]

{ #category : #'instance creation' }
MoosePlaygroundCommand >> newAcceptButtonFor: aPlayPage [
	^ self newActionButton
		hintTitle: 'Accept';
		hintText: 'add model in the playground';
		icon: (self iconNamed: #glamorousAccept);
		action: [ :b | 
			self remove.
			self announce: #pageAccepted event: aPlayPage ]
]

{ #category : #'instance creation' }
MoosePlaygroundCommand >> newActionButton [
	|margin padding|
	margin := self themer bindingThemer padding + self themer bindingThemer borderWidth.
	padding := (margin / 2) rounded.
	
	^ GLMHintableActionButtonBrick new
		padding: padding;
		visible: false;
		margin: { 0 . padding };
		hShrinkWrap;
		vAlign: #center;
		pressedColor: self themer buttonPressedColor
]

{ #category : #'instance creation' }
MoosePlaygroundCommand >> newEmptyText [

	^ GLMLabelBrick new
			text: 'No models loaded';
			hSpaceFill;
			textPosition: #center;
			padding: self themer bindingThemer emptyTextPadding;
			textColor: self themer bindingThemer emptyTextColor;
			fontSize: self themer bindingThemer emptyTextFontSize;
			yourself
]

{ #category : #'instance creation' }
MoosePlaygroundCommand >> newPageLabel [

	^ GLMLabelBrick new
		hSpaceFill;
		vShrinkWrap;
		textPosition: #leftCenter;
		vAlign: #center;
		padding: { 0 . self themer bindingThemer padding }
]

{ #category : #'instance creation' }
MoosePlaygroundCommand >> newPageRow: aMooseModel in: aGTPlayBook [

	^ self newRow
		addBrickBack: (self newPageLabel
			textColor: self themer textColor;
			text: (aMooseModel name asString contractTo: 50));
		addBrickBack: (self newAcceptButtonFor: aMooseModel);
		when: #onDoubleClicked do: [ self remove. self announce: #pageAccepted event: aMooseModel ];
		with: [ :aRow | aRow 	
			when: #onMouseHover do: [ self showActionsOf: aRow ];
			when: #onMouseUnhover do: [ self hideActionsOf: aRow ] ];
		yourself
]

{ #category : #'instance creation' }
MoosePlaygroundCommand >> newRow [
	^ GLMInteractableBrick new
		enable;
		enableDoubleClick;
		selectedColor: self themer bindingThemer selectedColor;
		vShrinkWrap;
		hSpaceFill;
		padding: self themer bindingThemer padding;
		paddingRight: 0
]

{ #category : #'instance creation' }
MoosePlaygroundCommand >> on: aMooseModel [
	|model|
	model := GLMBrickListModel new
		on: aMooseModel root.
	model
		morphAtLogic: [ :index | self newPageRow: (model origin at: index) in: aMooseModel ].
	self model: model
]

{ #category : #'brick-properties-events' }
MoosePlaygroundCommand >> onThemerChanged [
	super onThemerChanged.
	
	self doLayoutForce
]

{ #category : #actions }
MoosePlaygroundCommand >> remove [

	(self ownerThatIsA:  GLMFoundationBrick)
		ifNotNil: [ :o | o delete ]
]

{ #category : #actions }
MoosePlaygroundCommand >> showActionsOf: aRowBrick [
	aRowBrick subbricks select: [ :each | each isKindOf: GLMHintableActionButtonBrick ] thenDo: [ :each | each visible: true ]
]
