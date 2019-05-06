Class {
	#name : #RTGitHub,
	#superclass : #RTAbstractWorldMenu,
	#category : #'Roassal2-MorphSpecific-Menu'
}

{ #category : #image }
RTGitHub class >> imageSource [  ^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABuUlEQVR4XoVTPUsDQRDdRMWPJurtzuydQVIExI9OEUTEylr/Q36Atv4AOyGYRi2i/gMt7QStxdImBNFO1Epikeg5sze3uUQkC8MNs++9eXs7q2Tl5auMMRto8AwNNCm+JZpc4z3VXfmepFgsjhOoTuDYAsb8zQhkalhnbI9IFEUT1sBtiNYBrUnALhci1zh3GMIyx3th1QhDApobyitg4J5ILcofk4BWUsMKYxIs1h3Zar3pu2k4To9D57WUjnBwntpmjHdFXEXKF12rWBNTOfV35cRtLcUzV6GGJ1H80lrPCXhICNngmmIMYx2HuKQInUTAPJfL5dFBDhjDWGnaYYG2ux6A90lagwQYQ8f4kGtus0DD33OA2wIe7hPJSU0BwE5mThqKOp9K4ZPi1QZ2tY/ohYi8Rj/uxTcEOFGh1svyD6q0ec6DQoAHBmeJNDx3VP/JTGgc6nAlHaQjJhJwnYT2SfkqCIKZVCAMwnkhuttKmphqzx+iDte0+UYiW9baRZlzZ3+2UJjiPdeVyRous0fzr8oCHCZvAdgN+lFHhK51c/Dvi3Qi03YBNe6VSqWxtCYvdZeElvrJv6LDmIAa7lGUAAAAAElFTkSuQmCC'
]

{ #category : #'as yet unclassified' }
RTGitHub class >> menuCommandOn: aBuilder [
"	<worldMenu>"
	(aBuilder item: ('GitHub') asSymbol)
			order: 0.002; 
			parent: #Roassal;
			label: 'GitHub';
			icon: self image;
			action: [ WebBrowser openOn: 'https://github.com/ObjectProfile/Roassal2' ]
	
]
