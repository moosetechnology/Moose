Class {
	#name : #RTGrapherDecorationExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-Builder-Grapher-Examples'
}

{ #category : #sources }
RTGrapherDecorationExample >> exampleAreaDecorator [
<noTest>
| tab b colors icons deco image elements |
tab := RTTabTable new input: (TRPlatform current 
	downloadContent: 'https://dl.dropboxusercontent.com/s/b9syomd2h0np69s/International.txt?dl=0') 
	usingDelimiter: $,.
b := RTGrapher new.
b extent: 1000 @ 400.

colors := (Array with: '#5e3782' with: '#d49935' with: '#81211d' with: '#238999') 
	collect: [ :c | Color colorFrom: c ].
icons := Array with: RTPolygon diamond with: RTEllipse new 
	with: RTBox new with: RTPolygon star.
icons doWithIndex: [ :ic :i | ic size: 10; color: (colors at: i) ].
	
b addDecorator:(RTHorizontalTickLineDecorator new moveInFront; yourself).
deco := RTContinuousDecorator new.

tab values doWithIndex: [ :ti :i | | year values d |
	year := ti first.
	values := ti allButFirst collect: [ :n | n trim asNumber ].
	d := RTData new.
	d interaction noInteractions.
	d noDot; connectUsing: (RTLine new
		color: (colors at: i);
		width: 2).
	d points: values.
	b add: d.
	deco iconAt: d put: (icons at: i).
	b addDecorator: (RTAreaDecorator new
		points: values;
		color: ((colors at: i) alpha: 0.3)) ].
b axisX
	numberOfTicks: 50;
	numberOfLabels: 50;
	rotateLabels;
	labelConversion: [ :n | 'Day ' , n asInteger asString ].
b axisY
	numberOfTicks: 10;
	numberOfLabels: 10;
	labelConversion: [ :n | '$' , n asInteger asStringWithCommas ].

deco title: [ :x | 'Day: ', x asInteger asString ].
deco legendLabel text: [ :as | | pos year |
	pos := deco calculatePointFor: as key and: as value asInteger.
	year := (tab values at: (b datasets indexOf: as key)) first.
	'The International ', year, ' $', pos y asInteger asStringWithCommas ].
b addDecorator: deco.
b build.

elements := (b view canvas shapes) asGroup.
image := 'https://dl.dropboxusercontent.com/s/v5b7fg4gzb4w4xs/dota.jpeg?dl=0'.
image := (TRPlatform current download: image ) contents.
image := RTBitmap new 
	form: (TRPlatform  current formClass fromBinaryStream: image readStream); 
	element.
b view add: image.
image pushBack.
(RTConstraint on: image background: elements) center; move.

^ b view.
]

{ #category : #icons }
RTGrapherDecorationExample >> exampleAreaDecoratorIcon [
	^ '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'
]

{ #category : #sources }
RTGrapherDecorationExample >> exampleAverage [
	| b ds |
	b := RTGrapher new.
	ds := RTData new.
	ds dotShape color: Color red.
	ds points: #(5 1 20 8).
	b add: ds.
	b addDecorator: (RTAverageDecorator new withLabel: #asFloat).
	^ b
]

{ #category : #sources }
RTGrapherDecorationExample >> exampleAverageAndStdev [

	| b ds |
	b := RTGrapher new.

	ds := RTData new.
	ds interaction popup.
	ds points: #(600 470 170 430 300).
	ds barShape width: 20; color: Color lightGreen.
	b add: ds.

	b axisX noLabel; noTick.
	b axisY noDecimal.

	b addDecorator: RTMeanDevVarDecorator new.
	^ b
]

{ #category : #icons }
RTGrapherDecorationExample >> exampleAverageAndStdevIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACvElEQVR4XuXbX0vCYBTH8d6w
b8ALBRUE30EgeCmEIAQD0QvF6qoEh0r+uUkowa5EcILaWXsGK7MpwjY39/3F4WFtOtqH7em4
eWOa/EQpN/xDwAfhhw/CB+GHD8IH4YcPwgfhhw/CB+GHD8IPH4QPwg8fhA/CDx+ED8IPH4QP
wg8fhB8+CB+EHz4IH4QfPggfhB8+CB+En3iAFAoF0TRN8vm85HI5qdfr4qzbbDZiGIaokX+o
LwTSbrclkUjYGJlMxh6ddcvlUmazmajx2Os/zBfr5/an1DIfxEPUGaDG9Xotqg7Xi5VTr+eD
XHgO4YNEDOT19Uvu7+VoNYfPsg+ilk9tH/UaDkX4IHwQPggfhA/CB+GD8EG8g1QqFanValIs
Fl079W7XkGp16xnkWuBCB+l0OvbHI9ls1rVTf3iYy92dwQe59CVLnQ1unbpflyy/QWpP7/Z7
OqWW+XNIiCBBnXF8ED4IH4QPwgfhg/BB+CB8kFiCjMdj0XVdms2mNBoNGQwGfzp1XV9HslOP
LUi5XJZUKiXpdNq0yh73O/XHx89IdupB7Td0EPVxyXa7lVarZZ8lu91O4nTJujqQuM8hfBA+
SLAZjb5E0+RotcZ//2C17GW7cyuo/Vr/4wjiMSC/HxcKa798ED4IH4QPwgf5TalUsrvz+Xzu
2qmvVquTT7/7fWDC2i4yIOrrCL1eT5LJpLh16n49/c4HOTMKoN/v20+buHXql75k4UGiNofw
QfggfBA+CB+ED8IH4YPwQfggAYE499QPf8/v1EMCOezQ9zv1yWRi3bQZynQ6da236du/usbt
nFosFuHfD3HuqZv8RH8O4YcPwgfhhw/CB+GHD8IH4YcPwg8fhA/CDx+ED8IPH4QPwg8fhA/C
Dx+EHz4IH4QfPggfhB8+CB+EHz4IH4QfPgg/fBA+CD9n5Rv6/4j1KSpjNgAAAABJRU5ErkJg
gg=='
]

{ #category : #icons }
RTGrapherDecorationExample >> exampleAverageIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACuElEQVR4XuXczWrCQBiF4d5s
F/YC3PoD6tatuPQGBBeC4g9u9BIUQSlVURRFFyKoJ3UCQis6sVab1PfALEoN6DzJTL5MkhfH
4SdIeeF3AR+EHz4IH4QfPggfhB8+CB+EHz4IH4QfPgg/fBA+CD98ED4IP3wQPgg/fBA+CD98
EH74IHwQfvggfBB++CB8EH6CD7JarbTf7zUcDmX+3m63Mo3fpT4eIZlMRovFQvP5XJ1Ox23H
//X7fafdbmM6Uh8f0uurfAOJRqPK5/OKRCJqNpsqlUpu+/qZAwr/iAnSHMIH4YPwQfggfBA+
CB+ED8IH4YM8CchgMLhYqfNBfAAJh8Nup5+r1FutFr+H/wqkVqs5lUpFsVhMjUaDX6nz5xA+
CB+ED8IH4YPwQfjhg/BB+PkzENuaOh/EBxDbmvqzV+qj0cj9vcvlUqYFolInr6mnUin39+Vy
OdXrdfHnEJ+TTqdVLBZldszTnTGwIIchzaE0HYI9QvT+LoVC4k/q/CGLD8IH4YPwQfi5A8h0
OtV6vXY7fTKZiA/iM0gymdR4PJa58dos5Z5g3FypP+sZ1MNBstmsWxBVq1UlEolvHWjOyflH
CH8O4YPwQfggfBA+CB+ED8IHAYG4dcXbGx/n0SBfq/PTSn2326nb7d6EYLbdbDaYbe8GcqzQ
z1XqvV5PZmnTLPX+tJXLZRUKhX+37fGGD99A4vG4e+f7uUrd7C2z2eymL0jb9uFziG0o84rX
BUuv/OZVH7aHjy7l3q8YeQiIbSjziu2C5TW5dFvSNbn08JFXbK8YCQSIbSjziu2CpS3X3Jbk
ta3t4SPbzuf1ipHAnPbywwfhg/DDB+GD8MMH4YPwwwfhhw/CB+GHD8IH4YcPwgfhhw/CB+GH
D8IPH4QPwg8fhA/CDx+ED8IPH4QPwg8fhB8+SJDzCdJH+DKX7bt+AAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTGrapherDecorationExample >> exampleAverageWithName [
	| b ds |
	b := RTGrapher new.
	ds := RTData new.
	ds dotShape color: Color red.
	ds points: #(5 1 20 8).
	b add: ds.
	b addDecorator: (RTAverageDecorator new withLabel: [ :aValue | 'average = ' , aValue asFloat asString ]).
	^ b
]

{ #category : #icons }
RTGrapherDecorationExample >> exampleAverageWithNameIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAADHklEQVR4XuXczUsqURjH8f5O
V25a2F63qZBu3Wq0CsSNILgI0krd6EJw6wsolYovkeRCBOuZO+eA0BU94/VqTn5/cIioE835
nHl55oxzZln8uCln/CHgg/DDB+GD8MMH4YPwwwfhg/DDB+GD8MMH4YcPwgfhhw/CB+GHD8IH
4YcPwgfhhw/CDx+ED8IPH4QPwg8fhA/Cj/tBptOpfH19Sa/XE/X9YrEQ1fhDesQ9JB6Py2Qy
kff3d2k0Grotf9bpdKx6vY4ZSHl9FTk/l6OBBINByWQycnl5KeVyWe7v73X7/js2Cn+PcdM5
hA/CB+GD8EH4IHwQPggfhA/CBzkRkG63u7FS54McASQQCOhBX1epVyoV/gj/FMjT05P18PAg
oVBISqUSv1Lnn0P4IHwQPggfhA/CB+GHD8IH4efHQExr6nyQI4CY1tRPvVLv9/t6ez8+PkQ1
V1Tqp7Cm3mw29f8+Go0kl8uJel4gFouJvY2Sz+fF7/dLtVoVe4LJYDCQRCKhtysajeqvt7e3
UigUhH8O2VNSqZTUajXxeDyiJtnNzY0kk0nx+Xxqwller1eKxaJu8/lcXl5e9HYptLu7O91n
dTK6FsQ+pFm/ub29vUk6nd5qO8QOdg+R52exp7DwT+r8y14+CB+ED8IH4WcPIOPxWGazmR70
4XAofJAjg0QiEV0oqUJKLeWuYOxcqZ/qFdTBQa6vr3VB9Pj4KFdXV38NoLom5+8h/HMIH4QP
wgfhg/BB+CB8ED4ICETXFRcXfJxDg3yvzlcr9c/PT2m1WjshqL5qIYjSd28gywp9XaXebrdF
LW2qpd5/bWoZNZvN/rq+ywc+jgYSDof1k+/rKnU1W9Rq2y5/l9b34OcQ06HMKU43LJ3yP6/6
MH34aFP2/YqRg4CYDmVOMd2w3CabHkvaJps+fOQU0ytGXAFiOpQ5xXTD0pRtHkty6mv68JFp
8jm9YsQ1l7388EH4IPzwQfgg/PBB+CD88EH44YPwQfjhg/BB+OGD8EH44YPwQfjhg/DDB+GD
8MMH4YPwwwfhg/DDB+GD8MMH4YcP4ub8ASxv3uJpWgWIAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTGrapherDecorationExample >> exampleCursorFollower [

	| b ds |
	b := RTGrapher new.

	ds := RTData new.
	ds points: #(5 10 6 2 -2.5).
	b add: ds.

	b addDecorator: (RTCursorFollower new color: Color blue).
	^ b
]

{ #category : #icons }
RTGrapherDecorationExample >> exampleCursorFollowerIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACdUlEQVR4XuXazYsBYQDHcf82
F5G4Kpz4AzhyUDhw83ZC5ERKSQ7Ka95+1jOt2t12t91m1o75fmty8nhmPs0wj/Fdr/zclI9/
CPgg/PggfBB+fBA+CD8+CB+EHx+ED8KPD8KPD8IH4ccH4YPw44PwQfjxQfgg/Pgg/PggfBB+
fBA+CD8+CB+EHx+ED8KPD5LNZpXP51UoFFQsFhWLxfRMB0+3LpeLPAPSarU0HA7V7/cVDocV
iUTe7dx4PHY10G6303a7lScvWcfjUfv9XvxLFj8+CD8+CB+EHx+ED8KPD8IH4ccHeVjmRvS2
8UHcklmHOp1O4oO8ZtaqMpmMdUCSyaT4F6x/Bul0OsrlcjIwm81Gn4E5+XnL5VK3jQ/yVd1u
V/V63VrtrdVq/DOE/yuLD8KPD8IH4ccH4YPw44M8530F/wzhg/Djg/BB+D0tyGq10k838/ho
NBo1X8zy+/36zXvdsnnqDLk/PrpYLDSdTvmLi264ZJl/7fiPkf4BiFlCn8/n1kEtlUq2D26l
UtH91Yxtd7z7nJwYr91u6+OYrgIZjUZqNBoKBAKaTCZar9e2J3g4HDSbzRQMBs1me47pdNr6
E8yJ8cxT+2/38z5XV50hg8FA5XLZgkmlUrYnl0gkrLGq1arO57Pt8UKhkGPjxeNxM87V7Gez
2ZSZK/9nL/87xLm8uAbFP0P4IPz4IHwQfnwQfu4CcfIOmg9is16vp+/uoM0KAB/kwTl5B80H
4ccH4YPw44PwQfjxQfjxQfgg/PggfBB+fBA+CD8+CB+EHx+EHx+ED8KPD8IH4ccH4YPw44Pw
QfjxQfjxQfgg/PggfBB+TvUCoQ9cNP2p/78AAAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherDecorationExample >> exampleDeviation [

| b colors points ds pts dec lb |
b := RTGrapher new.
colors := Array with: Color red with: Color blue.
points := OrderedCollection new.
colors do: [ :c |
	ds := RTData new.
	pts := ((1 to: 100) collect: [ :i | 50 atRandom - 25 ]) cumsum.
	points add: pts.
	ds points: pts.
	dec := RTDevVarDecorator new.
	dec moveBehind;
		deviation: 0.5;
		color: (c alpha: 0.3);
		points: pts.
	ds connectUsing: (RTLine new color: (c alpha: 0.5); width: 1 ).
	b add: ds.
	b addDecorator: dec.
	 ].

b axisX; axisY.
b build.

lb := RTLegendBuilder new.
lb view: b view.
colors doWithIndex: [ :c :i | 
	lb addColor: c text: 'Series  ', i printString ].
lb build.
b view @ RTZoomableView @ RTZoomableBoxView.
^ b view
]

{ #category : #icons }
RTGrapherDecorationExample >> exampleDeviationIcon [
	^ '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
QmCC'
]

{ #category : #sources }
RTGrapherDecorationExample >> exampleIris [
|  table g d |
table := RTTable inputWithComma: RTDatasets iris.
table removeFirstRow.
table convertColumnsToFloat: (1 to: 4).

g := RTGrapher new.
d := RTData new.
d dotShape 
	if: [ :row | row last = 'virginica' ] fillColor: Color blue trans;
	if: [ :row | row last = 'setosa' ] fillColor: Color red trans.
d points: table values.
d x: #first.
d y: #third.
g add: d.

^ g
]

{ #category : #icons }
RTGrapherDecorationExample >> exampleIrisIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAErElEQVR4XuWc30uTURjHve5W
MKjoQlJX/szNbOnUTTedmr+WmrO0mimYZImFFmJphdrF7EK6EgwMg4hQUNSbkCBEvPTW/E++
dp6Tk0yXzdreV74XH97t3Y47O589zzk77+PiioqKtvkxD3H8g8AvhB9+IfxC+OEXwi+EH34h
/EL44RfCL4R/IPiF8MMvhF8IP/xC+IXwwy+EXwg//EL4hfDDL4QffiH8QvjhF8IvhB9+IfxC
+DkeQqqrq1FSUgKfzwf+wTSBEK/Xq0X4/f59QkRUWVkZvygDUhZ22PcYvxCTzSH8QviFGILV
GkBurh/8QkxCRkYvrNY2fiFmID+//L/J4BfyD9jt13DlSvWe92exvAC/EEOiwotLl27sRobd
7lNyavhTVrQ5f/45fpUgAy+309MfITPzgZrIr+v7eXlXUVBQwi8kFmRl3UNeXiXOnPmgIuIu
CgtdyMjoQXZ2O/iXvTFbNT2Ew+FGfPw3JCUF9Xs4ffojcnJa1flS8H8PMYDk5BGVoup0anI4
PCpKqpCa+nTfRM4vJIoUFLjVXFC8uxVks91BcvJryNI2La1fpSsnTL/bK8empqYDNxcrKiqO
jZCLFzuRkLCkNkTfoa3t52SemPhWzxsiZHr6PWy2W5AJ3LRC3G43SktLERJzXCMkJ+emGuzb
cDqd6Ot7A4tlWKWq++jtXd3tf3d3N5aXl9Ha2sqfsmKJ39+CxcUvqKvrxMrKCrq6uhAMBrfX
19fVuTpsbGzwC/mfpKS82tOnra2t7YWFBWxubsLlcsngQ+7L+bm5OczPz2NtbQ3Dw8Pg3+2N
DRgZGdkdcImIkKjZ2VkdHWNjYxgYGOAXEiskCpQAHRVDQ0Po6ekB//WQGDM6Oqom8D69Elxd
XcXg4KAW0tHRgfHxcXg8HvALMYDGxkYsLS2B/4qhgczMzOzpl6QoWVHJMp5fSIyZmJjA1NTU
vn5VVVWBP0IMoKWlBYFAAPxFDiabNyYnJ8EvhJ/o72XJsba2lr9QziylpLKre9CavbKyEuFE
8cOfsviF8AvhF3Iod2w21F++DG9+PrqysvhXWUZS5nDgYWYmGpWQicREPElN1X1bPHlSHx+n
p8NVWMj/TT3a+Ox2eJSMz6dOYTQlBZsnTuC7YkvxSZ1bTkjQUdOflgYnv5Do88JiwfTZs3ip
jkJHdja+xsfjgYqWCpW6gufO4dmFC7qfAZXS+IVEkeu5uWi3WnUfJApC5+/unPud9jDn+YVE
gXYVGfyrLP5lL78QfiH8QswjJFSZGO7iDr8QA4SUl5cfuIlYXFysKxpFylGQzcmjtpV+GdFW
qjgNFSKll3/6P3XZCT7q3/6XtvJhOG5ti/h/64RsUpeKePmUhyvEPmxeamho0GlLyjv/tq08
X6JV2koqjeR1Q88PvW64qA9Hc3OzTlk7bc0nRIoJ6uvrI75IJQXN8mM28vsp0jaS0hyRH2or
tyNtK/0NtY00ZYpI6XtNTQ34UxZ/yuKHXwi/EH74hfDDL4RfCD/8QviF8MMvhF8IP/xC+IXw
wy+EXwj/IPAL4YdfCL8QfviF8Avhh18IvxB++IXwC+GHXwg//EL4hfBzBH4AC4WNX8fBFtAA
AAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherDecorationExample >> exampleLikertScale [

| q11 q12 q21 q22 q3 t toVisualize b ds lb |
q11 := #(A A SA SA A SA N A A SA N) groupedBy: #yourself. 
q12 := #(D SA SA SA A N SA A SA A A) groupedBy: #yourself.
q21 := #(A N SA A SA A D A N A N) groupedBy: #yourself.
q22 := #(D N SA A SA SA D A A SA A) groupedBy: #yourself.
q3  := #(D A SA SA N A SA A SA A A) groupedBy: #yourself.

t := q3.
toVisualize := OrderedCollection new.
toVisualize add: #SA -> (t at: #SA ifAbsent: [ #() ]).
toVisualize add: #A -> (t at: #A ifAbsent: [ #() ]).
toVisualize add: #N -> (t at: #N ifAbsent: [ #() ]).
toVisualize add: #D -> (t at: #D ifAbsent: [ #() ]).
toVisualize add: #SD -> (t at: #SD ifAbsent: [ #() ]).

b := RTGrapher new.
ds := RTData new.
ds barChartWithBarTitle: #key rotation: 0.
ds points: toVisualize, (Array with: '' -> #() ).
ds y: [ :as | as value size ].
b add: ds.
b axisX noTick; noTitle.
b axisY noDecimal.
b maxY: 5.
b build.

lb := RTLegendBuilder new.
lb view: b view.
lb addText: 'Likert scale result'.
lb addText: 'SA = Strong agree; A = agree; N = neutral'.
lb addText: 'D = Disagree; SD = Strongly Disagree'.
lb build.

^ b view
]

{ #category : #icons }
RTGrapherDecorationExample >> exampleLikertScaleIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEiElEQVR4XuWcaU/yQBSF/f+/
yA9GjSZCXCK47/uKG4obUWecZ/JeUhFs5RWpPSdplOHOTLlPW+5hKEPe6ytPGtJPgT4QfekD
0QeiL30g+kD0pQ9EH4i+9IHoA9GXPhB96QPRB6IvfSDqQFxQs9l07e2np6duc3PT/cQO3t3d
ufZNH0gX7e7uul6e++YcnzZ9ID8MSx+IPhB9IPpA9IHoA9EHog9EH8hX2tjY6Jh0fEipVHI/
4S/0gfzSGZI10fpA9IHoA9EHog9EH4g+EH0g+kD0gQwYSL1ed29vb64XH6IPpA9A9vb2nP4Z
on/J0geiD0QfiD4QfSD6QPSB6AMpOBA8CNL3ITkBsrKy4hqNhtM/Q/QvWfpA9IHoA9EHog9E
H4g+EH0gBQZycXHRMeknJye/7kOyfs8r7/eb/BeQ/f199/z8nAsfUpQzrjCXLH0g+kD0gegD
0QeiD0QfiD6Q4gBh3aNWq7lOPmR0dNRVKpWuW7lc/rTlKe67G7kYOJDj4+Oed2Jrayv2vb6+
zjRGlriHh4fMY93f338Ze3R05LLE/ZlLVppmZ2fdy8uL297eTn3BWeO4o2t9fT01bm5uzq2u
rrqvzvy1tTWXFlcoIGNjYw4ol5eXLgu8LHEAOTg4SI2bmppyk5OTXeP4OGVkZMSlxRUKiL70
gegD0Zc+EH0g3YQX4Tezirr9SSD6x3tOgfDlxmazmalflriwKKYPpBcgwe2aM/Y7Ozs4aX9+
fu6DyePuq/hc8BcsBfunpyfcMauQMd7agyeIfXjM/4zBWMG06QPpBQhHMwkMJssHFx2TzmOS
/M/M+aWlpZjo4IojqJmZmQgFONaHOECGj1xi/4WFBX0g+u8h+kD0gegD0QeiL30g+kD0lQcg
Z2dnPnzM4MOqWyxX8RKUsYjSljL26uoqlsC04zNou729jaVtWJhiscgzDn2Jo/x9fHz0Nzc3
MQ4dHh7GNhs7zM3tdrGMph0/Qzzr59aH+Zk72S+spbRKccpwvNHExEQcz8b800B4AXgM/AQJ
xoUDB/FizdyZ8yaG5ISl4ehDgDE+Pu4XFxdjQokjMQAgyQjQPP/6+toamzHwKcQxt8Uzvs1F
0gGd7Gf7yRx4H/osLy+39us3vE/fL1kc5Z1k7XbUkRgTQEiEaXp62ocl1Q9xfBxj5rLT2Iyb
/EYJ8bQ3Go3UfWcOu5fV5mvfX/33EP33EH0g+kD0pQ9EH4i+BgekVqvFEjIpPl6n+sEDZBXl
p3kT/EhS+JwOv+7xQZSzJqo3yunvzF8YILZARcKo40km9T+QSBKlLImuVqv8TEcsY/EJ/KX0
JWmUmZg3+jEeniNp5pKQmKder/vh4eHW2oothvHY/Adj0w8jaPtCHHBtXtoGsTLZVyAkG+OW
FEcnZw6JMyActaVSqeUbKpVKbCeWxHOGkDj+b/cRAAIEiTRTaCuOJBXYjEMcmp+fj/E8Dyja
mbdcLsd9snmBo/8eoq/+AeEOXf2vAeUIiL70gegD0Zc+EH0g+tIHog9EX/pA9KUPRB+IvvSB
6APRlz6QYusdM8tBXZ5uKHAAAAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherDecorationExample >> exampleMarkerOnTheXAxis [

| b ds |
b := RTGrapher new.

ds := RTData new.
ds connectColor: Color blue.
ds points: #(3 4 5 6 7).
ds x: #yourself.
ds y: #yourself.

b add: ds.
b addDecorator: (RTMarkerOnX new value: 5).
b addDecorator: (RTMarkerOnX new value: 6).

b build.
^ b view
]

{ #category : #icons }
RTGrapherDecorationExample >> exampleMarkerOnTheXAxisIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAADFklEQVR4XuXcQUtqQRjG8VZ9
jL5my1q6qYULaREItYoKC1clolJqauZChMhCQRQRFLV7E0oer3PAS2HIDc/VOef/gKsDwzg/
3zPH16mNyYQfm7LBXwI+CD98ED4IP3wQPgg/fBA+CD98ED4IP3wQfvggfBB++CB8EH74IHwQ
fvggfBB++CD88EH4IPzwQfgg/PBB+CD8eAMkEAio3+8rmUzq5uZG/OVcM0g4HHYQHh8fVS6X
v4C8vb2p1+vxkVYJ0ul0VKlUVK/Xlc/n5xafD2LZHuJ3kNfXV/FBLMndnVQs8kHWnvFYuryU
+LcsS6pi+vwi/h7i86rgg1hWFXyQf6yKw8M2/7GXWBV8EAv2Cj6IxVXBB7GsKlwDCYVCzhsx
nV7T8f18zTQX2+221SDX130rqsI1ENN6L5VKisViurq68kxzcVYVHx8f1s0Pd8uyZa/Ag5iq
uLiQ9XsaAuT21u6qwIAMh791diZPfRfyLcj0wU+ZzC/PdQp8B2L2Cq9VhW9BTFWUy/J0h9kX
IF6vCl+B+KEqfANyetqa+C38bq+fQJ6enpwFz2azGgwG/INy6waZdXhzuZxOTk6+LH6r1dLz
8zMfZJUgOzs7E9Pljcfjc2d7+RXC30P4IHwQPggfhA/CB+GDUEG0v79wftrbEx9klSBbW1rm
Oh+ED8IH4YOsCmN3V2bBdXyshdePjuQZkGAw6Ew2nU5Pf7/OeKp1ovNzaXNTenjQwuvFondA
3t/fZZqI1WrVeX2+NhqNVKvV1O12XXs1m01Xxxttby+8Pm3WTX4ynhsfwKVAUqmU83fq9/f3
KhQKc5Mx53vd/PS4PZ750Ng2Hv9/nRC+GM5Ow5sfrb6rnJ9mOBzq4ODAGefl5WXp8SKRiEy1
uTU/k9lh82Xn919AZqfhzcn4RCIhN4ANinl4ML+9LDteo9FQNBp1bX7j8fjvw82y8+Pfsgi3
LH74IHwQfvggfBB++CB8EP4S8EH44YPwQfjhg/BB+OGD8EH44YPwQfjhg/DDB+GD8MMH4YPw
wwfhg/DDB+GD8MMH4efb/AE7UEBHDfiIBAAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTGrapherDecorationExample >> exampleMinAndMaxSetManually [

| b ds |
b := RTGrapher new.
ds := RTData new.
ds points: #(1 2 3).
b add: ds.

b maxX: 6.
b minX: -2.
b maxY: 5.

b build.
^ b view
]

{ #category : #icons }
RTGrapherDecorationExample >> exampleMinAndMaxSetManuallyIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAC/0lEQVR4XuXcS2vqQBiH8X45
934aQRdeQDeu3EqXrkRFQURU6mUhuhNcKOJK8VaoileQ4pvTCXjw1Es9KY2pzx9ChPqSOr9O
0pmJedI0fqyUJ34T8EH44YPwQfjhg/BB+OGD8EH44YPwQfjhg/DDB+GD8MMH4YPwwwfhg/DD
B+GD8MMH4YcPwgfhhw/CB+GHD8IH4ecxQRaLhahNvR4Oh8Jv/juDRCIRKZfLMplM5PX19R+Q
+Xyudbtdfc8HMSkvLy+Sz+elVquJ2+0+6SGz2Uz4PcRC4YPwQfggfBA+CB+ED8IH4YPwQR4A
5O3tTW/wwWAgm83mZHDIBzEZJBQK6Q2eTqclFovpg8TjkXqz2eSP1M06ULvdFofDIfV6XRqN
hrRaLXG5XPwewr+G8EH4IHwQPggfhA9ye9Si2Hq9Fj4Iv4fwQfgg/5Hlcin7/f7vaJ0PYoEe
Eg6H9UZ/fn4+WVPnj9RNBvF6vZJKpaRarYrf7+f3EP41hA/CB6GC9Pt94YPwewgfhA/CB+GD
8EFMymq10hu81+vJbrfjr6nfGyQYDOoNrmZf+WvqdwZR6+g2m01fU7fb7fod8Mdr6vKR6XSq
dsIH+QXXkN+0psG/qPNB+CB8ED4IH4QPwgfhgzw8yHa7vdio7+/vojb1+tz31MfjsfzEca1a
awrIx4BPK5VKZ7d4PK6P0AuFgiQSCTn+WTablWg0qu8v1V/bksmkZqTuu7Xq81oaZDQaXfyL
UVMll76nrkboqtboSP3aca1a++MgatLw86nplnx1KruW41uLjDyu4zuP+lBTPWr/eZLUMiCH
D9fpdERtt9Yd3n/ukRu3RN1aZKS2UqmIx+PRjNTmcjlR9epOGp/PZ00QNWmoftHDqenWumun
sq9yuLXISK1CcDqdhmrVM1symYwUi0UJBALykP/28sMH4YPwwwfhg/DDB+GD8MMH4YPwwwfh
g/CbgA/CDx+ED8IPH4QPwg8fhA/CDx+ED8IPH4QfPggfhB8+CB+EHz4IH4QfM/MH1/IkxV9v
yMYAAAAASUVORK5CYII='
]

{ #category : #sources }
RTGrapherDecorationExample >> exampleMinAndMaxValues [

| b ds |
b := RTGrapher new.

ds := RTData new.
ds points: RTShape withAllSubclasses.
ds y: #numberOfMethods.
b add: ds.

b addDecorator: RTVerticalMinValueDecorator new red.
b addDecorator: RTVerticalMaxValueDecorator new blue.

b axisY noLabel.
b build.
^ b view
]

{ #category : #icons }
RTGrapherDecorationExample >> exampleMinAndMaxValuesIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACrElEQVR4XuXbvWvqYBjGYf/z
UhEKnTo41M1NMupUXFrEKQ6lgyB0EEEQFT9BrV93Tp+UlFSO57T1TdX+bgg1mD4m7/V+JNKm
goCfU0qK3wR8EH74IHwQfvggfBB++CB8EH74IHwQfvgg/PBB+CD88EH4IPzwQfgg/PBB+CD8
8EH44YPwQfjhg/BB+OGD8EH4OX+Q0WgkfvP+IMjLi3R3J3me9PwsPT2JD3DsEXJ9LT08SJeX
ku9/BLm9PQyo1WqJD/KFPD5KFxdBkMu9Nby95oe/qPNB+OGD8EH44YPwwwfhP6nzwx8hfBB+
+CB8EH74IHwQfvgg/PBB+CD8HA1kOBzyn9T5I4QPwg8fhA/CDx+ED8IPH4QfPggfhB/+kzof
hB8+CB/ktLJardTr9cQH4ef8QWazmbbb7XtvXi6Xv6pnLxYL2XY2IPP5XBabYtbrtabTqTab
zfsFdDodJdU4g8Eg/Mwkr886mMtOdrQpK/qXtWj0uPjT093GiY9M/pT1xUwmk8Qbr9lsKj4q
o/1fBaJaTUk0WnzferqtRTb92DQUvWejKr59dqraN3L+BRSdQ/RZ1oGS6ESHg/j+X09qcHUV
rhcuNrvwbrcbvh6Px/89fveYdrst++Zg3/EGsbtvx0e/Zz/j57BvOw2QmxsF9/f8+1X+cwgf
5NNJp9PhvF8sFlUqlQ4ayvl8PlwPrKbtZzIZlcvlb9csFAqvy17NWT3P81SpVJzVSwSk3++H
83ij0VC9Xj8IxH9do6yezeMRtl30d+tVq1Wn9ewGIpvNOquXSurp1b5vSqKmq6diV/Xszstl
Pf4awl/U+eGD8EH44YPwQfjhg/BB+OGD8EH44YPwwwfhg/DDB+GD8MMH4YPwwwfhg/DDB+GH
D8IH4YcPwgfhhw/CB+GHD4LNHyhras4H+gdeAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTGrapherDecorationExample >> exampleUsingLegend [

| clss b lb n ds |
b := RTGrapher new.

clss := Array with: RTElement with: RTEdge.
n := RTMultiLinearColorForIdentity new objects: clss.
clss do: [ :cls |
	ds := RTData new.
	ds points: (cls rtmethods sortedAs: #numberOfLinesOfCode).
	ds connectColor: (n rtValue: cls).
	ds y: #numberOfLinesOfCode.
	b add: ds.
].
	
b axisY; axisX.
b build.


"defining the legend"
lb := RTLegendBuilder new.
lb view: b view.
lb addText: 'Distribution of number of Methods in some classes'.
clss do: [ :aClass |
	lb addColor: (n rtValue: aClass) text: aClass name.
].
lb build.

^ lb view
]

{ #category : #icons }
RTGrapherDecorationExample >> exampleUsingLegendIcon [
	^ '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
gg=='
]

{ #category : #sources }
RTGrapherDecorationExample >> exampleValuesDecoration [
| b ds deco |

b := RTGrapher new.

ds := RTData new.
ds points: #(0 1 2 3 4 5 6).
b add: ds.

deco :=  RTHorizontalAllValuesDecorator new.
deco labelConversion: [ :value | '#', value asString ].
b addDecorator: deco.

deco :=  RTVerticalValuesDecorator new.
deco addAll: #(2 3 4).
deco labelConversion: [ :value | '#', value asString ].
b addDecorator: deco.

b axisX noTick; noLabel.
b axisY noTick; noLabel.
b build.
^ b view
]

{ #category : #icons }
RTGrapherDecorationExample >> exampleValuesDecorationIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACrUlEQVR4XuXbyYoiQRSF4Xpu
Nz6JuBFEfAHRjRMq4gSigjgh6EJwWjigeOy+TQtd3WJIU1Zm+h9IqMXFKuIzMrLiZnxcr/z4
KR/8IeCD8MMH4YPwwwfhg/DDB+GD8MMH4YPwwwfhhw/CB+GHD8IH4YcPwgfhhw/CB+GHD8IP
H4QPwg8fhA/CDx+ED/KfWa1Wogzk+XzWYrGQr0HG47H433k+CB+ED8IH4YPwQfggvoh+Zr/f
iw/ik1wuF+12Oz4I/5bFB+GD8MMHeX+Q7Xar2+LHB/EYZDKZKJPJKBqNarPZfBr8crksP4PY
ZuByudRbgTQaDdVqNc3n819X0GaI/Y/BX0P44YPwQfggfBA+yO8Mh0NVKhV1u13+Y6/XIPV6
XZFIRKVSSfl8/tPgDwYDTx57T6fTl/S2AwkyGo1kl6Hc2xHlzxD+GsIH4YPwQfggfJCAgNjm
om0sxuNxNZvNly7q393bDiTIdDpVp9NRsVjUq2fId/e2+bcsfvggfBB++CB8ED5IsEH82ttG
zxA/9rb5tyx++CB8EH74IHwQPog/Qay3bbvB1lt3Xfb24zvUfcW5/JfOkPV6LS/qnh0Yr+o8
A+GHD8IH4ScgINZNLBQKOhwOctWl02k983nWKra9L1ddIpFwdhetzrqQz/x9sVhMvV7PWZfN
Zu+2sj0HsddKk8mkwuHw1S5XXbVa1TOfZxj9fl+uOltcW62Ws84G+u+DRvfqUqnUP29m3qsL
hULK5XL+A7HDO7PZTHagx979ddXZI+PxeHTW2TvEj775tzrr8T9CvtXZz49myJ+/t91uO+us
xk6O8dcQ/hrCDx+ED8IPH4QfPggfhB8+CB+EHz4IH4QfPggfhB8+CB+EHz4IP3wQPgg/fBA+
CD98ED4IP3wQPgg/fBB++CDByA9txEgft66zuwAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTGrapherDecorationExample >> exampleVerticalAndHorizontalBars [

	| b ds p |
	b := RTGrapher new.

	ds := RTData new.
	ds points: #( 0 1 2 10).

	b add: ds.

	b minY: -3.33.

	p := RTHorizontalLineDecorator new.
	p add: 5; add: 7; add: 3.34.
	p shape line color: (Color red alpha: 0.3).
	b addDecorator: p.

	p := RTVerticalLineDecorator new.
	p add: 3.
	p shape line color: (Color blue alpha: 0.3).
	b addDecorator: p.

	b build.
	^ b view 
]

{ #category : #icons }
RTGrapherDecorationExample >> exampleVerticalAndHorizontalBarsIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABeCAYAAADVA7GfAAADiklEQVR4XuWby0ojQRSGfUd3
voJ7t0o2bhQUdOdS9AHcKC6ihohGFO+aRRIVgzHEGPF+ycn0X0yJzQyazqjdzvdD0d2Qsqvr
85yqc6qqq9XiK0nq4ncBHwhffCB8IHzxgfCB8MUHwgfCFx8IHwhffCB88YHwgfDFB8IHwhcf
CB8IX3wgfCB88YHwxQfCB8IXHwgfCF/JAnJ+fm66lstl43dnjEAEYHR01MbHxx2I3d1dazQa
r1Dq9Xrr8vIS1Zn39/euxAKkv7+/NTc3ZwMDA7aysmLDw8N2d3f3CuTo6MhoQB4fHy02IB8p
sBC+C+MD4QPhA+ED4QPhA+ED4QPhA+ED4evTgCgAGhkZMUlB4cLCgvX09IQidQWG9ULB7OKC
VV5e7NuBXF1dWW9vr21vb7vUSTqdttnZ2VBDiJF6rC5L1vH09GT+nu+y+GMIHwgfCB8IH8hn
AsHNsOKaZfEthO+y+ED4QH4QEMUdPhC8CPzm6uqqLS8vhwCcnZ2FlnT5+mILmZmZsWazaep4
Aenu7raTk5NXAPl83ipBCcJ1VoljUK9Wqy6HpU4/Pj62ra0tu729Nb7L4o8hfCBfBUTj0vPz
s/GBJASIJgB8q+K7LD4QvhIGRKuKwcIVHxbfQv5zIIo7xsbGXKdnMhltMg4BqFQqHW88fgmC
q7fr81H1L0vHNzc39vDw0NG7Y9/9rsb7e5W3KpVKOqLQUuAYtRQKBVtbW7NO6qoEmYNWp3UV
5B4cHHRUd29vz2q1WjxAFKVrt8n+/r5tbGy4TuRbSIwW8p6GhoZcTLG+vv5H0vEjTU9PuwAx
sDCbmJiIVFf/IHKfvg1R6ipJOjg46OpMTk46K2m37tLSUuid2Ww28nd/GRAdcZP1FItF070/
8tauBGNnZ8eZv//QdnV4eGiyLt+GqLO5qakp9/uo787lcqF36qqSCCDKAOt4mxKQGvjluqLU
V9LSp1Lm5+ctqqvzLkdt+Nv2pPck69LWJv2NdDrddr3T01Pz3636+nZlwfnTXn4cwgfCB8IH
wgfyI4BcX18rCHKdro3VuvpnPpAYgGgWoSMJPnbQ1T//noK6aJ2vbwKyuLhofX19bm09lUrZ
5uame+Z3aULHEL74QPhA+OID4QPhiw+ED4QvPhC++ED4QPjiA+ED4YsPhA+ELz4QPhC++ED4
4gPhA+GLD4QPhC8+ED4QvvhA+ED4SoJ+AbqWxW0ZX8E0AAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTGrapherDecorationExample >> exampleVerticalAndHorizontalLines [

	| b ds |
	b := RTGrapher new.

	b extent: 300 @ 200.

	ds := RTData new.
	ds noDot.
	ds points: (-50 to: 100 by: 0.1).
	ds y: [ :x | (0.1 * x) sin  ].
	ds noDot.
	ds interaction popupText: 'sinus'.
	ds connectColor: Color blue.
	b add: ds.

	ds := RTData new.
	ds noDot.
	ds points: (-50 to: 100 by: 0.1).
	ds y: [ :x | (0.1 * x) cos  ].
	ds noDot.
	ds interaction popupText: 'cosinus'.
	ds connectColor: Color red.
	b add: ds.

	b addDecorator: RTHorizontalTickLineDecorator new.
	b addDecorator: RTVerticalTickLineDecorator new.

	^ b
]

{ #category : #icons }
RTGrapherDecorationExample >> exampleVerticalAndHorizontalLinesIcon [
	^ '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'
]

{ #category : #accessing }
RTGrapherDecorationExample >> label [
	^ 'Grapher - Decoration'
]
