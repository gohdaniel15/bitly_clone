The skeleton of this Sinatra app was written by Holloway, Chew Kean Ho, who helped write the code as scaffolding for students to learn Ruby at the bootcamp where I learned to write this app. Credit for the app largely goes to him.

The app runs on a PostgreSQL server and is built on the Sinatra DSL. It is a one page app that takes any input (a long URL) and returns you a shortened one. 

To generate a short URL, simply copy and paste your long URL into the text-input box below the chain. 

When you click submit, the app will generate a shortened URL for you, and a button to copy your URL to your clipboard will appear at the bottom. Simply click it to paste it anywhere. 

Entering your short URL will direct you to the original long-url after being routed through my app. 

Additional info: clicking the arrow at the top pulls down a box with general information about the app. The glowing changing color of the chains was written in SMIL- although it is being deprecated, and should be replaced with CSS animations. 

All SVG images are obtained from www.flaticon.com.

One page app features are made using basic JQuery (slideToggles and fadeToggles) and AJAX. 
