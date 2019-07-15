"
RTGrapherBarChartExample new installTitle: 'HorizontalClasses' 
		code:
		'
| b ds hasTest |
hasTest := [ :cls | Smalltalk hasClassNamed: cls name, ''Test'' ].

b := RTGrapher new.
b extent: 500@500.
ds := RTHorizontalData new.
ds points: RTShape withAllSubclasses.
ds barShape 
	color: Color purple trans;
	if: hasTest color: Color green trans.

ds interaction popupText: [ :cls | cls name, ''
LOC: '', cls numberOfLinesOfCode asString ].
ds x: [ :cls | cls numberOfLinesOfCode * 
	( (hasTest value: cls) 
		ifTrue: [ 1 ]
		ifFalse: [ -1 ] ) ].
b add: ds.
b axisY decimalIfNecessary.
b axisX numberOfTicks: 4.
^ b
'
	
"
Class {
	#name : #RTGrapherBarChartExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-Builder-Grapher-Examples'
}

{ #category : #sources }
RTGrapherBarChartExample >> exampleBarAndCurve [


| b ds |
b := RTGrapher new.
b extent: 400 @ 400.

ds := RTData new.
ds barShape color: (Color red).
ds points: (-3 to: 3.1415 * 5 by: 0.1).
ds y: [ :v | v sin ].

b add: ds.

ds := RTData new.
ds noDot.
ds connectColor: Color blue.
ds points: (-3 to: 3.1415 * 5 by: 0.1).
ds y: [ :v | v cos ].
b add: ds.

b build.
^ b view
]

{ #category : #icons }
RTGrapherBarChartExample >> exampleBarAndCurveIcon [
	^ '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
DqzquEBjAy0AAAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherBarChartExample >> exampleBarChart2 [
	| b ds |
	b := RTGrapher new.
	
	"We defien the size of the charting area"
	b extent: 500 @ 100.
	
	ds := RTData new.
	"When the mouse is above a bar, say which class we are point at"
	ds interaction popup.
	
	"Each subclass of RTShape will be a bar"
	ds points: RTShape withAllSubclasses.
	
	"The height of a bar will be the number of methods (defined in the instance side)"
	ds y: [ :c | c rtmethods size ].
	
	"We set a color of the rectangle"
	ds dotShape rectangle color: Color blue.
	
	"Set the width of a bar"
	ds barShape color: Color blue; width: 10.
	b add: ds.
	
	b axisX.
	b axisYWithNumberOfTicks: 4.
	
	^ b
]

{ #category : #icons }
RTGrapherBarChartExample >> exampleBarChart2Icon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAADI0lEQVR4XuXaP2vqUBjHcd9J
+5bcS/sGCu1soVXRqUPfQTsoOLjpVL3+nVxKNyU4xEEEwUVxULSPzZOQS0yDt71Nau79/uCQ
HELOycnH5OjBxG7HT5yS4N8CPgg/fBA+CD98ED4IP3wQPgg/fBA+CD98EH74IHwQfvggfBB+
+CB8EH74IHwQfvgg/PBB+CD88EH4IPzwQfgg/PBB+CD88EH44YPwQfjhg/BB+OGD8EH44YPw
QfiJGYhpmjvDMPh3JU5PyGg0kt8HE04Jyt2dc0y3/PBB+CB8ED4IH0Qn9V6vtwsCeXsTeXx0
ShDIy4tz7PVVhH9bf+AJWa9FvHU/yM2NczyOT4z3g8QHicMgfa9evca4vmqRIIfmxv8W5P5e
5ORE5OHBeVXovhY+SEiT+ldB/PVj3gT+E8IH4YPwQUIE2W732+aD8EFiswIRi0k9ziA/DbR3
WWLFQonFE/L0JKLlbwblPzdKkO9cpy4z6bnucpPuH+2V5f217Af50xPTbIroua1W8C9v91xd
f4sa5DtPtr9tu61jgRwC8Nf1xnsBbm8/1/Y/D7K17sRwOIwURPtYrVbyFRB/X3EACRpH6CA6
qReLReuT2LKL25nu1+tt8dYvLkx7X7daPzsbyaG6e269XpdqtbrXVqPROlj393V+bga27b/u
ZrMlh47r/tWVaS/p6DaoL3/99NRZAnp+/vVhHFrcJaKg+vW109fl5Siwrw8gKj6bzSJdb+L3
8clvWdPpVIL2w8xisdAvcrK23n9R9eGdBzebjWiJoo/xeGy3O5/PRUvoIOl0WjKZjLjbKAaR
TCZlMplIuVyWWq0WGUipVLLbNgxDtETRx2AwkOVyKYVCQdrtdvgg2WxWut2uNK3vlPl8PpJB
5HI5qVQq0u/3JZVKhd6HM/80RMfS6XRs9LDh3T50LNaPaNH9MPvg/3Mx7mtZ/PBB+OGD8EH4
4YPwQfjhg/BB+OGD8EH44YPwwwfhg/DDB+GD8MMH4YPwwwfhg/DDB+GHD8IH4YcPwgfhhw/C
B+GHD8IH4YcPwg8fhA/CDx+ED8IPH4QPwg8fBJF3z7uGtXujWGMAAAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherBarChartExample >> exampleBarChartWithNegativeValues [

	| data b ds |
	data := (1 to: 20) collect: [ :v | 10 atRandom - 5 ].
	 
	b := RTGrapher new.

	b extent: 300 @ 200.

	ds := RTData new.
	ds interaction popup.
	ds points: data.
	ds barShape width: 8; 
	      color: (Color green alpha: 0.3);
	     if: [:value | value < 0 ] fillColor: (Color red alpha: 0.3).
	b add: ds.
	b build.
	^ b view
]

{ #category : #icons }
RTGrapherBarChartExample >> exampleBarChartWithNegativeValuesIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAD+0lEQVR4XuXbzU7iUBiHcW/O
W/EOXJmIH9GFC5fGRHeuTFyocWEgiooGiRkM+B1HUwwgxAQDOpqoeZm+xympTtFSqQPz/Jum
B9LTlvOjPRwoPfU6P52UHn4T8EH44YPwQfjhg/BB+OGD8EH44YPwQfjhg/DDB+GD8MMH4YPw
wwfhg/DDB+GD8MMH4YcPwgfhhw/CB+GHD8IH4YcPwgfhp7tBZmZmJJFIyPPzs4yMjIjXOk9P
T/Lw8CC65Dd1yCBiZ2trS25ubiSfz3s2eK1Wk7OzM9Gln20uy7Ls2xMfJEBeXl7EOQseHx+b
NmKlUvHdwHyQb+hD+CB8ED4IH4QPwgfhg/BB+CD/AsSN8L58ak85e9LyL3vigzTJ0dGRTE1N
mQYaGBiQ+fl5mZ2dFa+RerFY/HCkzgdpA4iO0re3t00DraysiA4SR0dHJchInQ/SxkuW+53f
7CzgX7L4fQgfhA/CB+GD8EH4IL5BYhIz67TrmN3b02XanvggfBA+SFeDZDIZ2d9/bbxmP+Hq
2OT6+jr0kTofxM75+bnorOXJycnAv6nzQdoEomdHNpuVnZ0dmZ6ebnrAlmUFvmTtVfcCg9ze
3gZulMXaYmCQr+z3W/qQZDJZz+VyUrDxyomEaLmUTDbKUSsqKSvlWV7dW61nrawp/7R+mue9
5rgVN+u4n0ulUnX3Y92fHkOzbbjnhR8LdWd7uty1dhvbKKbTb9bNHx+b568uLszjw8PDzgZx
zhA5PRVZfn3XSSzWKIf1bntfV/enx/CVd7nZRvrt2SJXV+a1yP29dPQZojfQ6ayfsgqFgrQC
Uq1WRWcta91W9nt3dyflcrlRxyn7AdG6ep+Z3tznrusHpGJ/sPHab8eAaGeu88nJiTnQVkDm
5uZkY2NDSqWStPrCJiYmZGhoSIaHhxtLvyBad3x83OzXXdcPSGxpyXO/HQMSjUZFZ+30BwcH
WwJZW1szde3+x9Rt5YNGb2+vubVV76pcX1+XsbExXyBOXb1FVvftrvsZSMZeL9Lf77nfrhgY
+u1D2plW+pAPt/FJH9KVI3U+SAggTmerHbde7/Xy4nTE7pG612/qfJA2g+g10v14c3NTP/eb
mx38jNT5ICGcIfF43HS+CuGUDw4OxNclyx5EfbVx+CAhfdvLB+GD8EH4IHwQPggB5DvCB+GD
8EFCA7m8vDRfVevv6/ZYJNDd73yQNoHoILCvr898sxmJRHT+ax0doSuI3/+phwryJ//9JUv/
o+58n1Xnp/P7EH74IHwQfvggfBB++CB8EH74IPzwQfgg/PBB+CD88EH4IPzwQfgg/PBB+OGD
8EH44YPwQfjhg/BB+OGD8EH44YPwwwfhg/DjK78B7gqeCFF7BtEAAAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherBarChartExample >> exampleBarchart [

	| grapher dataSet |
	grapher := RTGrapher new.
	grapher extent: 300 @ 200.
	
	dataSet := RTData new. 
	dataSet barShape width: 10.
	dataSet 
		points: RTShape withAllSubclasses; 
		y: #numberOfMethods.
	 
	grapher add: dataSet.

	dataSet := RTData new.
	dataSet dotShape color: (Color red alpha: 0.3).
	dataSet 
		points: RTShape withAllSubclasses; 
		y: #numberOfMethods. 
	grapher add: dataSet.

	grapher axisY.
	grapher axisX noLabel.
	^ grapher
]

{ #category : #icons }
RTGrapherBarChartExample >> exampleBarchartIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAADa0lEQVR4XuXb3UtiQRzG8f5a
/4aEIIjAy7rpMuquojJ6EyIKjS4qgl6oFCpfWozdCzUVKiIe9/xmnbAyazc12+8Dw8Rh6Bzm
c2ZOvw6nr1bjp5fSx58CPgg/fBA+CD98ED4IP3wQPgg/fBA+CD98EH74IHwQfvggfBB++CB8
EH74IHwQfvgg/PBB+CD88EH4IPzwQfgg/PBB+CD8fF+Q6elpTU1NaXl5WQMDA7Jji4uLWlpa
UuO4h4cH3d7eyvp2XKyKRfFBmmRvb0/r6+uKRqOamZkJ5qmoVCql09PTZxNWqVS0v78v6z97
oaVSqZaPxVzPB2l2t9Zzd3fXcgWk0+m23NUGkclk+CCfDR+ED8IH4YPwQfggfBA+CB+ED/KN
K3Ur9gYHB2uTk5NuwmOxmCKRyKtKPZlMtqVS54O8U6mfnJwoHA7LfrZjQ0NDGh4e7milzgf5
y1jVzt+y+M8QPggfhA/CB+GD8EH4IHwQPggfpBMgiURCOzs7ssm2d+Z2bG1t7dXE8yv1LoFs
bW2pv79foVBIm5ubyuVyqlarryadX6l3CeTs7Ezb29vy1fnu7q7GxsbE37L4zxA+CB+ED8IH
4YPwQfggfBA+CB+kkyAbGxsqFAquBuFX6l8MMjEx8fQZwv39Pb9S74UVYp8g+P9j8St1/jOE
D8IH4YPwQToJouAdisrlZzian9f/ClJZXVUpn1dPgliyqdSfCc1kVF5YkE1sNpl0E6zzc+ni
Qp0C0dWVrHUTxK7VWs+C+Av0rXGCM+m0a61WzWdAcoeHrgXvbmrVkRH7LpIP0hKkfsz+lLZV
Y305GlUpm1U7QJqd82n13NxIwRtQv61+W5CjoyMdHBy8WaW/rNQ/CtLYv9zi/PibeFzWGldU
ZWVFpetrt2/b/u1Xg9VKzc5pEH7ibDu1c/6Ix12vx0fXGleUH+8RXV//bt5fjxs/Our6roOc
B/u+tbeqdF+pXweT5HvDuby8fLddBM+Tj4yzlgtujH/5HT/n5pQ9Pm46Ph+sGGvNxlv7NTvr
xhfGx1uex9I1EFsdx8HFtarSnz1Y66nx87XPEH74IHwQfvggfBB++CB8EH74IPzwQfgg/PBB
+CD88EH4IPzwQfgg/PBB+OGD8EH44YPwQfjhg/BB+OGD8EH44YPwwwfhg/DzofwGc3EH7cin
41IAAAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherBarChartExample >> exampleBarsAndDots [

| data b ds |
data := (-5 to: 5 by: 0.1).
 
b := RTGrapher new.

b extent: 300 @ 200.

ds := RTData new.
ds points: data.
ds y: #cos.
ds barShape color: (Color blue).
b add: ds.


ds := RTData new.
ds points: data.
ds y: #cos.
"ds barShape color: (Color blue)."

b add: ds.

b build.
^ b view
]

{ #category : #icons }
RTGrapherBarChartExample >> exampleBarsAndDotsIcon [
	^ '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
UYtIR/UAAAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherBarChartExample >> exampleGroupViewOnHistogram [



| b ds |
b := RTGrapher new.
b extent: 300 @ 200.

ds := RTData new.
ds dotShape rectangle size: 0.
ds points: RTShape withAllSubclasses.
ds y: [ :c | c rtmethods size ].
ds barShape rectangle 
	color: Color veryLightGray.
ds interaction 
	highlightColored: Color red.

ds interaction popup 
	named: [ :c | c name, ' methods' ] 
	background: Color veryVeryLightGray 
	group: [ :group :element | 
		| s ms |
		s := RTBox new size: #numberOfLinesOfCode; color: Color red.
		ms := element model rtmethods sortedAs: #numberOfLinesOfCode.
		group addAll: (s elementsOn: ms).
		RTGridLayout on: group ].
	
b add: ds.

b axisX noTick; noLabel.
^ b
]

{ #category : #icons }
RTGrapherBarChartExample >> exampleGroupViewOnHistogramIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAADJElEQVR4XuXaSWsiQRiH8Xxu
L979CMnBi4ecBD0qLigEEdxRlKBBiYIejHjw4PI6vk0qNE6NOqPd2vP8oSh7SVvWL71Udz/t
9/w8Up74XcAH4YcPwgfhhw/CB+GHD8IH4YcPwgfhhw/CDx+ED8IPH4QPwg8fhA/CDx+ED8IP
H4QfPggfhB8+CB+EHz4IH4QfPggfhJ9ggxQKBYnFYhKJRESnE4mEJJNJOV5vtVqJFn5XewzS
brfl/f1dnp+fnc7udrui847Xm0wmUqlU+CB+HrLW6/XJDv/4+JB+vy+5XG4/GAx+5uu0Fn58
PofwQfggfBA+CB+ED8IH4YPwQfggV/9Wp8ghvg8MtdaRuubl5UWKxaJ1pN7r9TAg5jftdju5
yx6it1Bms5mDop//NFI3IFq/vb05xTR+OBw606PRSPggV0b3AB2pb7dbueSQZWp3MfN0V+eD
+HwO8RtEt+knNh+EDxJcED8uIvggfBA+CAakVqs5Hff19fUzwOKD3BHElFt2HgZkPB47XxiN
Rp260WjI4T/87EidD+LxHmJectDn61ouGanzQTwA0S/NZDISDof3ettD945msyn8Qxb/HMIH
4YPwQfggjwbyr/ek+CABAlkul6JXgVrzQR4AxIs7wXyQG4CYWzbz+VwCDVIqlZw32/X5+nQ6
tTbgViN1L0Hc7Qg0SDwel9fXV2m1WhIKhawNuNVInQ9yQfRNE32e3ul0JJVKSVAPWf8NyD3O
IYPBQC65fDXrmPX/FiSbzZ7tWBs2H4QP4i/I8TwbyKmO4YP4CKIXDFr4IA8CcryMD8IH4YPw
QU4knU47o3R9nn5ohLUBi8XiqoGhFyDmZW8biFlmQMyL4KZ2F9u27wpyeHzrPMI1tS2fn59S
LpelWq06jTe1u+jjX/d0vV7/bR0z73hd9zLb35n1T23T1g4DYmu3WXZq23cB0b1C33rfbDaS
z+etDZDv7Pl5nHMIP3wQPgg/fBA+CD98ED4IP3wQfvggfBB++CB8EH74IHwQfvggfBB++CD8
8EH4IPzwQfgg/PBB+CD88EH4IPzwQfjhg/BB+DmbX54DDngf154DAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTGrapherBarChartExample >> exampleHorizontalBasic [

| b ds |
b := RTGrapher new.
ds := RTHorizontalData new.
ds barShape color: Color blue trans.

ds points: #( 3 2 -4 9 5.5).
b add: ds.
^ b
]

{ #category : #icons }
RTGrapherBarChartExample >> exampleHorizontalBasicIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACXklEQVR4XuXc2WrCQBiGYe//
CrwQj/VAEY9cEIyC4o6ouIG4HPhp/zmsWrRZHPO+MLS0ECSPSWcS08z1ys+nMvxdwAfhxwfh
g/Djg/BB+PFB+CD8+CB8EH58EH58ED4IPz4IH4QfH4QPwo8Pwgfhxwfhxwfhg/Djg/BB+PFB
+CAfLAikOAYf5J9ls1Icgw/ypNFopNlspsVicbeTarWa+CAJ1+l01O/3NZlMxD9CvuCUVShI
cQw+CD8+CB+EH38dkvTgr0NimmX5Ojvjg/BB+CDegmy3W10uF3W7XVnn81m/V+r5vLwaqQYZ
DAZulW4Q9pU/x+JPe/kg/D4M0m5LYQYfxLNZEh+ED8IH4YMkCOL7vJ8/y+LnN0ir1XKr9MPh
cHc0VKtV/hGSdJVKRYYyHo/5K/VvOGXR1ilff7WXD8IH4YPwQTyKtk7hr0P4IPz4IHyQ11ou
l+5vwHQ6fXhP3VbqtPsnHwUZDoc/O7GtYrH49J467epw6j4GxAfhg/DXIWlel/BnWXwQfnwQ
Pgg/Pggf5HH1el3vjFwu5xaGpVLp7nf283e3l/SwUnWEBEHw53PqURf1DrTHKfinLP4p67V2
u507hI/HY+h3jX0KxY4a21YU72r7Fx6n0ymy7c3nc/egkX3f6/XkHchms1G5XJZduV2v16Ff
YLPZdOfo1Wole9Iq7Pb2+717fVFtz65UNxoNh2tPevFPWfxTFj8+CB+EHx+EHx+ED8KPD8IH
4ccH4YPw44PwQfjxQfjxQfgg/PggfBB+fBA+CD8+CB+EHx+EHx+ED8KPD8IH4ReyGyeBQ1Q7
vS9UAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTGrapherBarChartExample >> exampleHorizontalClasses [

| b ds hasTest |
hasTest := [ :cls | Smalltalk hasClassNamed: cls name, 'Test' ].

b := RTGrapher new.
b extent: 500@500.
ds := RTHorizontalData new.
ds points: RTShape withAllSubclasses.
ds barShape 
	color: Color purple trans;
	if: hasTest color: Color green trans.

ds interaction popupText: [ :cls | cls name, '
LOC: ', cls numberOfLinesOfCode asString ].
ds x: [ :cls | cls numberOfLinesOfCode * 
	( (hasTest value: cls) 
		ifTrue: [ 1 ]
		ifFalse: [ -1 ] ) ].
b add: ds.
b axisY decimalIfNecessary.
b axisX numberOfTicks: 4.
^ b

]

{ #category : #icons }
RTGrapherBarChartExample >> exampleHorizontalClassesIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAADxklEQVR4XuWdbU8aQRSF/f+/
wKRt7Pc2tt9aX2qsVWIALQqICLugKG8LikQXInjtjLKJIhKMhb3muSebIGpMzuPdnTszd5i7
u5s82nVf1r/G5I4fU4u51/yw3Iq4eZcPRAuQWr4l0V97fCBagFycXUkikuYD0QLERrwcl9hA
Z0Z8C0MGslXdkqWB8kZ8C0MG4hQd6RvxrVMCZKmxJPtGfOuUACkWi3wYWoCUM+f8wpCfIXwg
L8bxricb3+J8IFqAXDU7kt495APhV+p8IHwg7+WhnjxNimPEt04JkBVvRT4Z8a3jD3v5QIaj
EKvzC0N+hvCB8IHwgfBjJJByuSytVku63a4UCgUplUpSq9WeAIhWonwgswJyeXkp19fXks1m
xfM8sdlgwQTf931fIvkIH8isgPR6PbERfP34Nb9SV/gM4W8D4j/U+UD4QPhA+MEHwgfCj2kA
4a+pKwPCX1NXBsROv/MLQz4QPpBxYdfUfSO+dUqALHvLUjHiW8cf9vKBjArbjsC3jZ8hfCDj
MmR+oLjwi8TQgTjHjnQG6hnxLQwRyPnplcTW+O1saoC0PZ9fGGq7ZQV96vwedSVAbJ/6T6Oc
Ed8+BUDcois3RrdGfPtmAOTk5ERyuYf//lQqJS8Ne8tGfPtmACSRSEil8jBXtb29/cR0u1Eu
k8nwQYR1y7Ib54bfW6uv8YFoeobwp04UANlcOJTg2vjOny4JHUgt15Lg4q+pKy0Mh5UWfgXP
B8IHYtbUS0lxjc6N+PYpAGLX1D8a7Rjx7eMPe/lAHsf6fJrfp87PED6Q8VnCzxBdQBz+2e+6
gEQqEVkxqhvx7VNUGF4Y8e1TBIRfmSsBEqypR4R/okPoQPo3t+I6BT4IfmHIB8IvDN8LkMeb
ra3sA55vIz9D+ECCWPVWZYGvN8kzmgiIPU0u2PpjT5drNpvPTpTbP92XI77eJNvKMREQe4pc
8NqCGD5RrtPpyKa7ya/Sw7plDZ8oF1TqfCCKniEHf7N8GJqA/F7kD3P5w14+kDHTJ/ypE36G
8IG8YupknL4Y8S2eMhDbp+5PqK4R3+IpA+H3qSsDwu9TVwLEnvvOP1FOERDbrJP8cSzRVf7Z
76puWbZPvTcQv1dd2bCX/7nq/MKQD2SSwpBvIz9D+EBsbH0+lD/8PnU9QKpHLUnt8PvUQwdS
2mvcF4X8wpAPhA9kXHiFthwk+GvqaoBsfDgQ/pp6CECq1arwh70hAWm32zJ85fN5cV332fuN
RuN+89yo3yFc9qNpp/03RmZIv9/nZ8GIGLVx8H/HP3L/1vfotFYdAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTGrapherBarChartExample >> exampleLabelledBars [
	| b ds |
	b := RTGrapher new.
	b extent: 500 @ 200.
	ds := RTData new.
	ds interaction highlight.
	ds points: RTShape withAllSubclasses.
	ds barShape width: 10.
	ds y: #numberOfMethods.
	ds barChartWithBarTitle: #name.
	b add: ds.
	b axisY.
	b axisX
		noTick;
		noLabel.
	^ b
]

{ #category : #icons }
RTGrapherBarChartExample >> exampleLabelledBarsIcon [
	^ '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'
]

{ #category : #sources }
RTGrapherBarChartExample >> examplePositiveAndNegativeValues [
	| b ds |
	b := RTGrapher new.
	ds := RTData new.
	ds barShape
		width: 15;
		if: [ :v | v < 0 ] fillColor: Color red;
		if: [ :v | v > 0 ] fillColor: Color green.
	ds points: #(5 -6 10 20 -9).
	b add: ds.
	b axisX
		noLabel;
		noTick.
	b axisY noDecimal.
	^ b
]

{ #category : #icons }
RTGrapherBarChartExample >> examplePositiveAndNegativeValuesIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACBklEQVR4XuXavWrCUBiA4VxO
e5WCODl6Ay4OvQYXf25ARJwU3FwEFRd/wM9yplSwrbQaQ543HBwUg+dJDDkku1z8ylTmT4EP
4ueD+CB+PogP4ueD+CB+PogP4ueD+PkgPoifD+KD+PkgPoifD+KD+Pkgfj6ID+Lng/ggfj6I
D+Lng/ggftUAGQ6H0el0ol6vx/l8Dn9KXwwynU5jNpvFarWK7XZ7BbLZbGI0GpUW6S3yrXJ/
Wfv9/uaPWiwWUd6jMd+Ya4gP4oP4ID6ID+KD+CA+iA/ig/ggPogP4oP4IEWCpLWs9Npqtfyl
kzKdIafTKZbLZSkWFz8i3ziQw+EQaQwGg9KcIfdOtH8N8UF8EB/EB/FBfBAfpNog75FvPkgJ
QB49MT6ID+KD+CA+iA/ig/yxRqMR3W735sTP5/PY7XY/jq8T89tn7xn3ft+j95tGWtd7OUh6
rjehPP0+JMvyUehhW9x+H7KH7x4j9UGqfqfug/ggPogP4oP4ID6ID+KDPAPkZbfPPogP4oP4
ID7Is0Da7XaMx+Po9XpRSZAi7f/7BZPJJJrNZtRqtTSu3luv15GGP80FnyEJ4ng8Rr/f9ye/
7NcQPx/EB/HzQXwQPx/EB/HzQfx8EB/EzwfxQfx8EB/EzwfxQfx8ED8fxAfx80F8ED8fxAfx
80F8ED8fxM8H8UH87uoTt/3tJ829VVMAAAAASUVORK5CYII='
]

{ #category : #accessing }
RTGrapherBarChartExample >> label [
	^ 'Grapher - Bar charts'
]
