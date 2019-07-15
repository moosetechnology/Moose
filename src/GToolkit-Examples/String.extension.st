Extension { #name : #String }

{ #category : #'*GToolkit-Examples-Core' }
String >> gtExampleSubstrings [
	^ ((self substrings: ' .,;') 
		collect: [ :each | each trimBoth ])
		reject: [ :each | each isEmptyOrNil ]
]
