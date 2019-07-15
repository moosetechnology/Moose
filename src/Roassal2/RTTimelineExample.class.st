"
RTTimelineExample new installTitle: 'SimpleGantt2' 
		code:
		'
| b s data |
data := #(     #(WP1 0 4)      #(WP2 4 8)     #(WP3 8 12)         #(WP4 3 4)     #(WP4 7 9)     #(WP4 10 12)   

  ).
b := RTTimeline new.
s := RTTimelineSet new.
s objects: data.
s lineIdentifier: #first.
s start: #second.
s end: #third.
b add: s.
b axisX
	noDecimal;
	title: ''Month'';
	numberOfLabels: 12.
b build.
^ b view'
"
Class {
	#name : #RTTimelineExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-Builder-Timeline'
}

{ #category : #sources }
RTTimelineExample >> exampleClassAges [

	| data b s |
	data := (RTShape withAllSubclasses sortedAs: #ageInDaysRounded) select: #hasMethods.

	b := RTTimeline new.
	b extent: 400 @ 600.
	s := RTTimelineSet new.
	s objects: data.
	s start: [ :cls |  cls computeYoungestMethod ageInDays ].
	s end: [ :cls | cls computeOldestMethod ageInDays ].
	b add: s.
	
b build.
^ b view
]

{ #category : #icons }
RTTimelineExample >> exampleClassAgesIcon [
	^ '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'
]

{ #category : #sources }
RTTimelineExample >> exampleColorPerEntry [

	| data normalizer b s d |
	data := #(#(c1 0 5) #(c1 6 8) #(c2 0 5) #(c2 8 10) #(c3 0 10) #(c4 5 10) #(c5 5 8)).
	normalizer := RTMultiLinearColorForIdentity new objects: data.

	b := RTTimeline new.
	
	s := RTTimelineSet new.
	s objects: data.
	s shape color: normalizer.
	s lineIdentifier: #first.
	s start: #second.
	s end: #third.
	b add: s.
	
	b axisX 
		numberOfLabels: 5;
		labelRotation: -45;
		labelConversion: [ :v | Date year: 2015 day: v ]. 

	d := RTVerticalTickLineDecorator new.
	d shape line color: Color white.
	b addDecorator: d.
	
b build.
^ b view
]

{ #category : #icons }
RTTimelineExample >> exampleColorPerEntryIcon [
	^ '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'
]

{ #category : #sources }
RTTimelineExample >> exampleColorPerTimeLine [

		| data normalizer b s d |
	data := #(#(c1 0 5) #(c1 6 8) #(c2 0 5) #(c2 8 10) #(c3 0 10) #(c4 5 10) #(c5 5 8)).
	normalizer := RTMultiLinearColorForIdentity new objects: #(c1 c2 c3 c4 c5); command: #first.

	b := RTTimeline new.
	
	s := RTTimelineSet new.
	s objects: data.
	s shape color: normalizer.
	s lineIdentifier: #first.
	s start: #second.
	s end: #third.
	b add: s.
	
	b axisX 
		numberOfLabels: 5;
		labelRotation: -45;
		labelConversion: [ :v | Date year: 2015 day: v ]. 

	d := RTVerticalTickLineDecorator new.
	d shape line color: Color white.
	b addDecorator: d.
	
b build.
^ b view
]

{ #category : #icons }
RTTimelineExample >> exampleColorPerTimeLineIcon [
	^ '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'
]

{ #category : #sources }
RTTimelineExample >> exampleGantt01 [

	| data b s |
	data := #(#(c1 0 5) #(c1 6 8) #(c2 0 5) #(c2 8 10) #(c3 0 10) #(c4 5 10) #(c5 5 8)).

	b := RTTimeline new.
	
	s := RTTimelineSet new.
	s objects: data.
	s lineIdentifier: #first.
	s start: #second.
	s end: #third.
	b add: s.
	
	b axisX 
		numberOfLabels: 5;
		labelRotation: -45;
		labelConversion: [ :v | Date year: 2015 day: v ]. 
	
	b build.
	^ b view
]

{ #category : #icons }
RTTimelineExample >> exampleGantt01Icon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEJUlEQVR4XuWcSUsrQRSF/YOC
CP6N7NyooETciCiCOCLOOKEoDgRBY5wVp2gcQBBxwgF048KF3LzcfvQuPqqfSXeV34EimyNW
5+uquqe6UyXZLF82qYT/FfCB8MUHwgfCFx8IHwhffCB8IHzxgfCB8MUHwhcfCB8IX3wgfCB8
8YHwgfDFB8IHEo5eX18liot8exPJZH7e7u9FfhWQdDodCZCLC5HOzp+3ZJIPhA+kEDo7O5Pn
52fhA7EAiMI4PT2VqqoqPhAbgHR3d8v5+bksLS3xgfDXED4QPhA+kOhySBi5hT9CithWVvhA
+EC+0/LysvCBWABEc0hfX5/U1NTwgdgARHPI34X0jQ+Ev4bwgfCBuAxkfz8dSR6IqlmfQzY3
05HcqVE160cIH0hEQG5ubmRtbU34QCzJIfoZj8f5QGzJIZeXl7K4uMgHwl9D+ED4QFzPIbkl
JvT28FCYB0vv78H+Lz+HFPlJX9DEz5+y+EC+L3339vaED8SiHLKwsMAHYksOSSaT2draWv6U
xV9D+ED4QPg5pHA5RN/XKnau4I+QACMk6B3/695c5AOJCMjn56ckEgnhA7EAiJ9DGhsb+UBs
AKI55OjoSFzIIfw1hA+ED4QP5B86PDyUTCZj3IL6Dw4OrPJrsxrI3d2dFNN/e3vrtD90IHw5
DESzjMv+3d1dsRqIlsOtra3GnWxubpbt7W1n/VNTU1JXV2fnlJXLJN6bjPkeWuVTU1OT51td
XXXSrzks90xITP2hAuno6JCTkxMpLS016pxeiMLr6upy0q8nWIyOjua23lfsmrL0NIeGhgZv
2M7Ozhp1rr+/3zsBoqWlxUm/Qmtra5Pq6mqxblHX10mfnp6kp6fHqHP+8N7Y2HDSv76+7vnK
y8vFuipLK4yysjJRmeaNkZER74wUF/0Kb35+Pu/7zJECubq68uba3t5emZmZMeqc3oF68foj
UZNka5tfK6/29nZJpVLi73RbA0TnT+2Yabm3tbUlx8fHMjc356T/+vpa9LcwAwMDYl0w1GlK
y0P9jbppKal34+TkpJN+PRhBi5b6+nqxLqnv7OzI8PCwNzpM/C8vL57X9E60za9TswbF6elp
sW7rRGt0XdRM6nStuvRTL17nXdf8qsfHR68UzndAW+RAdHugoqLC+GL81O6XiC76NSgWYvEu
KJCPjw+ZmJiQWCwm+Q6Z+S5k+Xejib+ysjKQX/vjTz1BtkNM/X4C10XctJwPdYSMjY1560aQ
vzENWSrd9xofHzf260jVKs/Ur1+waWgdGhrypuWfJPCiAPn6+hJ/4ywLU2fuGW4Y/6ck6HbI
4ODgf2+c8VWEKUtTOP9rswgIX3wgfCB88YHwxQfCB8IXHwgfCF98IHwgfPGB8IHwxQfCFx8I
HwhffCB8IHzxgfCB8MUHAtEfxTYBJq0poOcAAAAASUVORK5CYII='
]

{ #category : #sources }
RTTimelineExample >> exampleLabelledAndColored [

| b s data |
data := #(     #(WP1 1 3)      #(WP2 3 6)     #(WP3 6 9)         #(WP4 9 12)     #(WP5 1 12)    ).
b := RTTimeline new.
s := RTTimelineSet new.
s shape box 
	color: Color blue trans;
	withText: #first;
	withTextColor: Color white.
s objects: data.
s lineIdentifier: #first.
s start: #second.
s end: #third.
b add: s.
b axisX
	noDecimal;
	title: 'Month';
	numberOfLabels: 12.
b build.
^ b view
]

{ #category : #icons }
RTTimelineExample >> exampleLabelledAndColoredIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAADRUlEQVR4XuXb2UsqcRjG8f7/
qy5bIYhuu2ghKrKiRSsibHUJhtI2csmCFrGnfE8cmhmtI0fLn/N9wAtfasT5zG95a6bv7Y0f
l9LHPwV8EH74IHwQfvggfBB++CB8EH74IHwQfvgg/PBB+CD88EH4IPzwQfgg/PBB+CD88EH4
4YPwQfjhg/BB+OGD8EH+I+VyWeHawIAU1RcfhA/CB3Ea5P7+XrlcTolEQnNzc1paWtLt7a26
CbKxIS0uSjMz0uysNDkpra5CQPr7+7W5ual4PK7Ly0u9vr7Wv/xqV0GGh6VYTJqf/wCx2uio
NDICnLJeXl7En7L4awgfpB2QnR0pqq+eBHE97YyQk5POoPBB+CB8kF/pQzzP09PTk6IEYlvm
lRVpYeGzr1lfdxQk3IccHh7KkKI2QqampNPTz76mfv1pfJw/ZfGnLD4IH6TraacPqf8Zjw/i
6lXOB+GD8EGcAwn3IbbtPT8/l2sgzXqJsbEIgoT7kMfHRx0cHMjFERLuJb76/0ikpqxqtSr+
lMVfQ/ggroO40EtEDqSdqzyVUs81pHwQPggf5Nf7ENvyXl1d6SdAmvUSQ0N8kG/7kLOzM/3k
CAn3EvWP5oPwpyw+CB/EBZBe7yV6BoRylfNB+CB8EOf7kL29vZbvfrfnOKanP57jsPcTE8Ft
LB+kA31IPp9vGcR6Cf+DNIOD0tYWH4Q/ZfFB+CBOgVB6CSdBbE2xhd//alazjUErtXZ+t1nN
bsjoZK1YLLp9oxw/fBA+yFdJp9M6Pj5uaQin6iu4/709Xr27uxuo2f9Z7Jj+WjabDdwHZtne
3m7YflsqlUqgZsf337JkyWQySiaTgZo9dx/+XKvt7+831C4uLtydsmxBD58EO1Hhk+V53pvN
7/6afbFCodDw5cI1O9bd3V2g9vDwoJubm3+emOvr64afs+M9Pz8Hatb0Hh0dNdSs/wrX1tbW
+GtIN2MjzJriv5A20m3U2mgOI/JBfiE2lZVKJS0vL//BsCk6FouJP0K6nFqtpu/e80H4uyx+
+CB8EH74IHwQfvgg/PBB+CD88EH4IPzwQfgg/PBB+CD88EH44YPwQfjhg/BB+OGD8EH44YPw
Qfjhg/DDB3E375rcxfOvBJoWAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTTimelineExample >> exampleNestedTimeLine [

	| b s data |
	data := #(#(c1 0 5 1) #(c1 3 8 2) #(c2 0 9 1) #(c2 3 5 2) #(c2 6 8 2)).

	b := RTTimeline new.
	
	s := RTSubTimelineSet new.
	s objects: data.
	s lineIdentifier: #first.
	s start: #second.
	s end: #third.
	s level: #fourth.
	b add: s.
	
	b axisX 
		numberOfLabels: 5;
		labelRotation: -45;
		labelConversion: [ :v | Date year: 2015 day: v ]. 
	^ b 
]

{ #category : #icons }
RTTimelineExample >> exampleNestedTimeLineIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACyUlEQVR4XuXc2WryQBjG8d7/
FRTaI2nxOgSpSwSpouK+4XaitrhGfdu8H/SgBctMifON/h+Ys6dhml+MyUzp3ccHPz7ljn8K
+CD88EH4IPzwQfgg/PBB+CD88EH4IPzwQfjhg/BB+OGD8EH44YPwQfjhg/BB+OGD8PN/Qd7e
REjDe5D7exHS4IPwQfggfBA+CB+ED8IH4YPwQfgg7kGWy6XwQTwA6fV6Uq/XZbfbfZvU+7tI
nOPhwX68vLg7njcg7XZbyuWyJJNJ2W634tMtMAjOn6i4j4dbXOSD8EH4IHwQPggfhA/CB+GD
8EEAIE9PIrbj9fX8CYz7eN6D+LDPHYYivl9oqMXFTocPwgfhg/BB+CB8ED4IH4QPwgfhg9wy
yH6/Fz6IByBfe+rpdFou+ab++Gg/EgmR5+f4Rr9/BUsnX3vqiei3P51Ocsu3wOhX5S8u8kH4
IHwQPggfhA/CB+GD8EH4ICCQv+yBxz2u4sXwXIIgENLAfUJuNXwQKshwOBSb7s/V4lvuOwWR
KJPJRLrdrtj0O9FaOaHvFOR4PIqu/k6nUzHt96NHlzAMvenbzt+m7xxkPp+L7o9oTPvValVs
jn/pvu38bfpOQQqFgtXE9Koi9Z2B6JdZq9WSbDZrPLnxeCy1Wg3TdwqiED+3b3/LarWSSqWC
6TsF0TfUZrNpPDm935L6TkEajYbxo57utedyOdGfIfSdgujkisWi1ZWi91zb75hr7jsD0Y+s
fl/on/2Y9Eej0b/ebDYz6q/Xa6u+PulsNhsx7esLnM3x9YFF32NM+05B9GQdDgfrKyWVSln1
M5mMcV//v0o+n7c6/mAwMO4vFgsplUri3VqWYmj+ujzAzwU+ITZXLj+eLJ3wwwfhg/DDB+GD
8MMH4YPwwwfhhw/CB+GHD8IH4YcPwgfhhw/CB+GHD8IPH4QPwg8fhA/CDx/kRvMJxf6wAB6O
MLQAAAAASUVORK5CYII='
]

{ #category : #sources }
RTTimelineExample >> exampleSimpleGantt [

	| data b s d |
	data := #(#(WP1 0 5) #(WP2 5 8) #(WP3 7 10)).

	b := RTTimeline new.
	
	s := RTTimelineSet new.
	s objects: data.
	s lineIdentifier: #first.
	s start: #second.
	s end: #third.
	b add: s.
	
	b axisX 
		numberOfLabels: 5;
		labelRotation: -45;
		labelConversion: [ :v | Date year: 2015 day: v ]. 

	d := RTVerticalTickLineDecorator new.
	d shape line color: Color white.
	b addDecorator: d.
	
b build.
^ b view
]

{ #category : #sources }
RTTimelineExample >> exampleSimpleGantt2 [

| b s data |
data := #(     #(WP1 0 4)      #(WP2 4 8)     #(WP3 8 12)         #(WP4 3 4)     #(WP4 7 9)     #(WP4 10 12)   

  ).
b := RTTimeline new.
s := RTTimelineSet new.
s objects: data.
s lineIdentifier: #first.
s start: #second.
s end: #third.
b add: s.
b axisX
	noDecimal;
	title: 'Month';
	numberOfLabels: 12.
b build.
^ b view
]

{ #category : #icons }
RTTimelineExample >> exampleSimpleGantt2Icon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAC5UlEQVR4XuXcy2rqUBSH8b6L
T+jQkb6AIGKhE2fOFMGRU3HiDRHvVxC8X/E2UdHlcTtKoocjNa3J+f4QpKtmR/NLdrpq2o/L
hR8r5YO/C/gg/PBB+CD88EH4IPzwQfgg/PBB+CD88EH44YPwQfjhg/BB+OGD8EH44YPwQfjh
g/DDB+GD8MMH4YPwwwfhg3wjq9VKvrvu15eIcWk0xNTxHi31+v02XlmXD8IH4YPwQfggjzMa
jSSVSonf7xen0ynb7Vbcbjcf5F0gDodDvF6v+Hw+yeVyUqlUxOVyCR+EP2XxQfggfBA+yDtB
rpckMS7zuZg63rPbeGXd/wbkN/Lskc8/Q/ggfBA+CB/k5zv1RCIhwWBQ+CAW6dT3+72Ew2E+
iFWmrNPpJPwpi38N4YPwQfggP5JnO3B+p26zI9rs8EH4IHwQPggBxNipJ5NJCYVCwgexSKde
rVal3W7zQfhTFh+ED8IH4YNYDsSqnbVtQD4/V6Ye0a/cdWKn8EH4IHwQPggBxNipq8aQD2Kh
Tp1/hvCnLD4IH4QPwgcxK8nkCtFZ2wZkMBjc/u5Quzyq9fv9p2qvrPuo1uv1TK0tl0tr3+TA
Dx+ED/K3NJtNqdVqT53CjevVWvv1+XyWfD6vq43HY1Fjamvq00k1dWhr2Wz2NrUZt7HZbHQ1
NX65XNbVWq2WFItFXW1+vXCpbc9mM9HW1GOpVLqrPdq2JUDUr96NO0G9WOML7na7FzW/a2vD
4VAWi8XdGzPW1Fjr9VpX2+12Mp1O/7lTJpPJ3fPUeOqGcW0tnU7f7WhVUweN9gBRNfV+69cP
WfhT1psSiUQkEAhIJpO5YcRiMYnH41IoFER9jw/yy1E7v9PpiMfjuWFEo1H1nyz4Z8i7czwe
dQiHw0H4IPyfsvjhg/BB+OGD8MMH4YPwwwfhg/DDB+GD8MMH4YPwwwfhg/DDB+GHD8IH4YcP
wgfhhw/CB+GHD8IH4YcPwg8fxB75A+4RqV/eY8yIAAAAAElFTkSuQmCC'
]

{ #category : #icons }
RTTimelineExample >> exampleSimpleGanttIcon [
	^ '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'
]

{ #category : #sources }
RTTimelineExample >> exampleThresholdLines [

	| data b s p |
	data := #(#(c1 0 5) #(c1 6 8) #(c2 0 5) #(c2 8 10) #(c3 0 10) #(c4 5 10) #(c5 5 8)).

	b := RTTimeline new.
	
	s := RTTimelineSet new.
	s objects: data.
	s lineIdentifier: #first.
	s start: #second.
	s end: #third.
	b add: s.
	
	b axisX 
		numberOfLabels: 5;
		labelRotation: -45;
		labelConversion: [ :v | Date year: 2015 day: v ]. 

	p := RTHorizontalTimelineDecorator new.
	p addLineAboveIdentifier: #c3.
	p addLineAboveIdentifier: #c2.
	p shape line width: 1; color: (Color red).
	b addDecorator: p.

	b build.
	^ b view
]

{ #category : #icons }
RTTimelineExample >> exampleThresholdLinesIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEJElEQVR4XuWcWy9rQRzFfTWP
PoBvwCfAi3hweyEuER7QuFekCA4ROQ51bSh1qVRIvbg2LolUjgcVluO/cyQkJzXb6W7/Y61k
0pfVdu/9m/nPrJmmeS8v/NKkPP5HwA+EX/xA+IHwix8IPxB+8QPhB8IvfiD8QPjFD4Rf/ED4
gfCLHwg/EH7xA+EHwi9+IPxAsqObmxvk4iZvb4FYLDPtWwGJRqM5AXJwALS3Z6bxA+EHklmd
n5+DH4gCII2NjUgmk/D5fPxANACpqKjA8fExamtr+YHwzyH8QPiB8APJTQ7xOrfwjxCPGz8Q
fiDpdXd3B34ginJIfn4+PxAtOeTo6AglJSX8QPjnEH4g/EBsBBL/+QtJX4Cm/Q6GdQMJhaI5
66m5aMEg+IHwA3FxHsIPREEOqamp4QeiJYecnJygqqqKHwj/HMIPhB+IjUBymUMQ+P+W8rv7
zsQP/hzi6UnfVxI/PxB+IOmVSCTAD0RRDuno6OAHoiWHbG9vo6CggB8I/xzCD4QfiI1AIpEo
9veRk/av65Hfa2XiczIp6hGSjR7PD4QfSHo9Pj6CH4iiHLKxscEPREsOkdPC4uJifiD8cwg/
EH4gNgKRrZRYLGbc3Pq3trZU+aWpBnJ2dgYv/aenp1b7sw6EX8qAFBUVGfeYcDiM9xnGNv/D
wwNUAxkYGEBpaSmWl5eNLnRpaQmRSARTU1PW+eVQrqmpCWtrazpL1sLCggOi/XWZ8pk3lUo5
Ny3vkXBpm1/C8MrKCkZHRzE0NKQPSG9vL2ZnZ9Hc3PzpxQk06VWLi4vw+/3W+UXj4+O4v79H
T0+PvpIlvUVeV1dXjS5OemNdXZ3Tw2z0i0+ATExM4Pn5WReQ6+trZ5i7ec/f0mCt/22uUbnK
OniNwaYXJ2VB/CY1Wqt/eHgYlZWVULfslV+7y7Dt7u42GrayGywTYF9fHy4uLqzzSzmem5tz
Op/ctyog8/Pzzs20tbW5Wt+//8cgm/wCb3d313jpnFUge3t7WF9fx+bmJkzhtbS0YHBw0Eq/
aGZmBp2dnVCX1OPxOOrr6xEKhYwvToLT2NiYlX68Ss56BKK6rZO39bkMdRO/pFipt8Fg0Dq/
eN9KmmQTdXtZUqImJychQ9dNajd9WBr9Mor6+/s9Oxf5EpDLy0undlZXV3/47e5niV1e5W//
RJ/5y8rKXPll2SnZx9Tf0NBg/PlXV1fo6upyVo2tra2eHlJ9eYSMjIwYT+Dvl4im3unpaQQC
AWN/YWGhq9VdeXn5hz/oTCfZGJXSLK9ebzW5AvL09ISdnR3XCfw7yGRjNOtADg8Pnfrppuby
y+OSJbWU/7EpnEP4xQ+EHwi/+IHwA+F/BPxA+MUPhB8Iv/iB8APhFz8QfiD84gfCD4Rf/ED4
xQ+EHwi/+IHwA+EXP5Bvrj8Ikrxg3UeEpgAAAABJRU5ErkJggg=='
]

{ #category : #accessing }
RTTimelineExample >> label [
	^ 'Time line'
]
