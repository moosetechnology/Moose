"
This class encapsulates the logic of the system attraction view. It is applicable to a set of famix types.
"
Class {
	#name : #FAMIXSystemAttraction,
	#superclass : #Object,
	#instVars : [
		'classStrongColor',
		'classPaleColor',
		'methodStrongColor',
		'methodPaleColor',
		'attributeStrongColor',
		'attributePaleColor'
	],
	#category : #'Moose-RoassalPaintings'
}

{ #category : #rendering }
FAMIXSystemAttraction >> builAttributes: attributes in: view [
	view shape ellipse
		fillColor: attributeStrongColor;
		size: 6.
	view nodes: attributes
]

{ #category : #rendering }
FAMIXSystemAttraction >> buildClasses: classes in: view [
	view shape ellipse
		fillColor: classStrongColor;
		size: 10.
	view nodes: classes
]

{ #category : #rendering }
FAMIXSystemAttraction >> buildMethods: methods in: view [
	view shape ellipse
		fillColor: methodStrongColor;
		size: 6.
	view nodes: methods
]

{ #category : #initialization }
FAMIXSystemAttraction >> initialize [
	super initialize.
	classStrongColor := Color black.
	classPaleColor := Color r: 0.7 g: 0.7 b: 0.7.

	methodStrongColor := Color r: 1.0 g: 0.3 b: 0.3.
	methodPaleColor := Color r: 1.0 g: 0.7 b: 0.7.

	attributeStrongColor := Color r: 0.3 g: 0.3 b: 1.0.
	attributePaleColor := Color r: 0.7 g: 0.7 b: 1.0
]

{ #category : #rendering }
FAMIXSystemAttraction >> view: classes highlighting: strongClasses on: view [
	| methods attributes |

	methods := classes flatCollect: #methods.
	attributes := classes flatCollect: #attributes.

	view shape ellipse; size: 10; fillColor: [:each | 
		(strongClasses includes: each) 
			ifTrue: [ classStrongColor ]
			ifFalse: [ classPaleColor ] ].
	view interaction menu: #mooseMenu.
	view nodes: classes.
	view shape ellipse; size: 6; fillColor: [:each | 
		(strongClasses includes: each parentType) 
			ifTrue: [ methodStrongColor ]
			ifFalse: [ methodPaleColor ] ].
	view interaction menu: #mooseMenu.
	view nodes: methods.	
	view shape ellipse; size: 6; fillColor: [:each | 
		(strongClasses includes: each parentType) 
			ifTrue: [ attributeStrongColor ]
			ifFalse: [ attributePaleColor ] ].
	view interaction menu: #mooseMenu.
	view nodes: attributes.
	view shape line attachPoint: RTCenteredAttachPoint instance; color: [:each | 
		(strongClasses includes: each) 
			ifTrue: [ classPaleColor ]
			ifFalse: [ classPaleColor alpha: 0.3] ].
	view edges: classes from: #yourself to: #superclass.
	view shape line attachPoint: RTCenteredAttachPoint instance; color: [:each | 
		(strongClasses includes: each key) 
			ifTrue: [ classPaleColor alpha: 0.3 ]
			ifFalse: [ classPaleColor alpha: 0.3] ].
	view edges objects: classes ; connectFrom: #yourself toAll: #methods.
	view shape line attachPoint: RTCenteredAttachPoint instance; color: [:each | 
		(strongClasses includes: each key) 
			ifTrue: [ classPaleColor alpha: 0.3 ]
			ifFalse: [ classPaleColor alpha: 0.3] ].
	view edges objects: classes; connectFrom: #yourself toAll: #attributes.
	view shape line attachPoint: RTCenteredAttachPoint instance; color: [:each | 
		(strongClasses includes: each key parentType) 
			ifTrue: [ methodStrongColor alpha: 0.5 ]
			ifFalse: [ methodPaleColor alpha: 0.3] ].
	view edges objects: methods; connectFrom: #yourself toAll: #invokedMethods.
	view shape line attachPoint: RTCenteredAttachPoint instance; color: [:each | 
		(strongClasses includes: each key parentType) 
			ifTrue: [ attributeStrongColor alpha: 0.5 ]
			ifFalse: [ attributePaleColor alpha: 0.3] ].
	view edges objects: attributes; connectFromAll: #accessingMethods to: #yourself.
	view layout force
]

{ #category : #rendering }
FAMIXSystemAttraction >> view: classes on: view [
	self viewWithoutLayout: classes on: view.
	view layout force
]

{ #category : #rendering }
FAMIXSystemAttraction >> viewIsolated: classes on: view [
	| edges |
	edges := self viewWithoutLayout: classes on: view.
	view forceBasedLayout userDefinedEdges: edges
]

{ #category : #rendering }
FAMIXSystemAttraction >> viewWithoutLayout: classes on: view [
	| methods attributes edges |
	methods := classes flatCollect: #methods.
	attributes := classes flatCollect: #attributes.
	self buildClasses: classes in: view.
	self buildMethods: methods in: view.
	self builAttributes: attributes in: view.
	view shape line
		attachPoint: RTCenteredAttachPoint instance;
		color: (classStrongColor alpha: 0.5).
	edges := view edges
		source: classes
		connectFrom: #yourself
		to: #superclass.
	view shape line
		attachPoint: RTCenteredAttachPoint instance;
		color: (classPaleColor alpha: 0.5).
	edges := edges
		, (view edges source: classes connectFrom: #yourself toAll: #methods).
	view shape line
		attachPoint: RTCenteredAttachPoint instance;
		color: (classPaleColor alpha: 0.5).
	edges := edges
		, (view edges source: classes connectFrom: #yourself toAll: #attributes).
	view shape line
		attachPoint: RTCenteredAttachPoint instance;
		color: (methodStrongColor alpha: 0.5).
	view edges
		source: methods
		connectFrom: #yourself
		toAll: #invokedMethods.
	view shape line
		attachPoint: RTCenteredAttachPoint instance;
		color: (attributeStrongColor alpha: 0.5).
	attributes
		do: [ :each | 
			view edges
				source: each accessingMethods
				connectFrom: #yourself
				to: each ].
	^ edges
]
