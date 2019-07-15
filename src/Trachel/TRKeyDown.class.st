"
Event representing a key pressing (but not releasing)

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
v := RTView new.

e := RTBox new color: Color blue; size: 50; element.

v add: e.

e when: TRKeyDown do: [ :event |
	event keyCombination = $r asKeyCombination ifTrue: [
		e color: Color random.
		v signalUpdate.
	]
].

v open
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
"
Class {
	#name : #TRKeyDown,
	#superclass : #TRKeyboardEvent,
	#category : #'Trachel-Events'
}
