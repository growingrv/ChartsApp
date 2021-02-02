# ChartsApp - Intuit Craft iOS Assignment

## Functional/implementation details:

* As per instructions, created an app named ChartsApp and a library named ChartsLib.
* The library is distrubuted privately as pods. 
* /ChartsLib/ contains the source code and podspec file(s) used to implement library's behaviour. 
* /ChartsApp/ contains the source code and podfile file(s) used to implement app's behaviour and to integrate ChartsLib.
* Install pods and open workspace to run the app.
* The app contains and controls the data of JSON files.
* The app passes contents of JSON files in form of Data to the library. 
* For keeping it modular, 2 JSON files are used to provide respective data. This also aligns with the the concept of micro-services.
* BenchmarksInfo.json contains the details of benchmarking ranges (e.g. benchmarking range 825-900, benchmarking levels, benchmarking percentage value etc). 
* ScoreInfo.json contains the details of a user's score. 
* On changing the value in JSON files, the UI also gets updated. 
* The library contains the UI and renders based on incoming data from the app. 
* The library is written as a modular entity where-in UserScore & Benchmark are 2 modules of UI being rendered. 

## Design Considerations:

* Used MVVM-C design pattern.
* The coordinator:
    * Instantiates and contains module specific instances e.g. views & viewModels etc
    * Instantiates & injects dependencies into the views & viewModels etc
    * This makes the code modular and both views & viewModels lighter. 
* MVVM-C keeps the code structured and enhances its readability and maintainability. 
* Have kept minimum possible code in VCs and kept business logic separate from VCs.
* For Benchmark modules, have segregated dataSource also from VC so that VC becomes even lighter. 
* Logical and reasonable usage of main Swift features like Extensions, Optionals, Tuples, Extensions, Structs and Generics.
* Minimum to no use forced unwrapping.
* Have written a reusable view component to render the circular layer with animaiton. 
* Followed 4 design principles:
    * S.O.L.I.D
    * Clean architecture
    * DRY (Dont repeat yourself)
    * POLA (Principle of least astonishment)
* Taken care of coding standards and conventions.
* Have considered cyclomatic complexity.
* Length of methods and file are as per standards.
* Have written modular code which has many "plug & play" components.

## Limitations
* The circular animation is indicative rather than being accurate. It can be made more accurate by coupling it with credit score rating formula.
* I had plans of using Configuration for rendering UI based on configuration passed from client. Configurations are created but not used much. 
* I had plans of showing/hiding the activity indicators properly, this could not be done. 

## Possible Improvements
* UTs and UI testing is not done yet.
* UI can be further improved to meet the requirements more closely. 
* The podspec also needs to be improved. As of now, although it work fine, but the structure of pods is not perfect.
