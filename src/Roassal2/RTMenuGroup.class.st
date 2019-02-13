"
I am a component to manage the selected/unselected state for the menu items. instance guarantees that only one menu item can be selected at a time.

Initially all butons managed by Button group instance are unselected

"
Class {
	#name : #RTMenuGroup,
	#superclass : #Object,
	#instVars : [
		'items'
	],
	#category : #'Roassal2-Builder-Menu'
}

{ #category : #public }
RTMenuGroup class >> on: menuitems [
	^ self new addAll: menuitems.
]

{ #category : #accessing }
RTMenuGroup >> add: menuitem [
	| after |
	items add: menuitem.
	
	after := menuitem after.
	menuitem after: [ :m |
		items do: [:item | item selected: false.
			item rawmenu ifNotNil: [item rawmenu text: item label.
				 item rawmenu signalUpdate] ].
		menuitem selected: true.
		after ifNotNil: [ after value: m ]. ].
]

{ #category : #accessing }
RTMenuGroup >> addAll: menuitems [
	menuitems do: [ :m | self add: m ].
]

{ #category : #initialization }
RTMenuGroup >> initialize [
	super initialize.
	items := OrderedCollection new: 2.
	
]
