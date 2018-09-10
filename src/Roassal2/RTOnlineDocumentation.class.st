Class {
	#name : #RTOnlineDocumentation,
	#superclass : #RTAbstractWorldMenu,
	#category : #'Roassal2-MorphSpecific-Menu'
}

{ #category : #'world menu' }
RTOnlineDocumentation class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'Online documentation')
			order: 0.001; 
			parent: #Roassal;
			label: 'Online documentation';
			help: 'opne the Roassal documentation in a web browser';
			icon: (Smalltalk ui icons iconNamed: #smallHelp);
			action: [ WebBrowser openOn: 'http://AgileVisualization.com' ]
]

{ #category : #'instance creation' }
RTOnlineDocumentation >> addAnimationTo: v [
	| e |
	v when: TRMouseClick do: [ :event | v clean ].
	v
		when: TRMouseMove
		do: [ :event | 
			e := (RTBox new
				color: (Color red alpha: 0.2);
				size: 20 atRandom + 5) element.
			e translateTo: event position.
			v add: e.
			v
				addAnimation:
					(RTAccelerationMove
						to: event position + ((150 atRandom - 75) @ (150 atRandom - 75))
						during: 5
						on: e) ]
]

{ #category : #'instance creation' }
RTOnlineDocumentation >> open [
	| v labels |
	v := RTView new.
	v add: (RTBitmap new form: TRPlatform current roassalIcon) element.
	labels := RTLabel
		elementsOn:
			#('Agile Visualization is about crafting interactive' 'visualizations in extremely short production cycle.' 'Roassal is a visualization engine that promotes' 'Agile Visualization.' '' 'A large body of documentation is available online: ').
	labels
		add:
			((RTLabel new color: Color veryVeryDarkGray)
				elementOn: 'http://AgileVisualization.com').
	labels
		addAll:
			(RTLabel
				elementsOn:
					#('A printed version and an eBook are available for sale.' '' '' 'We are deeply thankful to all of you involved' 'in the development of Roassal')).
	v add: labels.
	RTVerticalLineLayout on: labels.
	TRConstraint move: v elements first onTheLeftOf: labels.


	"Adding animation"
	self addAnimationTo: v.
	v openTitled: 'Roassal Visualization Engine'
]
