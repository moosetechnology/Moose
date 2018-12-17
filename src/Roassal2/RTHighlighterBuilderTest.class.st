"
Test the class RTHighlitherBuilder
"
Class {
	#name : #RTHighlighterBuilderTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Builder-Highlighter'
}

{ #category : #tests }
RTHighlighterBuilderTest >> testBasic [

	| hb |
	hb := RTHighlighterBuilder new.
	self assert: hb view notNil.
	self assert: hb numberOfEntries equals: 0.
	self assert: hb filter equals: true.
	self assert: hb fontSize equals: RTLabel defaultFontSize
]

{ #category : #tests }
RTHighlighterBuilderTest >> testFading [

| b hb el |
b := RTMondrian new.
b nodes: (1 to: 10).
b normalizer normalizeSize: #yourself.
b build.

	hb := RTHighlighterBuilder new.
	hb view: b view.
	hb highlightColor: [ :nb | Color r: nb / 10 g: 0 b: 0 ].
	hb filter: [ :obj | obj isNumber ].
	hb addEntry: [ :number | true ] named: 'Highlight'.
	
	hb build.

b view.

	el := b view elementFromModel: 'Highlight'.
	el announce: TRMouseEnter.	
]

{ #category : #tests }
RTHighlighterBuilderTest >> testFading2 [

| b hb el |
b := RTMondrian new.
b nodes: (1 to: 10).
b normalizer normalizeSize: #yourself.
b build.

	hb := RTHighlighterBuilder new.
	hb view: b view.
	hb filter: [ :obj | obj isNumber ].
	hb addEntry: [ :number | true ] named: 'Highlight' highlightColor: [ :nb | Color r: nb / 10 g: 0 b: 0 ].
	
	hb build.

b view.

	el := b view elementFromModel: 'Highlight'.
	el announce: TRMouseEnter.	
]

{ #category : #tests }
RTHighlighterBuilderTest >> testFadingAndDefaultColor [

| b hb el |
b := RTMondrian new.
b nodes: (1 to: 10).
b normalizer normalizeSize: #yourself.
b build.

	hb := RTHighlighterBuilder new.
	hb view: b view.
	hb filter: [ :obj | obj isNumber ].
	hb addEntry: [ :number | number < 5 ] named: '<5' highlightColor: [ :nb | Color r: nb / 10 g: 0.8 b: 0.8 ].	

	hb addEntry: [ :number | number > 5 ] named: '>5' highlightColor: [ :nb | Color r: nb / 10 g: 0.8 b: 0.8 ] defaultColor: Color black.	
		
	hb build.

b view.

	el := b view elementFromModel: '<5'.
	el announce: TRMouseEnter.	
	
	el := b view elementFromModel: '>5'.
	el announce: TRMouseEnter.	
]

{ #category : #tests }
RTHighlighterBuilderTest >> testHighlightCompositeShape [

	| v s e hb originalColorLabel originalColorBox |
	v := RTView new.
	s := RTCompositeShape new.
	s add: RTLabel new.
	s add: RTBox new.
	e := s element.
	v add: e.
	
	hb := RTHighlighterBuilder new.
	hb view: v.
	hb addEntry: #isNil named: 'isNil'.
	hb build.
	
	originalColorLabel := e trachelShape shapes first color.
	originalColorBox := e trachelShape shapes second color.
	
	(v elementFromModel: 'isNil') announce: TRMouseEnter.
	self assert: e trachelShape shapes first color ~= originalColorLabel.
	self assert: e trachelShape shapes second color == originalColorBox.
]

{ #category : #tests }
RTHighlighterBuilderTest >> testHighlightCompositeShape2 [

	| v s e hb originalColorLabel originalColorBox |
	v := RTView new.
	s := RTCompositeShape new.
	s add: RTBox new.
	s add: RTLabel new.
	e := s element.
	v add: e.
	
	hb := RTHighlighterBuilder new.
	hb view: v.
	hb addEntry: #isNil named: 'isNil'.
	hb build.

	originalColorBox := e trachelShape shapes first color.	
	originalColorLabel := e trachelShape shapes second color.
	
	(v elementFromModel: 'isNil') announce: TRMouseEnter.
	self assert: e trachelShape shapes first color ~= originalColorBox.
	self assert: e trachelShape shapes second color == originalColorLabel.
]

{ #category : #tests }
RTHighlighterBuilderTest >> testSmallExample [
	| b hb highlighterElement el originalColor |
	b := RTMondrian new.
	b shape circle.
	b nodes: Collection withAllSubclasses.
	b edges connectFrom: #superclass.
	b layout tree.
	b normalizer normalizeSize: #numberOfMethods using: #sqrt.
	b build.

	hb := RTHighlighterBuilder new.
	hb filter: [ :obj | obj isBehavior ].
	hb view: b view.
	hb addEntry: [ :cls | '*Array*' match: cls name ] named: 'Array'.
	hb addEntry: [ :cls | '*Set*' match: cls name ] named: 'Set'.	
	hb addEntry: [ :cls | '*Hash*' match: cls name ] named: 'Hash'.
	hb addEntry: [ :cls | '*Dictionary*' match: cls name ] named: 'Dictionary'.
	hb build.

	"Check the number of entries"
	self assert: hb numberOfEntries equals: 4.

	"Check whether the highlight works properly"
	highlighterElement := b view elementFromModel: 'Array'.
	el := b view elementFromModel: Array.
	originalColor := el trachelShape color.
	highlighterElement announce: TRMouseEnter.
	self assert: originalColor ~= el trachelShape color.
	highlighterElement announce: TRMouseLeave.
	self assert: originalColor equals: el trachelShape color.
	
]
