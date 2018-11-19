Extension { #name : #XMLOrderedList }

{ #category : #'*XML-Parser-GTExtensions' }
XMLOrderedList >> addOrderedListTableToComposite: aComposite paneTitle: aPaneTitle columnTitle: aColumnTitle [
	"Adapted from SequenceableCollection>>gtInspectorItemsIn:"
	^ aComposite table
		title: aPaneTitle;
		display: [:aCollection |
			(1 to: self size) collect: [:i | i -> (self at: i)]];
		beMultiple;
		searchOn: [:text :each | 
			Behavior compilerClass
				evaluate: ' | entity each | each := self. entity := each.', text
				for: each value
				logged: false];
		column: 'Index' evaluated: [:assoc |
			self orderedListTableDisplayKeyFrom: assoc key];
		column: aColumnTitle evaluated: [:assoc |
			self orderedListTableDisplayValueFrom: assoc value];
		send: [:result |
			result ifNotNil: [
				result value size = 1 
					ifTrue: [result anyOne value]
					ifFalse: [
						self species withAll:
							(result collect: [:each | each value])]]];
		showOnly: 50;
		helpMessage:
			'Quick selection field. Given your INPUT, it executes: self select: [:each | INPUT ]'
]

{ #category : #'*XML-Parser-GTExtensions' }
XMLOrderedList >> gtInspectorItemsIn: aComposite [
	^ self
		addOrderedListTableToComposite: aComposite
		paneTitle: 'Index'
		columnTitle: 'Item'
]

{ #category : #'*XML-Parser-GTExtensions' }
XMLOrderedList >> orderedListTableDisplayKeyFrom: aKey [
	^ aKey printString
]

{ #category : #'*XML-Parser-GTExtensions' }
XMLOrderedList >> orderedListTableDisplayValueFrom: aValue [
	"this may be overrided in the future in subclasses to return
	highlighted text objects when GT tables support it"
	^ aValue printString
]
