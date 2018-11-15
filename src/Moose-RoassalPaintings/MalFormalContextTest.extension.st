Extension { #name : #MalFormalContextTest }

{ #category : #'*Moose-RoassalPaintings-Test' }
MalFormalContextTest >> initializeContext [
	| data fca context |
	data := #(#(#Cat #(#fourlegs #hair)) #(#Dog #(#smart #fourlegs #hair)) #(#Dolphin #(#smart #marine)) #(#Gibbon #(#hair #smart #thumbed)) #(#Man #(#smart #thumbed #hair #marine)) #(#Whale #(#smart #marine))).
	fca := MalFormalContext new.
	context := fca with: data using: #first using: #last.
	^ MalLattice new viewLattice: (MalLattice on: context)
]

{ #category : #'*Moose-RoassalPaintings-Test' }
MalFormalContextTest >> testViewLattice [

	self shouldnt: [self initializeContext delete] raise: Error.
]
