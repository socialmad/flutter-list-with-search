# flutter_challenge run

- flutter pub get (run this command in terminal).
- flutter run (Connect the device or simulator and run this command in terminal to run the application).




### why a “scroll to index” behaviour is not as straightforward. 

Unfortunately, ListView has no built-in approach to a scrollToIndex() function. 
We’ll have to develop your own way to measure to that element’s offset for animateTo() or jumpTo().
- jumpTo({index, alignment})
- scrollTo({index, alignment, duration, curve})

Reference : (https://pub.dev/packages/scrollable_positioned_list)




### README.md file the approach taken to solve the challenge and the architecture of the app. 

- Top-down approach
    Top-down strategy of information processing and knowledge ordering,
    used in a variety of fields including software, humanistic and scientific theories,
    and management and organization.
- Constants
    In constants folder i have used the color, font and string constants.
    In screens folder i have used the app initial screen and detail screens
    In widgets folder i have used the custom widgets.
    



