# mailbox
Week 3 CodePath Assignment

The purpose of this assignment is to leverage animations and gestures to implement more sophisticated interactions.

Time spent: #12 hours

#Project Requirements

 - On dragging the message left...
   - Initially, the revealed background color should be gray.
   - As the reschedule icon is revealed, it should start semi-transparent and become fully opaque. If released at this point, the message should return to its initial position.
   - After 60 pts, the later icon should start moving with the translation and the background should change to yellow.
     - Upon release, the message should continue to reveal the yellow background. When the animation it complete, it should show the reschedule options.
   - After 260 pts, the icon should change to the list icon and the background color should change to brown.
     - Upon release, the message should continue to reveal the brown background. When the animation it complete, it should show the list options.
 - User can tap to dismissing the reschedule or list options. After the reschedule or list options are dismissed, you should see the message finish the hide animation.
 -  On dragging the message right...
   - Initially, the revealed background color should be gray.
   - As the archive icon is revealed, it should start semi-transparent and become fully opaque. If released at this point, the message should return to its initial position.
   - After 60 pts, the archive icon should start moving with the translation and the background should change to green.
     - Upon release, the message should continue to reveal the green background. When the animation it complete, it should hide the message.
   - After 260 pts, the icon should change to the delete icon and the background color should change to red.
     - Upon release, the message should continue to reveal the red background. When the animation it complete, it should hide the message.
 - Optional: Panning from the edge should reveal the menu
  - Optional: If the menu is being revealed when the user lifts their finger, it should continue revealing.
  
#Demo GIF
(demo does not include edge pan - feature added last mintue)

<img src='AssignmentWalkthrough.gif' title='Assignment Walkthrough' width='' alt='Walkthrough of the Mailbox Assignment.'/>

#License
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.

You may obtain a copy of the License at: http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
