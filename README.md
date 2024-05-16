Week 5 Short Answers

 a) _________ are used to customize the appearance and behavior of a View.
 -modifiers 

 b) The basic building block of a SwiftUI interface is a ______________.
 -view

 c) Each View in SwiftUI is a ___________ type.
 -struct 

 d) List two ways you can find the modifiers of a View.
 -the library in the second tab
 -SwiftUI inspector 

 e) True or False: A modifier changes a View.
 -false - it returns a new view with the modifications 

 f) Modifiers are performed and returned in __________ from the _______________ they are applied to.
 -order
 -views

 g) When the data driving a View changes, that View has to be ____________ to reflect the change.
 -re-rendered

 h) True or False: The @Binding establishes a two-way communication between Views.
 -True - you pass a direct communication line when using @State and @Binding

 i) @State works with _________ types and @StateObject works with ____________ types.
 -Value 
 -Object 

 j) True or False: A @State property can be defined as let (constant).
 True

 k) A List is a specialized version of a ___________ stack.
 -LazyVStack

 l) The default alignment of a VStack is ____________, and the default alignment of the HStack is __________.
 -VStack default - Center Horizontal 
 -HStack default - Center Vertically

 n) A stack always gets one  ________________from each of its children.
 -Alignment guide

 o) The alignment guide for an HStack is ______________. And the alignment guide for a VStack is _______________.
 HStack - vertical alignment
 VStack - horizontal alignment 

 p) Grids only come in ____________ variants.
 -lazy

 q) The Grid Item Array defines the _______________ of the Grid.
 -layout



 Week 6 short answers 

a) In SwiftUI, you describe your interfaces _____________ and leave the ___________ to the Framework.
-declaratively 
-rendering

b) When a View first appears, and you want it to animate in, you can do so in the Views ___________ modifier.
-transition 

c) In Swift, the native types ______________ and ____________ implement the Hashable protocol
-String
-Int

d) ____________ is how long an animation takes to complete.
-Duration

e) The ScrollViewReader requires each view inside the ScrollView to have a unique ___________ to identify and navigate to them.
-identifier

f) ____________ protocol’s only requirement is to have an id property that conforms to Hashable.
-ForEach

g) A ____________ Grid lets you specify an exact size for a column or row.
-fixed

h) ________________ allows you to scroll to any position inside a ScrollView programmatically.
-ScrollViewReader

i) True or False: All animations in SwiftUI are interruptible and reversible by default.
-true

j) The _________ defines how items in a Grid should be sized and aligned.
-aspectRatio(_:contentMode:)

k) Wrap any changes you want to animate in a call to  _________________
-state variable 

l) The native SwiftUI grid view builds on the _____________ and _____________ views.
-LazyHStack and LazyVStack

m) The __________ method of ScrollViewReader is used to navigate to a particular position in a ScrollView.
-scrollProxy

