"
RTSunburstBuilderExamples new installTitle: 'basic15' 
		code:
		'
	| b |
	b := RTSunburstBuilder new.
	b strategy: (RTSunburstExtentStrategy new extent: 800@800).
	b shape colorElement: [ :el | el model subclasses isEmpty ifTrue: [ Color purple ] ifFalse: [ Color lightGray ] ].

	b explore: Morph using: #subclasses.
	b view @ RTDraggableView.
	b build.
	^ b view'
	
"
Class {
	#name : #RTSunburstBuilderExamples,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-Builder-Sunburst'
}

{ #category : #examples }
RTSunburstBuilderExamples >> basic1 [
	<gtExample>
	
	"
	self new basic1
	"
	| b|
	b := RTSunburstBuilder new.
	b explore: 1 using: [ :n | 
		n< 4 
			ifTrue: [ Array with: n + 1 with: n + 2 ] 
			ifFalse: [ #( ) ] ].
	^ b
]

{ #category : #examples }
RTSunburstBuilderExamples >> basic10 [
	<gtExample>
	
	"
	self new basic10
	"	
	| b |
	b := RTSunburstBuilder new.
	b layout sunburstWithRadius: 100.
	b shape color: [ :cls | 
		cls subclasses isEmpty 
			ifTrue: [ Color red ] 
			ifFalse: [ Color orange ] ].
	
	b
		radialSpacing: 10;
		angularSpacing: 2;
		explore: TREvent using: #subclasses.

	^ b
]

{ #category : #examples }
RTSunburstBuilderExamples >> basic11 [
	<gtExample>
	
	"
	self new basic11
	"	
	| b |
	b := RTSunburstBuilder new.
	b layout sunburstWithRadius: 100.
	b strategy radialSpacing:10.
	b shape current color: [ :cls | 
		(cls inheritsFrom: TREvent)
			ifTrue: [ Color lightGray ]
			ifFalse: [ Color blue ] ].
	b
		angularSpacing: 1; 
		from: (Array with: TREvent with: RTInteraction) using: #subclasses.
	^ b
]

{ #category : #examples }
RTSunburstBuilderExamples >> basic12 [
	<gtExample>
	
	"
	self new basic12
	"	
	| b |
	b := RTSunburstBuilder new.
	b layout sunburstWithRadius: 100.
	b strategy radialSpacing:10.
	b shape current color: [ :cls | 
		(cls inheritsFrom: TREvent)
			ifTrue: [ Color lightGray ]
			ifFalse: [ Color blue ] ].
	b
		angularSpacing: 1; 
		hasCenter: false;
		from: (Array with: TREvent with: RTInteraction) using: #subclasses.
	^ b
]

{ #category : #examples }
RTSunburstBuilderExamples >> basic13 [
	<gtExample>
	
	"
	self new basic13
	"	
	| b mt |
	b := RTSunburstBuilder new.
	b radialSpacing: 1.
	b interaction addInteraction: RTSBFadeInteraction new.
	b shape current 
				color: [ :m | m subclasses notEmpty ifTrue: [ Color orange ] ifFalse: [ Color red ] ].
				
	mt := TRPlatform current morphClass.
	b explore: mt using: #subclasses.
	b view canvas focusOnCenterScaled.
	^ b
]

{ #category : #examples }
RTSunburstBuilderExamples >> basic14 [
	<gtExample>
	
	"
	self new basic14
	"
	| b mt |
	b := RTSunburstBuilder new.
	b layout sunburstWithRadius: 100.
	b radialSpacing: 1.
	b interaction addInteraction: RTSBFadeInteraction new.
	b shape color: [ :m | m subclasses notEmpty 
		ifTrue: [ Color lightGray ] 
		ifFalse: [ Color purple ] ].
				
	mt := TRPlatform current morphClass.
	b explore: mt using: #subclasses.
	b view canvas focusOnCenterScaled.
	^ b
]

{ #category : #examples }
RTSunburstBuilderExamples >> basic15 [
	<gtExample>
	
	"
	self new basic15
	"
	| b mt |
	b := RTSunburstBuilder new.
	b layout sunburstWithArcWidth: 30.
	b 
		radialSpacing: 2;
		angularSpacing: 1.
	
	b interaction addInteraction: RTSBFadeInteraction new.
	b shape color: [ :m | m subclasses notEmpty 
		ifTrue: [ Color orange ] 
		ifFalse: [ Color red ] ].
				
	mt := TRPlatform current morphClass.
	b explore: mt using: #subclasses.
	b view canvas focusOnCenterScaled.
	^ b
]

{ #category : #examples }
RTSunburstBuilderExamples >> basic2 [
	<gtExample>
	
	"
	self new basic2
	"
	| b|
	b := RTSunburstBuilder new.
	b
		explore: 1
		using: [ :n | n< 4 
			ifTrue: [ Array with: n + 1 with: n + 2 ] 
			ifFalse: [ #( ) ] ].
	b hasCenter: false.
	b radialSpacing: 0.
	^ b
]

{ #category : #examples }
RTSunburstBuilderExamples >> basic3 [
	<gtExample>
	
	"
	self new basic3
	"	
	| b |
	b := RTSunburstBuilder new.
	b shape current 
		colorElement: [ :el | Color grayScale256: ((el attributeAt: #depth ifAbsent: [ 0 ]) * 30) ].

	b explore: RTObject using: #subclasses.
	^ b
]

{ #category : #examples }
RTSunburstBuilderExamples >> basic4 [
	<gtExample>
	"
	self new basic4
	"	
	| b |
	b := RTSunburstBuilder new.
	b shape color: [ :cls | 
		cls subclasses isEmpty 
			ifTrue: [ Color red ] 
			ifFalse: [ Color orange ] ].
	
	b
		radialSpacing: 10;
		angularSpacing: 2;
		explore: TREvent using: #subclasses.

	^ b
]

{ #category : #examples }
RTSunburstBuilderExamples >> basic5 [
	<gtExample>
	"
	self new basic5
	"	
	| b |
	b := RTSunburstBuilder new.
	b strategy radialSpacing:10.
	b shape current color: [ :cls | 
		(cls inheritsFrom: TREvent)
			ifTrue: [ Color lightGray ]
			ifFalse: [ Color blue ] ].
	b
		angularSpacing: 1; 
		from: (Array with: TREvent with: RTInteraction) using: #subclasses.
	^ b
]

{ #category : #examples }
RTSunburstBuilderExamples >> basic6 [
	<gtExample>
	"
	self new basic6
	"	
	| b |
	b := RTSunburstBuilder new.
	b strategy radialSpacing:10.
	b shape current color: [ :cls | 
		(cls inheritsFrom: TREvent)
			ifTrue: [ Color lightGray ]
			ifFalse: [ Color blue ] ].
	b
		angularSpacing: 1; 
		hasCenter: false;
		from: (Array with: TREvent with: RTInteraction) using: #subclasses.
	^ b
]

{ #category : #examples }
RTSunburstBuilderExamples >> basic7 [
	<gtExample>
	"
	self new basic7
	"	
	| b|
	b := RTSunburstBuilder new.
	b layout sunburstWithRadius: 100.
	b explore: 1 using: [ :n | 
		n< 4 
			ifTrue: [ Array with: n + 1 with: n + 2 ] 
			ifFalse: [ #( ) ] ].
	^ b
]

{ #category : #examples }
RTSunburstBuilderExamples >> basic8 [
	<gtExample>
	"
	self new basic8
	"	
	| b|
	b := RTSunburstBuilder new.
	b layout sunburstWithRadius: 100.
	b
		explore: 1
		using: [ :n | n< 4 
			ifTrue: [ Array with: n + 1 with: n + 2 ] 
			ifFalse: [ #( ) ] ].
	b hasCenter: false.
	b radialSpacing: 0.
	^ b
]

{ #category : #examples }
RTSunburstBuilderExamples >> basic9 [
	<gtExample>
	"
	self new basic9
	"	
	| b |
	b := RTSunburstBuilder new.
	b layout sunburstWithRadius: 100.
	b shape current 
		colorElement: [ :el | Color grayScale256: ((el attributeAt: #depth ifAbsent: [ 0 ]) * 30) ].

	b explore: RTObject using: #subclasses.
	^ b
]

{ #category : #sources }
RTSunburstBuilderExamples >> exampleBasic [
	<gtExample>
	
	| b |
	b := RTSunburstBuilder new.
	b radialSpacing: 10.
	b shape color: [ :cls | cls subclasses notEmpty 
		ifTrue: [ Color orange ] 
		ifFalse: [ Color red ] ].

	b explore: TRShape using: #subclasses.
	^ b
]

{ #category : #sources }
RTSunburstBuilderExamples >> exampleBasic2 [
	<gtExample>
	<iconSelectorBase64: #exampleBasic2Icon>
	
	| b data |
	data := Array 
		with: 'Chile' -> (Array with: 'Santiago' with: 'Iquique' )
		with: 'France' -> (Array with: 'Paris' with: 'Nice').
	b := RTSunburstBuilder new.

	b 
		explore: data 
		using: [ :o | 
			o class == Association 
				ifTrue: [ o value ] 
				ifFalse: [ o isString 
									ifTrue: [ #() ] 
									ifFalse:  [ o ] ] ].
	^ b
]

{ #category : #icons }
RTSunburstBuilderExamples >> exampleBasic2Icon [
	^ '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
/yA8x38BsksFStfXt2UAAAAASUVORK5CYII='
]

{ #category : #icons }
RTSunburstBuilderExamples >> exampleBasicIcon [
	^ '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'
]

{ #category : #sources }
RTSunburstBuilderExamples >> exampleCollectionSubclasses [
	<gtExample>
	<iconSelectorBase64: #exampleCollectionSubclassesIcon>
	
	| b |
	b := RTSunburstBuilder new.
	b layout sunburstWithRadius: 100.
	b 
		angularSpacing: 1;
		radialSpacing: 5.
	b shape color: [ :cls | cls subclasses notEmpty 
		ifTrue: [ Color orange ] 
		ifFalse: [ Color red ] ].

	b explore: Collection using: #subclasses.
	^ b
]

{ #category : #icons }
RTSunburstBuilderExamples >> exampleCollectionSubclassesIcon [
	^ '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'
]

{ #category : #sources }
RTSunburstBuilderExamples >> exampleFileSystem [
	<noTest>

	| b c1 c2 |
	b := RTSunburstBuilder new.
	
	c2 := Color r: 177/255.0 g: 175/255.0 b: 134/255.0.
	c1 := Color r: 98/255.0 g: 101/255.0 b: 73/255.0.
	
	b
		color: c2; 
		angularSpacing: 1;
		radialSpacing: 5;
		leafWeight: [:f | f size sqrt ];
		leafColor: c1;
		explore: TRPlatform current workingDirectory
		nesting: #directories
		leaves: #files.
			
	b view canvas camera scale: 1.5.
	^ b
]

{ #category : #sources }
RTSunburstBuilderExamples >> exampleFileSystem2 [
	<noTest>
	<iconSelectorBase64: #exampleFileSystem2Icon>
	
	| b c1 c2 |
	b := RTSunburstBuilder new.
	
	c2 := Color r: 177/255.0 g: 175/255.0 b: 134/255.0.
	c1 := Color r: 98/255.0 g: 101/255.0 b: 73/255.0.
	b interaction addInteraction: RTSBFadeInteraction new.
	b
		color: c2; 
		angularSpacing: 1;
		radialSpacing: 5;
		leafWeight: [:f | f size sqrt ];
		leafColor: c1;
		explore: TRPlatform current workingDirectory
		nesting: #directories
		leaves: #files.
			
	b view canvas camera scale: 1.5.
	^ b
]

{ #category : #icons }
RTSunburstBuilderExamples >> exampleFileSystem2Icon [
	^ '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
s58AAAAASUVORK5CYII='
]

{ #category : #icons }
RTSunburstBuilderExamples >> exampleFileSystemIcon [
	^ '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
V55W/z+4y7BrAdq4hgAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTSunburstBuilderExamples >> exampleMorphSubclasses [
	<gtExample>
	<iconSelectorBase64: #exampleMorphSubclassesIcon>
	
	| b |
	b := RTSunburstBuilder new.
	b layout sunburstWithRadius: 400.
	b color: [ :cls | cls subclasses isEmpty ifTrue: [ Color purple ] ifFalse: [ Color lightGray ] ].

	b explore: TRPlatform current morphClass using: #subclasses.
	^ b
]

{ #category : #icons }
RTSunburstBuilderExamples >> exampleMorphSubclassesIcon [
	^ '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'
]

{ #category : #sources }
RTSunburstBuilderExamples >> exampleOnNumbers [
	<gtExample>
	<iconSelectorBase64: #exampleOnNumbersIcon>
	
	| b|
	b := RTSunburstBuilder new.
	b
		color: [ :e | e < 5 
			ifTrue: [ Color gray ] 
			ifFalse: [Color blue] ].
	b 
		explore: 1 
		using: [ :n | n< 5 
			ifTrue: [ Array with: n + 1 with: n + 2 with: n+3 ] 
			ifFalse: [ #( ) ] ].
	^ b
]

{ #category : #icons }
RTSunburstBuilderExamples >> exampleOnNumbersIcon [
	^ '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
TkSuQmCC'
]

{ #category : #sources }
RTSunburstBuilderExamples >> exampleRTObjectSubclasses [
	<gtExample>
	<iconSelectorBase64: #exampleRTObjectSubclassesIcon>
	
	| b c1 c2 |
	b := RTSunburstBuilder new.
	b layout sunburstWithRadius: 100.
	c1 := Color r: 0/255.0 g: 100/255.0 b: 0/255.0.
	c2 := Color r: 73/255.0 g: 121/255.0 b: 107/255.0.
	b color: [ :cls | cls subclasses notEmpty 
		ifTrue: [ c2 ] ifFalse: [ c1 ] ].

	b explore: RTObject using: #subclasses.
	^ b
]

{ #category : #icons }
RTSunburstBuilderExamples >> exampleRTObjectSubclassesIcon [
	^ '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'
]

{ #category : #examples }
RTSunburstBuilderExamples >> label [
	^ 'Sunburst'
]
