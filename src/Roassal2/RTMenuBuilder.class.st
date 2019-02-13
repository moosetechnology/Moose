"
A RTMenuBuilder create menus, submenus, buttons in a view.
Titles, callback, colors and callback can be defined.

Instance Variables
	parentMenus:		<Object>

parentMenus
	- xxxxx

"
Class {
	#name : #RTMenuBuilder,
	#superclass : #RTBuilder,
	#instVars : [
		'parentMenus',
		'closingSubmenuFlag'
	],
	#category : #'Roassal2-Builder-Menu'
}

{ #category : #public }
RTMenuBuilder class >> setGraphMenuOn: view [
	| builder |
	builder := self new view: view.
	builder
		menu: 'Find'
		background: Color blue
		callback: [ | element |
			element := TRPlatform current 
				dialogChooseFrom: (view elements collect: #model)
				values: view elements.
			element notNil
				ifTrue: [
					view canvas camera translateTo: element position.
					RTBlink on: element ] ].
]

{ #category : #hooks }
RTMenuBuilder >> addParentMenu: aRTMenu [
	parentMenus add: aRTMenu.
]

{ #category : #signalling }
RTMenuBuilder >> configureViewEvents [
	view when: TRMouseClick do: [ :evt | | anim |
			anim := RTNopAnimation new
				waitFor: 0.1 after: [
					closingSubmenuFlag ifTrue: [  
						parentMenus ifNotEmpty: [parentMenus first hideAll].
						view signalUpdate.
						]
					].
					view addAnimation: anim.
				 view signalUpdate].
	view when: TRMouseEnter do: [ :evt | closingSubmenuFlag := true].

	view when: TRMouseLeave do: [ :evt | closingSubmenuFlag := false].
]

{ #category : #utility }
RTMenuBuilder >> createParentMenu: aTitle [
	
	^ self createParentMenu: aTitle background: (Color gray darker alpha: 0).
]

{ #category : #utility }
RTMenuBuilder >> createParentMenu: aTitle background: aColor [

	^ self createParentMenu: aTitle background: aColor highlightColor: (aColor alpha: (aColor alpha + 0.2)).
]

{ #category : #utility }
RTMenuBuilder >> createParentMenu: aTitle background: aColor highlightColor: aColor2 [
	| lbl index menu |
	
	index := view canvas fixedShapes 
						inject: 0 into: [ :s :e | s max: (e encompassingRectangle topRight x + 10) ].
						
	lbl := TRLabelShape new text: aTitle; translateLeftTo: (index +20) @ 20.
	lbl color: Color black.
	view canvas addFixedShape: lbl.
	
	menu := RTMenu new view: view; label: lbl; menuLabelBackgroundShapeAndColor: aColor; menuBackgroundColor: aColor; highlightColor: aColor2.
	self addParentMenu: menu.
	lbl element: (menu).
	
	lbl element labelBackground when: TRMouseEnter do: [ :event | self enterSubmenuOf: lbl].
	lbl element labelBackground when: TRMouseClick do: [ :e | self showSubmenuOf: lbl].
	
	lbl element labelBackground when: TRMouseLeave do: [ :e |	
		| anim |
		lbl element isLocked ifFalse: [ 
			anim := RTNopAnimation new
				waitFor: 0.1 after: [ 
					closingSubmenuFlag ifTrue: [ 
						lbl element hideItems.
						lbl element endHighlight
						]
					].
			view addAnimation: anim.
			self signalUpdate.
			]
		].
		
	^ lbl
]

{ #category : #utility }
RTMenuBuilder >> createParentMenu: aTitle highlight: aColor [

	^ self createParentMenu: aTitle background: (Color gray darker alpha: 0) highlightColor: aColor.
]

{ #category : #hooks }
RTMenuBuilder >> createView [
	^ RTView new.
]

{ #category : #utility }
RTMenuBuilder >> enterSubmenuOf: lbl [
	| menu labels|
	
	menu := lbl element.
	
	"We mark the submenu as open" 
	(menu isLocked) ifTrue: [ ^ self signalUpdate].
	menu hideAll.
	menu isLocked: false.
	menu isOpen: true.
	
	menu executeHighlight.
	
	labels := menu items collect: [ :item | | m |
		m := nil.
		m := self menu: item label 
			background: Color transparent 
			highlightColor: Color transparent 
			callback: [ 
			item execute: m.
			menu isLocked ifFalse: [ menu hideAll ] ].
		item menu: m.
		m ].

	labels doWithIndex: [ :l :i | | p |
		p := ((lbl position x) + (l width/2) - (lbl width/2) + 5)@(lbl position y + (l height*i) +3.5).
		l translateTo: p.
	].

	menu update.
	self signalUpdate.
		
	lbl element menuBackground when: TRMouseEnter do: [ :e | 
				closingSubmenuFlag := false.
				self signalUpdate].
			
	lbl element menuBackground when: TRMouseLeave do: [ :e | 
			| anim |
			closingSubmenuFlag := true.
			anim := RTNopAnimation new
				waitFor: 0.1 after: [ 
					lbl element isLocked ifFalse: [
						closingSubmenuFlag ifTrue: [  
							lbl element hideItems.
							lbl element endHighlight.
							]
						]
					].
			view addAnimation: anim.
			self signalUpdate
			].
]

{ #category : #hooks }
RTMenuBuilder >> initialize [

	closingSubmenuFlag := false.
	super initialize.
	parentMenus := OrderedCollection new.
	
]

{ #category : #utility }
RTMenuBuilder >> leaveSubmenuOf: lbl [
	| menu |
		menu := lbl element.
		menu hideItems.
		menu labelBackgroundColor: (menu savedLabelBackgroundColor).
		self signalUpdate.
]

{ #category : #public }
RTMenuBuilder >> menu: aTitle background: aColor callback: callback [ 
	"Return a trachel shape, in which the callback has been set up"
	^ self menu: aTitle background: aColor highlightColor:  (aColor alpha: (aColor alpha + 0.2)) callback: callback. 
]

{ #category : #public }
RTMenuBuilder >> menu: aTitle background: aColor highlightColor: aColor2 callback: callback [ 
	"Return a trachel shape, in which the callback has been set up"
	| lbl index |
	
	self configureViewEvents.
	
	index := view canvas fixedShapes 
						inject: 0 into: [ :s :e | s max: (e encompassingRectangle topRight x + 10) ].
	lbl := TRLabelShape new text: aTitle; translateLeftTo: (index +20) @ 20.
	lbl color: Color black.
	view canvas addFixedShape: lbl.
	lbl element: (RTMenu new view: view; label: lbl; menuBackgroundColor: aColor; buttonLabelBackgroundShapeAndColor: aColor; highlightColor: aColor2 ).
	
	lbl when: TRMouseClick do: [ :event | lbl element hideAll. callback value. ].
	lbl when: TRMouseEnter do: [ :event | closingSubmenuFlag := false. lbl element executeHighlight; executeTextHighlight. self signalUpdate. ].
	lbl when: TRMouseLeave do: [ :event | lbl element endHighlight. self signalUpdate. ].

	^ lbl
]

{ #category : #public }
RTMenuBuilder >> menu: aTitle callback: callback [
	"Return a trachel shape, in which the callback has been set up"
	"callback is a zero-arg block, without argument therefore"
	^ self menu: aTitle background: (Color gray darker alpha: 0) callback: callback.
]

{ #category : #public }
RTMenuBuilder >> menu: aTitle highlight: aColor callback: callback [ 
	"Return a trachel shape, in which the callback has been set up"
	"callback is a zero-arg block, without argument therefore"
	^ self menu: aTitle background: (Color gray darker alpha: 0) highlightColor: aColor callback: callback. 
]

{ #category : #public }
RTMenuBuilder >> menu: aTitle subcheckmenu: menuname background: color callback: callback [
	| checkmenu |
	checkmenu := nil.
	checkmenu := self
		 menu: aTitle
		 submenu: menuname
		 background: color
		 callback: [ 
			checkmenu selected: checkmenu selected not.
			callback value: checkmenu].
	checkmenu after: [ :menu | 
		menu text: checkmenu label.
		self signalUpdate].
	^ checkmenu.
]

{ #category : #public }
RTMenuBuilder >> menu: aTitle subcheckmenu: menuname callback: callback [
	| checkmenu |
	checkmenu := nil.
	checkmenu := self
		 menu: aTitle
		 submenu: menuname
		 callback: [ 
			checkmenu selected: checkmenu selected not.
			callback value: checkmenu].
	checkmenu after: [ :menu | 
		menu text: checkmenu label.
		self signalUpdate].
	^ checkmenu.
]

{ #category : #public }
RTMenuBuilder >> menu: aTitle subcheckmenus: menus background: color [
	"format for menus
	{'Title'->[:m | do something ]}"
	^ menus collect: [ :m |
		self menu: aTitle subcheckmenu: m key background: color callback: m value.
		 ].
]

{ #category : #public }
RTMenuBuilder >> menu: aTitle submenu: aSubMenuName background: aColor callback: callback [
	| parentMenu menuItem |
	
	parentMenu := (self parentMenus) detect: [ :m | m label text = aTitle] ifFound: [:m | m label] ifNone: [parentMenu := self createParentMenu: aTitle background: aColor].
	
	menuItem := RTMenuItem new name: aSubMenuName; callback: callback; color: aColor.
	parentMenu element add: menuItem.
	^ menuItem.
]

{ #category : #public }
RTMenuBuilder >> menu: aTitle submenu: aSubMenuName background: aColor highlightColor: aColor2 callback: callback [
	| parentMenu menuItem |
	
	parentMenu := (self parentMenus) detect: [ :m | m label text = aTitle] ifFound: [:m | m label] ifNone: [parentMenu := self createParentMenu: aTitle background: aColor highlightColor: aColor2].
	
	menuItem := RTMenuItem new name: aSubMenuName; callback: callback; color: aColor.
	parentMenu element add: menuItem.
	^ menuItem.
]

{ #category : #public }
RTMenuBuilder >> menu: aTitle submenu: aSubMenuName callback: callback [
	| parentMenu menuItem |
	
	parentMenu := (self parentMenus) detect: [ :m | m label text = aTitle] ifFound: [:m | m label] ifNone: [parentMenu := self createParentMenu: aTitle].
	
	menuItem := RTMenuItem new name: aSubMenuName; callback: callback.
	parentMenu element add: menuItem.
	^ menuItem.
]

{ #category : #public }
RTMenuBuilder >> menu: aTitle submenus: menus background: aColor [
	^ menus collect: [ :m | 
		self menu: aTitle submenu: m key background: aColor callback: m value].
]

{ #category : #hooks }
RTMenuBuilder >> parentMenus [
	^ parentMenus
]

{ #category : #utility }
RTMenuBuilder >> showSubmenuOf: lbl [
	| menu  labels |
	menu := lbl element.
	
	"Check if submenu is locked"
	menu isLocked
		ifTrue: [ 
			menu hideItems.
			menu endHighlight.
			self signalUpdate.
			 ^ self].
		
	"We mark the submenu as locked" 
	menu isLocked: true.
	menu executeLockHighlight.
	menu isOpen
		ifFalse: [ 
	
	"We mark the submenu as open" 
		menu hideAll.
		menu isOpen: true.

		menu executeLockHighlight.
	
		labels := menu items collect: [ :item | | m |
			m := nil.
			m := self menu: item label background: (Color white alpha:0) callback: [item execute: m].
			item menu: m.
			m 
		].

		labels doWithIndex: [ :l :i | | p |
			p := ((lbl position x) + (l width/2) - (lbl width/2) + 5)@(lbl position y + (l height*i) +3.5).
			l translateTo: p.
		].
	menu update.
	].
	
	self signalUpdate.

]

{ #category : #signalling }
RTMenuBuilder >> signalUpdate [
	view canvas signalUpdate
]
