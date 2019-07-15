"
I am a class example of RTEditable label
"
Class {
	#name : #RTEditableLabelExample,
	#superclass : #RTObject,
	#category : #'Roassal2-MorphSpecific'
}

{ #category : #examples }
RTEditableLabelExample >> editableSearchField [
	<gtExample>
	<label: 'Editable search-field'>
	<description: 'Display a tree of classes. Highlight nodes/classes that match the search-query'>
	
	"
	self new editableSearchField.
	"
	| b lbl searchField |
b := RTMondrian new.

b nodes: Collection withAllSubclasses.
b edges connectFrom: #superclass.
b layout tree.
lbl := RTEditableLabel new text: 'Enter a part of the name of the class'.
searchField := lbl element.
searchField setAsFixed.

lbl editLabelShape: false;
	updateMorphExtent: false.
lbl onKeystroke: [ :text | 
	b view elements do: [ :es | es trachelShape color: Color lightGray ].
	b view elements do: [ :es | 
		"es model = Bag ifTrue: [ self halt ]."
		( ('*', text, '*') match: es model name)
			ifTrue: [ es trachelShape color: Color red ] ].
	b view signalUpdate. ].
lbl onPressingEnter: [ :text| 
	lbl hideTextMorphFor: searchField. ].

b view add: searchField.
RTHorizontalLineLayout on: (Array with: searchField). 

^ b
]

{ #category : #examples }
RTEditableLabelExample >> editableTextMultiLine [
	<gtExample>
	<label: 'Scalable multi-line text'>
	<description: 'Display some multi-line text that scales (instead of wrapping around) with its window'>
	
	"
	self new editableTextMultiLine.
	"
	| v shape |
	v := RTView new.
	1 to: 20 do: [ :i |
			shape := RTEditableLabel new.
			shape text: 
'Red 
Yellow
Green'.
			v add: shape element@RTDraggable.
	].
	RTGridLayout on: v elements.
	
	^ v
]

{ #category : #examples }
RTEditableLabelExample >> editableTextOneLine [
	<gtExample>
	<label: 'Scalable text'>
	<description: 'Display some text that scales (instead of wrapping around) with its window'>
	
	"
	self new editableTextOneLine.
	"
	| v shape |
	v := RTView new.
	1 to: 20 do: [ :i |
			shape := RTEditableLabel new.
			shape text: 'Hello World'.
			v add: shape element@RTDraggable.
	].
	RTGridLayout on: v elements.
	
	^ v
]
