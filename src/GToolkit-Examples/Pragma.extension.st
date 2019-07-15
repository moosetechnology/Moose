Extension { #name : #Pragma }

{ #category : #'*GToolkit-Examples-Core' }
Pragma >> isGTExamplePragma [
	<toBeDeprecated: #gtExample:>
	^ self keyword = #gtExample
		or: [ self keyword = #gtExample: ]
]
